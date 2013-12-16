// Alice.ck
// Assignment 8: Concert for wind, sun and three birds

public class Alice extends Bird {
	
	// base frequency of Alice
	3500 => bFreq;

	// panning (location) of Alice
	0.7 => bPan;

	// Alice's UGens:
	//	2 Oscillators for tone and first overtone
	//	envelope to enable smooth attack and release
	ADSR env => Pan2 p => dac;

	SinOsc t => env;
	0.6 => t.gain;
	
	TriOsc o1 => env;
	0.15 => o1.gain;
	
	(0.05::second, 0::second, 1, 0.05::second) => env.set;

	bPan => p.pan;

	fun void gain(float gain) {
		gain => bGain;
		gain * 0.6 => t.gain;
		gain * 0.2 => o1.gain;
	}

	fun void pan(float pan) {
		pan => bPan;
		pan => p.pan;
	}

	// Alice's chirp
	fun void chirp() {
		[0.85, 0.98, 0.9, 0.95, 1, 0.93] @=> float chirpFactorValues[];

		1 => env.keyOn;
		0 => int cnt;
		while (cnt < 100) {
			interpolate(cnt, 20, chirpFactorValues) * bFreq => t.freq;
			interpolate(cnt, 20, chirpFactorValues) * bFreq * 2 => o1.freq;
			//if (cnt%5 == 0) <<<t.freq()>>>;
			0.004::second => now;
			cnt++;
		}
		1 => env.keyOff;
		// wait for envelope release
		0.05::second => now;
	}
}

