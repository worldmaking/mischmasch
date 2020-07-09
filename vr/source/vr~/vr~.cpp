#include "vr~.h"

/*
 
 Main capabilities of Steam Audio:
 
 NON-ENVIRONMENTAL:
 
 panners:
 
 mono -> hrtf
	iplCreateBinauralEffect + direction
 mono -> speaker
 mono -> ambi
	iplCreatePanningEffect + direction
 speaker -> ambi? (not sure if this is included)
	iplCreatePanningEffect + direction
 
 translators:
 
 ambi -> hrtf
	iplCreateAmbisonicsBinauralEffect
 ambi -> speaker
	iplCreateAmbisonicsPanningEffect
 speaker -> hrtf
	iplCreateVirtualSurroundEffect
 ambi rotate
	iplCreateAmbisonicsRotator
 
 
 ENVIRONMENTAL
 
 creating a scene
 
	one or more materials, one or more meshes, each triangle has a material ID
	
 
 direct sound (direction independent) fx:
 
	iplCreateDirectSoundEffect()
 get parameters (direction, distance atten, absorp, delay, occlusion, transmission factors):
 iplGetDirectSoundPath(env_renderer, listener pose, source pos + radius, settings)
 iplApplyDirectSoundEffect()
 seems designed for use with mono sources, but maybe it can also apply to virtual speakers?
 
 convolution fx:
 
	direction-dependent convolution reverb encoded in ambisonics
	
	iplCreateConvolutionEffect()
 
 put source in:
 iplSetDryAudioForConvolutionEffect() + position
 get reverb out:
 per source: iplGetWetAudioForConvolutionEffect()
 all sources: iplGetMixedEnvironmentalAudio()
 
 baking & probes:
	not sure if this is something useful for Max?
	if there's a desire to use baked rendering (lower cpu but higher memory cost)
 probes are needed to bake
 
 Generally:
 
 each source mono sound goes through a direct sound fx then an hrtf or speaker layout
 and also goes through a convolution mixer to an ambisonics bus that is decoded to hrtf or speaker layout
 docs also suggest mixing all sources into another convolution located at the listener position
 (i.e. all sources go into two reverbs)
 */

static t_class * static_hrtf_class = 0;
static t_class * static_ambi2hrtf_class = 0;

// Static state (shared by all):
struct VR_Phonon_Global {
	
	IPLContext context;
	IPLRenderingSettings settings;
	
	IPLAudioFormat mono_format;
	
	IPLHrtfParams hrtf_params;
	IPLAudioFormat hrtf_format;
	IPLhandle binaural_renderer = 0;
	
	// Only required if using Radeon Rays for ray tracing, or if using TrueAudio Next for convolution:
	IPLhandle computeDevice = NULL;
	IPLSimulationSettings simulationSettings;
	IPLhandle scene = 0;
	IPLhandle environment = 0;
	IPLhandle environmental_renderer = 0;
	
	// attr
	glm::vec3 position, position1;
	glm::quat quat; // the listener's head orientation
	float head_radius;
	
	
	VR_Phonon_Global() {
		
		head_radius = 0.1075; // per https://en.wikipedia.org/wiki/Sound_localization
		
		// default position
		position.x = 0.;
		position.y = 1.6;
		position.z = 0;
		
		// default orientation has no transform:
		quat.x = 0;
		quat.y = 0;
		quat.z = 0;
		quat.w = 1;
		
		// TODO: consider mapping to sysmem handers?
		context.allocateCallback = 0;
		context.freeCallback = 0;
		context.logCallback = log_callback;
		
		// use default convolution setting, as the alternative depends on AMD gpus
		settings.convolutionType = IPL_CONVOLUTIONTYPE_PHONON;
		// initialize with zero to make sure that setup() allocates objects:
		settings.frameSize = 0;
		settings.samplingRate = 0;
		
		mono_format.channelLayoutType	= IPL_CHANNELLAYOUTTYPE_SPEAKERS;
		mono_format.channelLayout		= IPL_CHANNELLAYOUT_MONO;
		mono_format.numSpeakers			= 1;
		mono_format.channelOrder		= IPL_CHANNELORDER_DEINTERLEAVED;
		
		hrtf_format.channelLayoutType	= IPL_CHANNELLAYOUTTYPE_SPEAKERS;
		hrtf_format.channelLayout		= IPL_CHANNELLAYOUT_STEREO;
		hrtf_format.numSpeakers			= 2;
		hrtf_format.channelOrder		= IPL_CHANNELORDER_DEINTERLEAVED;
		
		// TODO attrify, esp. maxConvolutionSources and ambisonicsOrder
		// TODO if any of these change, need to run setup_scene and setup_environment again
		// which in turn may require other vr~ objects to rebuild
		// (maybe dsp chain broken?) -> dspchain_setbroken(dspchain_get());
		simulationSettings.sceneType = IPL_SCENETYPE_PHONON; // other options available
		simulationSettings.numRays = 1024*32; //typical values are in the range of 1024 to 1024*128
		simulationSettings.numDiffuseSamples = 32*32; //typical values are in the range of 32 to 32*128
		simulationSettings.numBounces = 8; //typical values are in the range of 1 to 32.
		simulationSettings.irDuration = 2; //typical values are in the range of 0.5 to 4.0
		simulationSettings.ambisonicsOrder = 2; // typical values are between 1 and 3
		simulationSettings.maxConvolutionSources = 32; // max no. of sound sources
	}
	
	~VR_Phonon_Global() {
		cleanup();
	}
	
	void cleanup() {
		if (binaural_renderer) iplDestroyBinauralRenderer(&binaural_renderer);
		if (environment) iplDestroyEnvironment(&environment);
		if (environmental_renderer) iplDestroyEnvironmentalRenderer(&environmental_renderer);
		if (scene) iplDestroyScene(&scene);
	}
	
	static void log_callback(char* message) {
		object_post(0, "vr~: %s", message);
	}
	
	static void finalization_progress_callback(IPLfloat32 progress) {
		object_post(0, "vr~: scene finalized %d%%", int(progress * 100));
	}
	
	void setup(double samplerate, int framesize) {
		
		if (samplerate != 24000 && samplerate != 44100 && samplerate != 48000) {
			object_error(0, "vr~: unsupported samplerate %f; only 24000 Hz, 44100 Hz, and 48000 Hz are supported", samplerate);
			return;
		}
		if (framesize > 4096) {
			object_error(0, "vr~: unsupported vectorsize %d; up to 4096 supported", framesize);
			return;
		}
		
		// various options:
		hrtf_params.type = IPL_HRTFDATABASETYPE_DEFAULT; // or CUSTIOM
		hrtf_params.hrtfData = 0;	// Must be NULL.
		
		// TODO: allow custom HRTFs; implement these:
		hrtf_params.numHrirSamples = 0;
		hrtf_params.loadCallback = 0;
		hrtf_params.unloadCallback = 0;
		hrtf_params.lookupCallback = 0;
		
		if (settings.frameSize != framesize || settings.samplingRate != samplerate) {
			
			// trash any existing objects before creating:
			cleanup();
			
			// settings have changed:
			settings.frameSize = framesize;
			settings.samplingRate = samplerate;
			
			// binaural
			if (IPL_STATUS_SUCCESS != iplCreateBinauralRenderer(context, settings, hrtf_params, &binaural_renderer)) {
				object_error(0, "vr~: failed to create binaural renderer");
				return;
			}
			
			//setup_environment();
			
			object_post(0, "vr~ changed global settings %d %f\n", framesize, samplerate);
			
		}
	}
	
	// by default scene is NULL and that is fine
	// but at some point we may add support for loading scenes for lovely physically-based effects
	void setup_scene() {
		
		// work on a local copy until it is ready:
		IPLhandle temp_scene = 0;
		
		// how many different kinds of surface materials to support
		// probably this needs to load from some config?
		IPLint32 numMaterials = 0;
		// TODO: enable this at some point
		if (numMaterials > 0 && IPL_STATUS_SUCCESS != iplCreateScene(context,
																	 computeDevice,
																	 simulationSettings,
																	 numMaterials,
																	 &temp_scene)) {
			object_error(0, "vr~: failed to create scene");
			return;
		} else {
			
			// define numMaterials materials with iplSetSceneMaterial
			for (int i=0; i<numMaterials; i++) {
				IPLMaterial material;
				// set properties
				// materials defined in terms of absorption & transmittance at low/med/hi freqs, and also roughness
				iplSetSceneMaterial(temp_scene, i, material);
			}
			
			IPLint32 numVertices = 0, numTriangles = 0;
			IPLhandle staticMesh;
			if (IPL_STATUS_SUCCESS != iplCreateStaticMesh(temp_scene,
														  numVertices,
														  numTriangles,
														  &staticMesh)) {
				object_error(0, "vr~: failed to create mesh");
			} else {
				
				// can be one or multiple meshes.
				// can imagine creating this via a @matrixoutput of a jit.gl.mesh etc.
				// except not sure how to specify materials... by colours?
				// or maybe for simplicity, one material per mesh?
				
				// each mesh has to set:
				//	a list of numVertices vertices (vec3),				iplSetStaticMeshVertices
				//	a list of numTriangles triangles (3 indices),		iplSetStaticMeshTriangles
				//	a list of numTriangles materials (1 per triangle)	iplSetStaticMeshMaterials
				
				// done:
				iplDestroyStaticMesh(&staticMesh);
			}
			
			
			// finally:
			// NOTE: This is a time-consuming, blocking call, so do not call it from performance-sensitive code
			// i.e. setup_scene should be under defer()
			// if not in a differen thread altogether?
			iplFinalizeScene(temp_scene, finalization_progress_callback);
			
			// once done,
			// can trash the old one & rebuild:
			if (scene) iplDestroyScene(&scene);
			scene = temp_scene;
			
			// now trigger setup_environment...
			setup_environment();
			
			// TODO
			// NOTE: can also load/save scenes via iplSaveFinalizedScene/iplLoadFinalizedScene
			// NOTE: can also export to obj: iplDumpSceneToObjFile
		}
		
	}
	
	// TODO: this can happen at any time
	// because of setup_scene()
	// so any other objects refering to the environmental_renderer will also need rebuilding...
	void setup_environment() {
		IPLhandle probeManager = NULL; // ok to leave null if not using baked data
		IPLSimulationThreadCreateCallback threadCreateCallback = 0;
		IPLSimulationThreadDestroyCallback threadDestroyCallback = 0;
		
		// TODO: configure this
		// not sure if it wants to be the same as hrtf_format?
		//IPLAudioFormat output_format;
		
		
		if (IPL_STATUS_SUCCESS != iplCreateEnvironment(context,
													   computeDevice,
													   simulationSettings,
													   scene,
													   probeManager,
													   &environment)) {
			object_error(0, "vr~: failed to create environment");
		} else if (IPL_STATUS_SUCCESS != iplCreateEnvironmentalRenderer(context,
																		environment,
																		settings,
																		hrtf_format, //output_format,
																		threadCreateCallback,
																		threadDestroyCallback,
																		&environmental_renderer)) {
			object_error(0, "vr~: failed to create environmental renderer");
		} else {
			// ok!
		}
	}
	
	// TODO: attr setter to call iplSetNumBounces(IPLhandle environment, IPLint32 numBounces);
	
} global;

static t_class * VR_Phonon_class = 0;

struct VR_Phonon {
	t_pxobject ob;
	void * outlet_msg;
	
	VR_Phonon() {
		outlet_msg = outlet_new(&ob, 0);
	}
	
	~VR_Phonon() {
		cleanup();
		
	}
	
	void cleanup() {
		
	}
	
	void output_ear() {
		t_atom a[3];
		glm::vec3 ear = quat_ux(global.quat) * global.head_radius;
		atom_setfloat(a + 0, ear.x);
		atom_setfloat(a + 1, ear.y);
		atom_setfloat(a + 2, ear.z);
		outlet_anything(outlet_msg, gensym("ear"), 3, a);
	}
	
	void dsp64(t_object *dsp64, short *count, double samplerate, long framesize, long flags) {
		
		// reset:
		cleanup();
		global.setup(samplerate, framesize);
		
		//object_post((t_object *)this, "dsp %f %d interp %d", samplerate, framesize, interp);
		
		
	}
	
	static void * create(t_symbol *s, long argc, t_atom *argv) {
		VR_Phonon *x = NULL;
		if ((x = (VR_Phonon *)object_alloc(VR_Phonon_class))) {
			x = new (x) VR_Phonon;
			attr_args_process(x, (short)argc, argv);
		}
		return (x);
	}
	
	static void destroy(VR_Phonon *x) {
		x->~VR_Phonon();
	}
	
	// registers a function for the signal chain in Max
	static void static_dsp64(VR_Phonon *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags) {
		x->dsp64(dsp64, count, samplerate, maxvectorsize, flags);
	}
	
	static void static_assist(VR_Phonon *x, void *b, long m, long a, char *s) {
		if (m == ASSIST_INLET) {
			sprintf(s, "source (signal)");
		} else {
			switch(a) {
				case 0: sprintf(s, "headphone left (signal)"); break;
				case 1: sprintf(s, "headphone right (signal)"); break;
			}
		}
	}
	
	static t_max_err position_get(VR_Phonon * o, t_object *attr, long *argc, t_atom **argv) {
		char alloc;
		// make sure there are enough atoms in the return value:
		atom_alloc_array(3, argc, argv, &alloc);
		atom_setfloat((*argv) + 0, global.position.x);
		atom_setfloat((*argv) + 1, global.position.y);
		atom_setfloat((*argv) + 2, global.position.z);
		return 0;
	};
	static t_max_err position_set(VR_Phonon * o, t_object *attr, long argc, t_atom *argv) {
		if (argc < 3) {
			object_error((t_object *)o, "position requires 3 floats");
			return MAX_ERR_GENERIC;
		} else {
			global.position.x = atom_getfloat(argv+0);
			global.position.y = atom_getfloat(argv+1);
			global.position.z = atom_getfloat(argv+2);
			// output the ear vector:
			o->output_ear();
			return MAX_ERR_NONE;
		}
	};
	
	static t_max_err quat_get(VR_Phonon * o, t_object *attr, long *argc, t_atom **argv) {
		char alloc;
		// make sure there are enough atoms in the return value:
		atom_alloc_array(4, argc, argv, &alloc);
		atom_setfloat((*argv) + 0, global.quat.x);
		atom_setfloat((*argv) + 1, global.quat.y);
		atom_setfloat((*argv) + 2, global.quat.z);
		atom_setfloat((*argv) + 3, global.quat.w);
		// output the ear vector:
		o->output_ear();
		return 0;
	};
	static t_max_err quat_set(VR_Phonon * o, t_object *attr, long argc, t_atom *argv) {
		if (argc < 4) {
			object_error((t_object *)o, "quat requires  4 floats");
			return MAX_ERR_GENERIC;
		} else {
			global.quat.x = atom_getfloat(argv+0);
			global.quat.y = atom_getfloat(argv+1);
			global.quat.z = atom_getfloat(argv+2);
			global.quat.w = atom_getfloat(argv+3);
			return MAX_ERR_NONE;
		}
	};
	
	static void static_init() {
		t_class * c = class_new("vr.phonon~", (method)create, (method)destroy, (long)sizeof(VR_Phonon), 0L, A_GIMME, 0);
		
		class_addmethod(c, (method)static_assist, "assist", A_CANT, 0);
		class_addmethod(c, (method)static_dsp64, "dsp64", A_CANT, 0);
		
		CLASS_ATTR_FLOAT_ARRAY(c, "position", 0, VR_Phonon, ob, 3);
		CLASS_ATTR_ACCESSORS(c, "position", position_get, position_set);
		
		CLASS_ATTR_FLOAT_ARRAY(c, "quat", 0, VR_Phonon, ob, 4);
		CLASS_ATTR_ACCESSORS(c, "quat", quat_get, quat_set);
		
		class_dspinit(c);
		class_register(CLASS_BOX, c);
		VR_Phonon_class = c;
	}
};


static t_class * VR_Phonon_hrtf_class = 0;

struct VR_Phonon_hrtf {
	t_pxobject ob;
	
	// attr
	t_atom_long interp;		// interpolate positions over time
	t_atom_long interaural; // compute direction etc. for each ear location separately (requires two binaural renderers)
	glm::vec3 position;
	//glm::quat quat; // only important if we start simulating radiation patterns
	
	// internal
	IPLhandle binaural = 0;
	IPLhandle binaural2 = 0;
	IPLfloat32 * source_buffers[1];
	IPLfloat32 * output_buffers[2];
	IPLfloat32 * source_buffers2[1];
	IPLfloat32 * output_buffers2[2];
	
	int position_signal = 0;
	
	
	VR_Phonon_hrtf() {
		// pre-allocated to maximum vector size, in case this is cheaper?
		source_buffers[0] = new float[4096];
		output_buffers[0] = new float[4096];
		output_buffers[1] = new float[4096];
		output_buffers2[0] = new float[4096];
		output_buffers2[1] = new float[4096];
		
		// input signals:
		dsp_setup(&ob, 4);
		// stereo output:
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");
		// two more outlets for distance signals:
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");
		
		// attr defaults:
		interp = 1;
		interaural = 1;
		// default position in front of listener, to avoid 0,0,0
		position.x = 0;
		position.y = 0;
		position.z = -1;
		
		// default orientation has no transform:
		//quat.x = 0;
		//quat.y = 0;
		//quat.z = 0;
		//quat.w = 1;
	}
	
	~VR_Phonon_hrtf() {
		cleanup();
		
		delete[] source_buffers[0];
		delete[] output_buffers[0];
		delete[] output_buffers[1];
		delete[] output_buffers2[0];
		delete[] output_buffers2[1];
	}
	
	void cleanup() {
		if (binaural) iplDestroyBinauralEffect(&binaural);
		if (binaural2) iplDestroyBinauralEffect(&binaural2);
	}
	
	void dsp64(t_object *dsp64, short *count, double samplerate, long framesize, long flags) {
		
		// reset:
		cleanup();
		global.setup(samplerate, framesize);
		
		//object_post((t_object *)this, "dsp %f %d interp %d", samplerate, framesize, interp);
		
		// create binaural effect:
		iplCreateBinauralEffect(global.binaural_renderer, global.mono_format, global.hrtf_format, &binaural);
		iplCreateBinauralEffect(global.binaural_renderer, global.mono_format, global.hrtf_format, &binaural2);
		
		// note whetehr position data is audio rate or not:
		position_signal = count[1] && count[2] && count[3];
		//post("sign %d", position_signal);
		
		// connect to MSP dsp chain:
		long options = 0;
		object_method(dsp64, gensym("dsp_add64"), this, static_perform64, options, 0);
	}
	
	void perform64(t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags) {
		
		// phonon uses float32 processing, so we need to copy :-(
		IPLAudioBuffer outbuffer;
		outbuffer.format = global.hrtf_format;
		outbuffer.numSamples = sampleframes;
		outbuffer.deinterleavedBuffer = output_buffers;
		
		IPLAudioBuffer outbuffer2;
		outbuffer2.format = global.hrtf_format;
		outbuffer2.numSamples = sampleframes;
		outbuffer2.deinterleavedBuffer = output_buffers2;
		
		IPLAudioBuffer inbuffer;
		inbuffer.format = global.mono_format;
		inbuffer.numSamples = sampleframes;
		inbuffer.deinterleavedBuffer = source_buffers;
		
		// copy input:
		{
			t_double * src = ins[0];
			IPLfloat32 * dst = source_buffers[0];
			int n = sampleframes;
			while (n--) { *dst++ = *src++; }
		}
		
		// if position is being set by audio signals, grab them here:
		if (position_signal) {
			position.x = *(ins[1]);
			position.y = *(ins[2]);
			position.z = *(ins[3]);
		}
	
		glm::vec3 dirn_l, dirn_r;
		float distance_l, distance_r;
		if (interaural) {
			glm::vec3 ear = quat_ux(global.quat) * global.head_radius;
			glm::vec3 rel_l = position - (global.position - ear);
			glm::vec3 rel_r = position - (global.position + ear);
			glm::vec3 dir_l = quat_unrotate(global.quat, rel_l);
			glm::vec3 dir_r = quat_unrotate(global.quat, rel_r);
			distance_l = glm::length(rel_l);
			distance_r = glm::length(rel_r);
			// TODO: handle cases where distance is close to zero (where there's no direction in particular)
			dirn_l = glm::normalize(dir_l);
			dirn_r = glm::normalize(dir_r);
		} else {
			glm::vec3 rel_l = position - (global.position);
			glm::vec3 dir_l = quat_unrotate(global.quat, rel_l);
			distance_l = glm::length(rel_l);
			distance_r = distance_l;
			// TODO: handle cases where distance is close to zero (where there's no direction in particular)
			dirn_l = glm::normalize(dir_l);
		}
			
		
		// Note:
		// IPL_HRTFINTERPOLATION_BILINEAR has high CPU cost
		// Typically, bilinear filtering is most useful for wide-band noise-like sounds, such as radio static, mechanical noise, fire, etc.
		// BUT Must use IPL_HRTFINTERPOLATION_BILINEAR if using a custom HRTF
		
		iplApplyBinauralEffect(binaural,
							   inbuffer,
							   *(IPLVector3 *)(&dirn_l.x),
							   interp ? IPL_HRTFINTERPOLATION_BILINEAR : IPL_HRTFINTERPOLATION_NEAREST,
							   outbuffer);
		
		if (interaural) {
			iplApplyBinauralEffect(binaural2,
								   inbuffer,
								   *(IPLVector3 *)(&dirn_r.x),
								   interp ? IPL_HRTFINTERPOLATION_BILINEAR : IPL_HRTFINTERPOLATION_NEAREST,
								   outbuffer2);
		}
		
		// copy output:
		{
			IPLfloat32 * src00 = output_buffers[0];
			IPLfloat32 * src01 = interaural ? output_buffers2[1] : output_buffers[1];
			t_double * dst0 = outs[0];
			t_double * dst1 = outs[1];
			t_double * dst2 = outs[2];
			t_double * dst3 = outs[3];
			int n = sampleframes;
			while (n--) {
				*dst0++ = *src00++;
				*dst1++ = *src01++;
				// maybe we should ramp this?
				*dst2++ = distance_l;
				*dst3++ = distance_r;
			}
		}
	}
	
	static void * create(t_symbol *s, long argc, t_atom *argv) {
		VR_Phonon_hrtf *x = NULL;
		if ((x = (VR_Phonon_hrtf *)object_alloc(VR_Phonon_hrtf_class))) {
			x = new (x) VR_Phonon_hrtf;
			attr_args_process(x, (short)argc, argv);
		}
		return (x);
	}
	
	static void destroy(VR_Phonon_hrtf *x) {
		x->~VR_Phonon_hrtf();
	}
	
	// registers a function for the signal chain in Max
	static void static_dsp64(VR_Phonon_hrtf *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags) {
		x->dsp64(dsp64, count, samplerate, maxvectorsize, flags);
	}
	
	static void static_perform64(VR_Phonon_hrtf *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam) {
		x->perform64(dsp64, ins, numins, outs, numouts, sampleframes, flags);
	}
	
	static void static_assist(VR_Phonon_hrtf *x, void *b, long m, long a, char *s) {
		if (m == ASSIST_INLET) {
			sprintf(s, "source (signal)");
		} else {
			switch(a) {
				case 0: sprintf(s, "headphone left (signal)"); break;
				case 1: sprintf(s, "headphone right (signal)"); break;
			}
		}
	}
	
	static void static_init() {
		t_class * c = class_new("vr.phonon.hrtf~", (method)VR_Phonon_hrtf::create, (method)VR_Phonon_hrtf::destroy, (long)sizeof(VR_Phonon_hrtf), 0L, A_GIMME, 0);
		
		class_addmethod(c, (method)VR_Phonon_hrtf::static_assist, "assist", A_CANT, 0);
		class_addmethod(c, (method)VR_Phonon_hrtf::static_dsp64, "dsp64", A_CANT, 0);
		
		CLASS_ATTR_LONG(c, "interp", 0, VR_Phonon_hrtf, interp);
		CLASS_ATTR_STYLE(c, "interp", 0, "onoff");
		
		CLASS_ATTR_LONG(c, "interaural", 0, VR_Phonon_hrtf, interaural);
		CLASS_ATTR_STYLE(c, "interaural", 0, "onoff");
		
		CLASS_ATTR_FLOAT_ARRAY(c, "position", 0, VR_Phonon_hrtf, position, 3);
		//CLASS_ATTR_FLOAT_ARRAY(c, "quat", 0, VR_Phonon_hrtf, quat, 4);
		
		class_dspinit(c);
		class_register(CLASS_BOX, c);
		VR_Phonon_hrtf_class = c;
	}
};


/*
 
 void conv() {
 
	// phonon_environmental_renderer needs to exist
	// typically expects to use data baked from a game engine
	// but a more expensive REALTIME option is available
	// not sure what input/output types should be used
	// seems like generally want to create a convolution effect per source, since they are named?
	IPLhandle convolution_effect = 0;
	IPLstring name = "__reverb__"; // or a name baked from a game engine
	IPLSimulationType simulationType = IPL_SIMTYPE_REALTIME; // IPL_SIMTYPE_BAKED
	IPLAudioFormat inputFormat; // e.g. ambisonic
	IPLAudioFormat outputFormat; // e.g. ambisonic
	if (IPL_STATUS_SUCCESS != iplCreateConvolutionEffect(global.environmental_renderer,
 name,
 simulationType,
 inputFormat,
 outputFormat,
 &convolution_effect)) {
 object_error(0, "failed to create convolution effect");
 return;
	}
	
	// audio loop
	{
 IPLVector3 sourcePosition; // world-space position of source
 IPLAudioBuffer dryAudio; // input
 iplSetDryAudioForConvolutionEffect(convolution_effect,
 sourcePosition,
 dryAudio);
 
 // for one source immediately:
 IPLVector3 listenerPosition;
 IPLVector3 listenerAhead; // unit forward vector of listener orientation,
 IPLVector3 listenerUp; // unit up vector of listener
 IPLAudioBuffer wetAudio; // output
 iplGetWetAudioForConvolutionEffect(convolution_effect,
 listenerPosition,
 listenerAhead,
 listenerUp,
 wetAudio);
 
 // more efficient: for all sources
 // but for this to work, it would need to be a separate object that comes after all sources in the dsp chain
 // (otherwise there'd be a buffer of latency for some sources)
 IPLhandle renderer;
 IPLVector3 listenerPosition; // world-space
 IPLVector3 listenerAhead, listenerUp; // unit vectors from listener orientation
 IPLAudioBuffer mixedWetAudio;
 iplGetMixedEnvironmentalAudio(global.environmental_renderer,
 listenerPosition,
 listenerAhead,
 listenerUp,
 mixedWetAudio);
	}
 }
 */

/*
struct VR_Phonon_ambi2hrtf {
	t_pxobject ob;
	// attrs:
	//t_atom_long normalization = 0;
	//t_atom_long channelorder = 0;
	// A unit quaternion describing the 3D transformation from world space to listener space coordinates.
	//glm::quat orientation, orientation_prev;
	
	IPLAudioFormat ambisonic_format; // must be ambisonic
	IPLhandle ambisonic_hrtf_effect = 0;
	IPLhandle ambisonic_rotator = 0;
	
	// pre-allocated to maximum vector size, in case this is cheaper?
	IPLfloat32 * ambi_buffers[16];
	IPLfloat32 * output_buffers[2];
	
	VR_Phonon_ambi2hrtf() {
		// according to https://github.com/ValveSoftware/steam-audio/issues/38
		// the only supported combination is IPL_CHANNELORDER_DEINTERLEAVED,
		// IPL_AMBISONICSORDERING_ACN, and IPL_AMBISONICSNORMALIZATION_N3D for the input buffer
		
		ambisonic_format.channelLayoutType = IPL_CHANNELLAYOUTTYPE_AMBISONICS;
		ambisonic_format.numSpeakers = 16; //4; // TODO: depends on ambi type
		ambisonic_format.channelOrder = IPL_CHANNELORDER_DEINTERLEAVED;
		ambisonic_format.ambisonicsOrder = 3; //1;
		ambisonic_format.ambisonicsOrdering = IPL_AMBISONICSORDERING_ACN;
		ambisonic_format.ambisonicsNormalization = IPL_AMBISONICSNORMALIZATION_N3D;
		
		for (int i=0; i<ambisonic_format.numSpeakers; i++) {
			ambi_buffers[i] = new float[4096];
		}
		for (int i=0; i<2; i++) {
			output_buffers[i] = new float[4096];
		}
		
		//orientation[0] = orientation[1] = orientation[2] = 0;
		//orientation[3] = 1;
		
		// signal inlets:
		dsp_setup(&ob, ambisonic_format.numSpeakers);
		
		// stereo output:
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");
	}
	
	~VR_Phonon_ambi2hrtf() {
		cleanup();
		
		for (int i=0; i<ambisonic_format.numSpeakers; i++) {
			delete[] ambi_buffers[i];
		}
		for (int i=0; i<2; i++) {
			delete[] output_buffers[i];
		}
	}
	
	void cleanup() {
		if (ambisonic_hrtf_effect) iplDestroyAmbisonicsBinauralEffect(&ambisonic_hrtf_effect);
		if (ambisonic_rotator) iplDestroyAmbisonicsRotator(&ambisonic_rotator);
	}
	
	void dsp64(t_object *dsp64, short *count, double samplerate, long framesize, long flags) {
		global.setup(samplerate, framesize);
		
		// reset:
		cleanup();
		
		// create binaural effect:
 
		 switch (channelorder) {
			case 1: input_format.ambisonicsOrdering = IPL_AMBISONICSORDERING_ACN; break;
			default: input_format.ambisonicsOrdering = IPL_AMBISONICSORDERING_FURSEMALHAM; break;
		 }
		 switch (normalization) {
			case 2: input_format.ambisonicsNormalization = IPL_AMBISONICSNORMALIZATION_FURSEMALHAM; break;
			case 1: input_format.ambisonicsNormalization = IPL_AMBISONICSNORMALIZATION_SN3D; break;
			default: input_format.ambisonicsNormalization = IPL_AMBISONICSNORMALIZATION_N3D; break;
		 }
 
		if (IPL_STATUS_SUCCESS != iplCreateAmbisonicsBinauralEffect(global.binaural_renderer,
																	ambisonic_format,
																	global.hrtf_format,
																	&ambisonic_hrtf_effect)) {
			object_error(0, "failed to create Ambisonics HRTF effect");
			return;
		}
		
		if (IPL_STATUS_SUCCESS != iplCreateAmbisonicsRotator(ambisonic_format.ambisonicsOrder, &ambisonic_rotator)) {
			object_error(0, "failed to create Ambisonics rotator effect");
			return;
		}
		
		// connect to MSP dsp chain:
		long options = 0;
		object_method(dsp64, gensym("dsp_add64"), this, static_perform64, options, 0);
	}
	
	void perform64(t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags) {
		// phonon uses float32 processing, so we need to copy :-(
		
		IPLAudioBuffer inbuffer;
		inbuffer.format = ambisonic_format;
		inbuffer.numSamples = sampleframes;
		inbuffer.deinterleavedBuffer = ambi_buffers;
		
		// copy input:
		for (int i=0; i<ambisonic_format.numSpeakers; i++) {
			t_double * src = ins[i];
			IPLfloat32 * dst = ambi_buffers[i];
			int n = sampleframes;
			while (n--) {
				*dst++ = *src++;
			}
		}
		
 
		 // The steam audio implementation doesn't seem to work at all
		 // see https://github.com/ValveSoftware/steam-audio/issues/38
		 
		 IPLQuaternion q; // xyzw format. jitter also uses xyzw format, which is handy:
		 q.x = orientation[0];
		 q.y = orientation[1];
		 q.z = orientation[2];
		 q.w = orientation[3];
		 iplSetAmbisonicsRotation(ambisonic_rotator, q);
		 
		 object_post(0, "q %f %f %f %f", q.x, q.y, q.z, q.w);
		 
		 // TODO: It is possible to pass the same value for \c inputAudio and \c outputAudio.
		 // This results in in-place rotation of the Ambisonics data.
		 iplRotateAmbisonicsAudioBuffer(ambisonic_rotator, inbuffer, rotbuffer);
		 
		 
		 // rotate input:
		 // TODO: make the slerp interpolation independent of framesize
		 if (0) {
			// in-place rotation:
			IPLfloat32 * dst = source_buffer;
			IPLfloat32 * src = source_buffer;
		 
			int n = sampleframes;
			float div = 1.f/sampleframes;
			while (n--) {
		 src++; // W unused, but need to increment pointer
		 float x = *src++;
		 float y = *src++;
		 float z = *src++;
		 
		 float a = n*div; // slides from 1 to 0
		 glm::quat slerped = glm::slerp(orientation, orientation_prev, a);
		 
		 // or inverse?
		 //glm::mat4 m = glm::mat4_cast(glm::inverse(orientation));
		 //glm::vec4 v = m * glm::vec4(x, y, z, 1.f);
		 
		 // TODO: rotate or unrotate?
		 glm::vec3 dir(x, y, z);
		 glm::vec3 v = quat_rotate(slerped, dir);
		 
		 dst++; // W unused, but need to incremment pointer
		 *dst++ = v.x;
		 *dst++ = v.y;
		 *dst++ = v.z;
			}
		 }
		 orientation_prev = orientation;
 
		
		IPLAudioBuffer outbuffer;
		outbuffer.format = global.hrtf_format;
		outbuffer.numSamples = sampleframes;
		outbuffer.deinterleavedBuffer = output_buffers;
		
		iplApplyAmbisonicsBinauralEffect(ambisonic_hrtf_effect, inbuffer, outbuffer);
		
		// copy output:
		{
			IPLfloat32 * src0 = output_buffers[0];
			IPLfloat32 * src1 = output_buffers[1];
			t_double * dst0 = outs[0];
			t_double * dst1 = outs[1];
			int n = sampleframes;
			while (n--) {
				*dst0++ = *src0++;
				*dst1++ = *src1++;
			}
		}
	}
	
	///////////////
	
	static void * static_new(t_symbol *s, long argc, t_atom *argv) {
		VR_Phonon_ambi2hrtf *x = NULL;
		if ((x = (VR_Phonon_ambi2hrtf *)object_alloc(static_ambi2hrtf_class))) {
			x = new (x) VR_Phonon_ambi2hrtf();
			attr_args_process(x, (short)argc, argv);
		}
		return (x);
	}
	
	static void static_free(VR_Phonon_ambi2hrtf *x) {
		x->~VR_Phonon_ambi2hrtf();
	}
	
	// registers a function for the signal chain in Max
	static void static_dsp64(VR_Phonon_ambi2hrtf *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags) {
		x->dsp64(dsp64, count, samplerate, maxvectorsize, flags);
	}
	
	static void static_perform64(VR_Phonon_ambi2hrtf *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam) {
		x->perform64(dsp64, ins, numins, outs, numouts, sampleframes, flags);
	}
	
	static void static_assist(VR_Phonon_ambi2hrtf *x, void *b, long m, long a, char *s) {
		if (m == ASSIST_INLET) {
			sprintf(s, "ambisonic source (signal)");
		} else {
			switch(a) {
				case 0: sprintf(s, "headphone left (signal)"); break;
				case 1: sprintf(s, "headphone right (signal)"); break;
			}
		}
	}
	
	static void static_init() {
		t_class * c = class_new("vr.ambi2hrtf~", (method)VR_Phonon_ambi2hrtf::static_new, (method)VR_Phonon_ambi2hrtf::static_free, (long)sizeof(VR_Phonon_ambi2hrtf), 0L, A_GIMME, 0);
		class_addmethod(c, (method)VR_Phonon_ambi2hrtf::static_assist, "assist", A_CANT, 0);
		class_addmethod(c, (method)VR_Phonon_ambi2hrtf::static_dsp64, "dsp64", A_CANT, 0);
		
		//CLASS_ATTR_LONG(c, "normalization", 0, VR_Phonon_ambi2hrtf, normalization);
		//CLASS_ATTR_ENUMINDEX3(c, "normalization", 0, "n3d", "sn3d", "fuma");
		//CLASS_ATTR_LONG(c, "channelorder", 0, VR_Phonon_ambi2hrtf, channelorder);
		//CLASS_ATTR_ENUMINDEX2(c, "channelorder", 0, "fuma", "acn");
		
		//CLASS_ATTR_FLOAT_ARRAY(c, "quat", 0, VR_Phonon_ambi2hrtf, orientation, 4);
		
		class_register(CLASS_BOX, c);
		class_dspinit(c);
		static_ambi2hrtf_class = c;
	}
	
};
*/






extern "C" C74_EXPORT void ext_main(void *r) {
	
	VR_Phonon::static_init();
	VR_Phonon_hrtf::static_init();
}
