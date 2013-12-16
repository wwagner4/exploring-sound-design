// Carroll.ck
// Assignment 8: Concert for wind, sun and three birds

public class Carroll extends Bird {
	
	// panning (location) of Carroll
	-0.8 => bPan;

	// Carroll's UGens:
	SndBuf t => Pan2 p => dac;

	me.dir(-1) + "/audio/click_03.wav" => t.read;
	0.6 => t.gain;
	
	bPan => p.pan;

	fun void gain(float gain) {
		gain => bGain;
		gain * 0.6 => t.gain;
	}

	fun void pan(float pan) {
		pan => bPan;
		pan => p.pan;
	}

	// Carroll's chirp
	fun void chirp() {
		0 => t.pos;
		100::ms => now;

		0 => t.pos;
		150::ms => now;

		0.8 => t.rate;
		0 => t.pos;
		150::ms => now;

		200::ms => now;	//107::mm
	}
}

