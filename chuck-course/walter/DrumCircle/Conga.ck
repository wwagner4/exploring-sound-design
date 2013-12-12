public class Conga {
    
    // base frequency of the conga
    float frequency;
    
    // Unit generators for the different conga tones
    ModalBar open => Gain master => dac;
    6 => open.preset;
    0.3 => open.stickHardness;
    0.5 => open.strikePosition;
    0.8 => open.gain;

    Shakers slap => master => dac;
    7 => slap.preset;
    0.9 => slap.gain;

    Shakers bass => master => dac;
    1 => bass.preset;

    Shakers touch => master => dac;
    6 => touch.preset;
    
    0.4 => bass.gain => touch.gain;

	// set default frequency
	freq(220);

    // set frequency of conga
    fun void freq(float freq) {
		freq => this.frequency;
		freq => open.freq;
		freq => slap.freq;
		freq => bass.freq;
		freq => touch.freq;
    }
    
    // set gain of conga
    fun void gain(float gain) {
       gain => master.gain; 
    }
    
    // functions to play different tones on the conga
    fun void openTone() {
        1 => open.noteOn;
    }
    
    fun void bassTone() {
        1 => bass.noteOn;
    }

    fun void slapTone() {
        1 => slap.noteOn;
    }

    fun void touchTone() {
        1 => touch.noteOn;
    }
}

