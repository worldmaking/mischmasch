
Annotations could indicate various things -- not all of which are orthogonal:
- expected range of values (e.g. unipolar, bipolar, binary, integer, MIDI, Hz, dB, etc.)
- expected rate of values (e.g. up to audible, up to LFO, held, instantaneous)
- semantics (e.g. octave, Hz, dB, harmonic, selector, etc.)

Examples:

- any
	- no range bounds, 
	- could be audible, LFO, sporadic, etc.
	- no given semantics/units
	
- Hz
	- note: negative Hz is often valid

- harmonic
	- value represents a harmonic offset or ratio
	- 0 means fundamental, 1 is 1st harmonic, 2 is 2nd, etc. 
	- @min -1, which is DC

- octave
	- i.e. volt per octave, describes a frequency offset as a multiple of octaves
	
- dB
	- represents loudness. 0 means full signal, each -6 is a halving of energy
	
- amp
	- an amplitude multiplier, normally in 0..1 but could be greater, or negative
	- semantic is that this would play an attenuverter kind of role
	
- MIDI
	- value expected in 0..127
	- may be rounded to integer or not
	- semantic as midi note, velocity, cc, pgm, etc.

- gate	
	- typically either 0 or 1, but could be nonzero / zero
	- different nonzero integers (rounding toward zero) could indicate different selctions
	- expected to hold at a value for variable periods of time

- trig
	- typically 0 or 1, but could be nonzero / zero
	- expected to be instantaneous (single-sample) spike and otherwise zero
	- rounded integer value could also serve as a selector, or float value could serve as a "velocity"
	
- lfo
	- range unspecified
	- expected to oscillate below or at lower end of audible frequencies
	- semantics/units unspecified
	
- unipolar
	- any signal expected to vary between 0..1, unspecified rate
	- Q: outside that range should it wrap or clamp?

- bipolar
	- any signal expected to vary between -1..1, unspecified rate
	- Q: outside that range should it wrap or clamp?
	
- audio < bipolar
	- expects a signal in -1..1 that is likely to oscillate at audible frequencies
	- i.e. this is a signal you could connect to speakers
	
- phasor < audio
	- expects a ramp signal in 0..1
	- likely LFO or audible frequency
	- Q: outside that range should it wrap or clamp?
