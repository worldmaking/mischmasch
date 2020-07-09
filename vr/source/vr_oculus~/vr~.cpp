#include "vr~.h"

/*
 
 
 see intro at end of OVR_Audio.h
 
 OVR uses float32; need to copy back & forth since MSP uses doubles
 use ovrAudio_AllocSamples/ovrAudio_FreeSamples for the float buffers
 
 
 ovrAudio_GetTransformFromPose() converts oculus Pose to pos + direction vectors
 
 
 Each ovrAudioContext:
 - has fixed samplerate & buffersize
 - can have N sources (need to declare at start how many)
 - can configure: hrtf interpolation method (5 methods)
 - can use simple box reverb
 - can set listener pose (position & 3 dir vectors), head radius
 - select headphone correction model
 - select reflectoin model
 - set reverb wet level, min/max range
 - get compute performance
 Get reverb mix with ovrAudio_MixInSharedReverb...()
 Spatialize a WXYZ ambi stream with ovrAudio_ProcessAmbisonicStreamInterleaved()
 Maybe? ovrAudio_InitializeContext() can re-init an existing context?
 Enable the Oculus Audio profiler to connect to it
 Set a raycast callback for geometry collision, configure quality of it
 
 
 Each of these sources can have:
 - position, range (from full to no gain), radius, attenuation mode, reverb level
 - can reset (e.g. clears reverb on a source)
 - set ovrAudioSourceFlags: hint what kind of sound (wide/narrowband),
 	whether to use delayed direct sound,
 	whether to disable reflections
 - can get final computed gain (useful for prioritizing louder sounds?)
 Spatialize an individual source with ovrAudio_SpatializeMono...()
 
 Ambisonic
 - create b-format streams, set orientation, set one of a standard set of speaker layouts
 - ambi encode/decode individual source/speaker with 1st and 2nd order domains supported
 
 Why?
 - gvrAudio_ProcessQuadBinaural(): get a stereo HRTF mix from a ring of four binaural sources plus a look vector (WHY?)
 
 Audio geometry only works on Windows
 
 -------
 
 What makes sense for an MSP object?
 
 1. a vr~ object that has N inlets and inlet proxy/message prefix for per-voice property setting?
 - easier to implement
 - won't handle the ambisonic stuff
 - can't embed in a poly~
 
 1.5 the vr~ object supports 1 channel by default.
 - some context features, e.g. reverb, are expensive, so this is the worst design
 
 2. context is global, there can be only one. vr.source~ objects represent sources, and a vr.context~ object is used to talk to the context directly.
 - vr.source~ spatializes input (by ref to context) and outputs; feed them into vr.context~ (to ensure ordering) which can also mix in reverb signals, user's job to mix them all. need to make sure the
 - can embed in a poly~ (maybe also an mc?)
 - harder to implement
 - how to implement voice allocation? set voice number on the vr.source~ argument, or assign dynamically until all voices are used up?
 - need to trap errors where SR/BS does not match the context's
 - all kinds of threading issues, for both messages and for audio

 2.5 a vr.context~ object with a named context, plus up to N vr.source~ objects using the named context? [vr.source~ ctx voicenum]
 - might be confusing to use (invisible connection of context name)
 - can skip name to use a default context so it looks easier to use in default case AS ABOVE
 
 
 */

// TODO: ovrAudio_GetPerformanceCounter / ovrAudio_ResetPerformanceCounter
// ovrAudio_ProcessAmbisonicStreamInterleaved
// ovrAudio_SetProfilerEnabled
// ovrAudio_SetProfilerPort
// ovrAudio_SetReflectionModel (geometry-based reflections)
// propagation stuff (Windows only)

struct VRContext {
	ovrAudioContextConfiguration config = {};
	ovrAudioContext audioContext;
	
	
	float head_radius = 0.078;
	ovrPoseStatef poseState;
	glm::vec3 ear_left, ear_right;
	
	VRContext() {
		config.acc_Size = sizeof(config);
		config.acc_SampleRate = 44100;
		config.acc_BufferLength = 256;
		config.acc_MaxNumSources = 32;
		if (ovrAudio_CreateContext(&audioContext, &config) != ovrSuccess) {
			error("Could not create OVRAudio context!\n");
			return;
		}
		
		poseState.Orientation.w = 1.f;
		ear_left.x = -head_radius;
		ear_right.x = head_radius;
	}
	
	void updatePoseState(float radius, const glm::quat& quat, const glm::vec3& position) {
		poseState.Orientation.x = quat.x;
		poseState.Orientation.y = quat.y;
		poseState.Orientation.z = quat.z;
		poseState.Orientation.w = quat.w;
		poseState.Position.x = position.x;
		poseState.Position.y = position.y;
		poseState.Position.z = position.z;
		head_radius = radius;
		ear_left = -quat_ux(poseState.Orientation) * head_radius + poseState.Position;
		ear_right = quat_ux(poseState.Orientation) * head_radius + poseState.Position;
	}
	
	~VRContext() {
		cleanup();
		ovrAudio_DestroyContext(audioContext);
	}
	
	void cleanup() {
		
	}
	
	bool check(ovrResult res, t_object * obj=0) {
		switch(res) {
			case ovrSuccess: return true;
			case ovrError_AudioInvalidParam: object_error(obj, "ovr error: ovrError_AudioInvalidParam"); return false;
			case ovrError_AudioBadSampleRate: object_error(obj, "ovr error: ovrError_AudioBadSampleRate"); return false;
			case ovrError_AudioMissingDLL: object_error(obj, "ovr error: ovrError_AudioMissingDLL"); return false;
			case ovrError_AudioBadAlignment: object_error(obj, "ovr error: ovrError_AudioBadAlignment"); return false;
			case ovrError_AudioUninitialized: object_error(obj, "ovr error: ovrError_AudioUninitialized"); return false;
			case ovrError_AudioHRTFInitFailure: object_error(obj, "ovr error: ovrError_AudioHRTFInitFailure"); return false;
			case ovrError_AudioBadVersion: object_error(obj, "ovr error: ovrError_AudioBadVersion"); return false;
			case ovrError_AudioSymbolNotFound: object_error(obj, "ovr error: ovrError_AudioSymbolNotFound"); return false;
			case ovrError_SharedReverbDisabled: object_error(obj, "ovr error: ovrError_SharedReverbDisabled"); return false;
			case ovrError_AudioNoAvailableAmbisonicInstance: object_error(obj, "ovr error: ovrError_AudioNoAvailableAmbisonicInstance"); return false;
			case ovrError_AudioMemoryAllocFailure: object_error(obj, "ovr error: ovrError_AudioMemoryAllocFailure"); return false;
			case ovrError_AudioUnsupportedFeature: object_error(obj, "ovr error: ovrError_AudioUnsupportedFeature"); return false;
			case ovrError_AudioInternalEnd: object_error(obj, "ovr error: ovrError_AudioInternalEnd"); return false;
			default: object_error(obj, "ovr error: ovrError_AudioUnknown"); return false;
		}
	}

	
	void configure(double samplerate, uint32_t framesize, uint32_t voices=32) {
		// don't reconfigure if we don't have to:
		if (samplerate == config.acc_SampleRate && framesize == config.acc_BufferLength && voices == config.acc_MaxNumSources) return;
		
		cleanup();
		
		config.acc_SampleRate = samplerate;
		config.acc_BufferLength = framesize;
		config.acc_MaxNumSources = voices;
		if (ovrAudio_InitializeContext(audioContext, &config) != ovrSuccess) {
			error("Could not create OVRAudio context!\n");
			return;
		}
		ovrAudio_SetHeadphoneModel(audioContext, ovrAudioHeadphones_None, 0, 0);
		
		// TODO: set this from config?
		ovrAudioBoxRoomParameters box = {};
		box.brp_Size = sizeof(ovrAudioBoxRoomParameters);
		float ref = 0.95f;
		box.brp_ReflectLeft = box.brp_ReflectRight = ref;
		box.brp_ReflectUp = box.brp_ReflectDown = ref;
		box.brp_ReflectFront = box.brp_ReflectBehind = ref;
		box.brp_Width = 6.f;
		box.brp_Height = 8.f;
		box.brp_Depth = 10.f;
		check(ovrAudio_SetSimpleBoxRoomParameters(audioContext, &box));
	}
};

VRContext * globalContext;

struct VRContextObject {
	static t_class * maxclass;
	
	t_pxobject ob;
	void * outlet_msg;

	// attrs
	glm::quat quat;
	glm::vec3 position;
	t_atom_float head_radius = 0.078;
	t_atom_float reverb_wet = 1.f;
	glm::vec2 reverb_range;
	t_atom_long hrtf_method = 2;
	t_atom_long simple_room_modeling = 0;
	t_atom_long late_reverberation = 1;
	t_atom_long randomize_reverberation = 1;

	// internal
	VRContext * ctx;
	float * ovrOutBuffer = 0;

	VRContextObject() {
		// input signals:
		dsp_setup(&ob, 2);

		// dumpout:
		outlet_msg = outlet_new(&ob, 0);
		// stereo output:
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");

		ctx = globalContext;
		reverb_wet = 1.f;
		reverb_range.x = 0.f;
		reverb_range.y = 100.f;
		
		updatePoseState();
	}

	~VRContextObject() {
		cleanup();
	}

	void cleanup() {
		if (ovrOutBuffer) { ovrAudio_FreeSamples(ovrOutBuffer); ovrOutBuffer = 0; }
	}
	
	bool check(ovrResult res) {
		return ctx->check(res, (t_object *)this);
	}
	
	void updatePoseState() {
		ctx->updatePoseState(head_radius, quat, position);
	}
	
	void outputInfo() {
		updatePoseState();
		t_atom a[3];
		atom_setfloat(a + 0, ctx->ear_left.x);
		atom_setfloat(a + 1, ctx->ear_left.y);
		atom_setfloat(a + 2, ctx->ear_left.z);
		outlet_anything(outlet_msg, gensym("ear_left"), 3, a);
		atom_setfloat(a + 0, ctx->ear_right.x);
		atom_setfloat(a + 1, ctx->ear_right.y);
		atom_setfloat(a + 2, ctx->ear_right.z);
		outlet_anything(outlet_msg, gensym("ear_right"), 3, a);
	}

	void dsp64(t_object *dsp64, short *count, double samplerate, long framesize, long flags) {

		// reset:
		cleanup();
		object_post((t_object *)this, "dsp %f %d", samplerate, framesize);

		ctx->configure(samplerate, (uint32_t)framesize);
		
		ovrOutBuffer = ovrAudio_AllocSamples((int)framesize * 2); // Output is stereo

		// connect to MSP dsp chain:
		long options = 0;
		object_method(dsp64, gensym("dsp_add64"), this, static_perform64, options, 0);
	}

	void perform64(t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags) {
		
		updatePoseState();
		check(ovrAudio_SetListenerPoseStatef(ctx->audioContext, &ctx->poseState));
		
		// TODO: is it ok to do all these at control rate, rather than as attr setters?
		ovrAudio_SetHeadRadius(ctx->audioContext, head_radius);
		check(ovrAudio_SetHRTFInterpolationMethod(ctx->audioContext, (ovrAudioHRTFInterpolationMethod)hrtf_method));
		check(ovrAudio_Enable(ctx->audioContext, ovrAudioEnable_LateReverberation, (int)late_reverberation));
		check(ovrAudio_Enable(ctx->audioContext, ovrAudioEnable_SimpleRoomModeling, (int)simple_room_modeling));
		check(ovrAudio_Enable(ctx->audioContext, ovrAudioEnable_RandomizeReverb, (int)randomize_reverberation));
		
		// TODO: doesa this fail if not connected?
		// convert to float32 :-(
		{
			const t_double * src0 = ins[0];
			const t_double * src1 = ins[1];
			float * dst = ovrOutBuffer;
			long n = sampleframes;
			while (n--) {
				*dst++ = *src0++;
				*dst++ = *src1++;
			}
		}
		
		if (late_reverberation) {
			check(ovrAudio_SetSharedReverbWetLevel(ctx->audioContext, (float)reverb_wet));
			check(ovrAudio_SetSharedReverbRange(ctx->audioContext, reverb_range.x, reverb_range.y));
			
			uint32_t status;
			//ovrResult res =
			check(ovrAudio_MixInSharedReverbInterleaved(ctx->audioContext, &status, ovrOutBuffer));
			
		}

		// convert to double :-(
		{
			t_double * dst0 = outs[0];
			t_double * dst1 = outs[1];
			float * src = ovrOutBuffer;
			long n = sampleframes;
			while (n--) {
				*dst0++ = *src++;
				*dst1++ = *src++;
			}
		}
	}

	static void * create(t_symbol *s, long argc, t_atom *argv) {
		VRContextObject *x = NULL;
		if ((x = (VRContextObject *)object_alloc(maxclass))) {
			x = new (x) VRContextObject;
			attr_args_process(x, (short)argc, argv);
		}
		return (x);
	}

	static void destroy(VRContextObject *x) {
		x->~VRContextObject();
	}

	// registers a function for the signal chain in Max
	static void static_dsp64(VRContextObject *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags) {
		x->dsp64(dsp64, count, samplerate, maxvectorsize, flags);
	}

	static void static_perform64(VRContextObject *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam) {
		x->perform64(dsp64, ins, numins, outs, numouts, sampleframes, flags);
	}

	static void static_assist(VRContextObject *x, void *b, long m, long a, char *s) {
		if (m == ASSIST_INLET) {
			sprintf(s, "source (signal)");
		} else {
			switch(a) {
				case 0: sprintf(s, "headphone left (signal)"); break;
				case 1: sprintf(s, "headphone right (signal)"); break;
			}
		}
	}

	static t_max_err position_get(VRContextObject * o, t_object *attr, long *argc, t_atom **argv) {
		char alloc;
		// make sure there are enough atoms in the return value:
		atom_alloc_array(3, argc, argv, &alloc);
		atom_setfloat((*argv) + 0, o->position.x);
		atom_setfloat((*argv) + 1, o->position.y);
		atom_setfloat((*argv) + 2, o->position.z);
		return 0;
	};
	
	static t_max_err position_set(VRContextObject * o, t_object *attr, long argc, t_atom *argv) {
		if (argc < 3) {
			object_error((t_object *)o, "position requires 3 floats");
			return MAX_ERR_GENERIC;
		} else {
			o->position.x = atom_getfloat(argv+0);
			o->position.y = atom_getfloat(argv+1);
			o->position.z = atom_getfloat(argv+2);
			o->outputInfo();
			return MAX_ERR_NONE;
		}
	};

	static t_max_err quat_get(VRContextObject * o, t_object *attr, long *argc, t_atom **argv) {
		char alloc;
		// make sure there are enough atoms in the return value:
		atom_alloc_array(4, argc, argv, &alloc);
		atom_setfloat((*argv) + 0, o->quat.x);
		atom_setfloat((*argv) + 1, o->quat.y);
		atom_setfloat((*argv) + 2, o->quat.z);
		atom_setfloat((*argv) + 3, o->quat.w);
		return 0;
	};
	
	static t_max_err quat_set(VRContextObject * o, t_object *attr, long argc, t_atom *argv) {
		if (argc < 4) {
			object_error((t_object *)o, "quat requires  4 floats");
			return MAX_ERR_GENERIC;
		} else {
			o->quat.x = atom_getfloat(argv+0);
			o->quat.y = atom_getfloat(argv+1);
			o->quat.z = atom_getfloat(argv+2);
			o->quat.w = atom_getfloat(argv+3);
			o->outputInfo();
			return MAX_ERR_NONE;
		}
	};

	static void static_init() {
		t_class * c = class_new("vr.context~", (method)create, (method)destroy, (long)sizeof(VRContextObject), 0L, A_GIMME, 0);

		class_addmethod(c, (method)static_assist, "assist", A_CANT, 0);
		class_addmethod(c, (method)static_dsp64, "dsp64", A_CANT, 0);

		CLASS_ATTR_FLOAT_ARRAY(c, "quat", 0, VRContextObject, quat, 4);
		CLASS_ATTR_ACCESSORS(c, "quat", quat_get, quat_set);
		CLASS_ATTR_FLOAT_ARRAY(c, "position", 0, VRContextObject, position, 3);
		CLASS_ATTR_ACCESSORS(c, "position", position_get, position_set);
		CLASS_ATTR_FLOAT(c, "head_radius", 0, VRContextObject, head_radius);
		
		CLASS_ATTR_FLOAT(c, "reverb_wet", 0, VRContextObject, reverb_wet);
		CLASS_ATTR_FLOAT_ARRAY(c, "reverb_range", 0, VRContextObject, reverb_range, 2);

		
		CLASS_ATTR_LONG(c, "hrtf_method", 0, VRContextObject, hrtf_method);
		
		
		CLASS_ATTR_LONG(c, "simple_room_modeling", 0, VRContextObject, simple_room_modeling);
		CLASS_ATTR_STYLE(c, "simple_room_modeling", 0, "onoff");
		CLASS_ATTR_LONG(c, "late_reverberation", 0, VRContextObject, late_reverberation);
		CLASS_ATTR_STYLE(c, "late_reverberation", 0, "onoff");
		CLASS_ATTR_LONG(c, "randomize_reverberation", 0, VRContextObject, randomize_reverberation);
		CLASS_ATTR_STYLE(c, "randomize_reverberation", 0, "onoff");

		class_dspinit(c);
		class_register(CLASS_BOX, c);
		maxclass = c;
	}
};

t_class * VRContextObject::maxclass = 0;

struct VRSourceObject {
	static t_class * maxclass;
	
	t_pxobject ob;
	void * outlet_msg;
	
	// attrs
	t_atom_long voice = 0;
	glm::vec3 position;
	glm::vec2 range;
	t_atom_float radius = 0.f;
	t_atom_float reverb_send = 0.f;
	
	t_atom_long auto_attenuate = 0; // use oculus' inverse square attenuation
	t_atom_long wideband_hint = 1;
	t_atom_long direct_delay = 0;
	t_atom_long reflections = 0;
	
	// internal
	VRContext * ctx = 0;
	float * ovrInBuffer = 0;
	float * ovrOutBuffer = 0;
	float attenduatedGain = 1.f;

	VRSourceObject(long argc, t_atom *argv) {
		
		// input signals:
		dsp_setup(&ob, 1);
		
		// dumpout:
		outlet_msg = outlet_new(&ob, 0);
		// stereo output:
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");
		outlet_new(&ob, "signal");
		
		ctx = globalContext;
		
		range.x = 0.f;
		range.y = 100.f;
		
		// derive voice number
		if (argc > 0 && atom_gettype(argv+0) == A_LONG) {
			voice = atom_getlong(argv);
		}
		// TODO: validate this is an acceptable voice id from the context (valid id range, not a busy voice, etc.)
		// TODO: else dynamically allocate voice number from context?
		
	}
	
	void configure() {
		// Setup source
		check(ovrAudio_SetAudioSourceRange(ctx->audioContext, (int)voice, range.x, range.y));
		check(ovrAudio_SetAudioSourceRadius(ctx->audioContext, (int)voice, radius));
		check(ovrAudio_SetAudioReverbSendLevel(ctx->audioContext, (int)voice, reverb_send));
		check(ovrAudio_SetAudioSourceAttenuationMode(ctx->audioContext, (int)voice, auto_attenuate ? ovrAudioSourceAttenuationMode_InverseSquare : ovrAudioSourceAttenuationMode_None, 1.0f));
		
		int flags = wideband_hint ? ovrAudioSourceFlag_WideBand_HINT : ovrAudioSourceFlag_NarrowBand_HINT;
		if (direct_delay) flags |= ovrAudioSourceFlag_DirectTimeOfArrival;
		if (!reflections) flags |= ovrAudioSourceFlag_ReflectionsDisabled;
		check(ovrAudio_SetAudioSourceFlags(ctx->audioContext, (int)voice, flags));
	}
	
	void reset() {
		//ovrResult result =
		check(ovrAudio_ResetAudioSource(ctx->audioContext, (int)voice));
	}
	
	~VRSourceObject() {
		cleanup();
	}
	
	void cleanup() {
		if (ovrInBuffer) { ovrAudio_FreeSamples(ovrInBuffer); ovrInBuffer = 0; }
		if (ovrOutBuffer) { ovrAudio_FreeSamples(ovrOutBuffer); ovrOutBuffer = 0; }
	}
	
	bool check(ovrResult res) {
		return ctx->check(res, (t_object *)this);
	}
	
	void dsp64(t_object *dsp64, short *count, double samplerate, long framesize, long flags) {
		
		// reset:
		cleanup();
		object_post((t_object *)this, "dsp %f %d", samplerate, framesize);
		
		ctx->configure(samplerate, (uint32_t)framesize);
		
		ovrInBuffer = ovrAudio_AllocSamples((int)framesize);
		ovrOutBuffer = ovrAudio_AllocSamples((int)framesize * 2); // Output is stereo
		
		// connect to MSP dsp chain:
		long options = 0;
		object_method(dsp64, gensym("dsp_add64"), this, static_perform64, options, 0);
	}
	
	void perform64(t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags) {
		
		check(ovrAudio_SetAudioSourcePos(ctx->audioContext, (int)voice, position.x, position.y, position.z));
		
		// TODO: do this in response to attr setting, rather than here
		configure();
		
		// compute ear distances:
		float distance_left = glm::distance(ctx->ear_left, position);
		float distance_right = glm::distance(ctx->ear_right, position);
		
		// convert to float32 :-(
		{
			const t_double * src = ins[0];
			float * dst = ovrInBuffer;
			long n = sampleframes;
			while (n--) { *dst++ = *src++; }
		}
		
		// Spatialize
		uint32_t status;
		check(ovrAudio_SpatializeMonoSourceInterleaved(ctx->audioContext,
												 (int)voice,
												 &status,
												 ovrOutBuffer,
												 ovrInBuffer));
		
		// ovrResult =
		check(ovrAudio_GetAudioSourceOverallGain(ctx->audioContext, (uint32_t)voice, &attenduatedGain));
		
		// convert to double :-(
		{
			t_double * dst0 = outs[0];
			t_double * dst1 = outs[1];
			t_double * dst2 = outs[2];
			t_double * dst3 = outs[3];
			const float * src = ovrOutBuffer;
			long n = sampleframes;
			while (n--) {
				*dst0++ = *src++;
				*dst1++ = *src++;
				*dst2++ = distance_left;
				*dst3++ = distance_right;
			}
		}
	}
	
	static void * create(t_symbol *s, long argc, t_atom *argv) {
		VRSourceObject *x = NULL;
		if ((x = (VRSourceObject *)object_alloc(maxclass))) {
			x = new (x) VRSourceObject(argc, argv);
			attr_args_process(x, (short)argc, argv);
			x->configure();
			x->reset();
		}
		return (x);
	}
	
	static void destroy(VRSourceObject *x) {
		x->~VRSourceObject();
	}
	
	// registers a function for the signal chain in Max
	static void static_dsp64(VRSourceObject *x, t_object *dsp64, short *count, double samplerate, long maxvectorsize, long flags) {
		x->dsp64(dsp64, count, samplerate, maxvectorsize, flags);
	}
	
	static void static_perform64(VRSourceObject *x, t_object *dsp64, double **ins, long numins, double **outs, long numouts, long sampleframes, long flags, void *userparam) {
		x->perform64(dsp64, ins, numins, outs, numouts, sampleframes, flags);
	}
	
	static void static_assist(VRSourceObject *x, void *b, long m, long a, char *s) {
		if (m == ASSIST_INLET) {
			sprintf(s, "source (signal)");
		} else {
			switch(a) {
				case 0: sprintf(s, "headphone left (signal)"); break;
				case 1: sprintf(s, "headphone right (signal)"); break;
				case 2: sprintf(s, "distance left (signal)"); break;
				case 3: sprintf(s, "distance right (signal)"); break;
				default: sprintf(s, "messages"); break;
			}
		}
	}
	
	static void static_reset(VRSourceObject *x) { x->reset(); }

	static t_max_err position_get(VRSourceObject * o, t_object *attr, long *argc, t_atom **argv) {
		char alloc;
		// make sure there are enough atoms in the return value:
		atom_alloc_array(3, argc, argv, &alloc);
		atom_setfloat((*argv) + 0, o->position.x);
		atom_setfloat((*argv) + 1, o->position.y);
		atom_setfloat((*argv) + 2, o->position.z);
		return 0;
	};
	static t_max_err position_set(VRSourceObject * o, t_object *attr, long argc, t_atom *argv) {
		if (argc < 3) {
			object_error((t_object *)o, "position requires 3 floats");
			return MAX_ERR_GENERIC;
		} else {
			o->position.x = atom_getfloat(argv+0);
			o->position.y = atom_getfloat(argv+1);
			o->position.z = atom_getfloat(argv+2);
			// output the ear vector:
			//o->output_ear();
			return MAX_ERR_NONE;
		}
	};
	
	static void static_init() {
		t_class * c = class_new("vr.source~", (method)create, (method)destroy, (long)sizeof(VRSourceObject), 0L, A_GIMME, 0);
		
		class_addmethod(c, (method)static_assist, "assist", A_CANT, 0);
		class_addmethod(c, (method)static_dsp64, "dsp64", A_CANT, 0);
		
		class_addmethod(c, (method)static_reset, "reset", 0);
		
		CLASS_ATTR_LONG(c, "voice", 0, VRSourceObject, voice);
		
		CLASS_ATTR_FLOAT_ARRAY(c, "position", 0, VRSourceObject, position, 3);
		CLASS_ATTR_ACCESSORS(c, "position", position_get, position_set);
		
		// these attrs should also trigger configure():
		CLASS_ATTR_FLOAT_ARRAY(c, "range", 0, VRSourceObject, range, 2);
		CLASS_ATTR_FLOAT(c, "radius", 0, VRSourceObject, radius);
		CLASS_ATTR_FLOAT(c, "reverb_send", 0, VRSourceObject, reverb_send);
		CLASS_ATTR_LONG(c, "auto_attenuate", 0, VRSourceObject, auto_attenuate);
		CLASS_ATTR_STYLE(c, "auto_attenuate", 0, "onoff");
		CLASS_ATTR_LONG(c, "wideband_hint", 0, VRSourceObject, wideband_hint);
		CLASS_ATTR_STYLE(c, "wideband_hint", 0, "onoff");
		CLASS_ATTR_LONG(c, "direct_delay", 0, VRSourceObject, direct_delay);
		CLASS_ATTR_STYLE(c, "direct_delay", 0, "onoff");
		CLASS_ATTR_LONG(c, "reflections", 0, VRSourceObject, reflections);
		CLASS_ATTR_STYLE(c, "reflections", 0, "onoff");
		
		class_dspinit(c);
		class_register(CLASS_BOX, c);
		maxclass = c;
	}
};

t_class * VRSourceObject::maxclass = 0;

extern "C" C74_EXPORT void ext_main(void *r) {
	
	post("vr~ using Oculus AudioSDK: %s", ovrAudio_GetVersion(0, 0, 0));
	
	globalContext = new VRContext;
	
	VRContextObject::static_init();
	VRSourceObject::static_init();
}
