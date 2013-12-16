// Bob.ck
// Assignment 8: Concert for wind, sun and three birds

public class Bob extends Bird {
	
	// base frequency of Bob
	4500 => bFreq;

	// panning (location) of Bob
	-0.2 => bPan;

	// Bob's UGens:
	//	Oscillators for tone
	//	envelope to enable smooth attack and release
	ADSR env => Pan2 p => dac;

	SinOsc t => env;
	0.6 => t.gain;
	
	(0.01::second, 0::second, 1, 0.01::second) => env.set;

	bPan => p.pan;

	fun void gain(float gain) {
		gain => bGain;
		gain * 0.6 => t.gain;
	}

	fun void pan(float pan) {
		pan => bPan;
		pan => p.pan;
	}

	// chirp some part
	fun void chirpPart(int dist, float chirpFactorValues[]) {
		1 => env.keyOn;
		0 => int cnt;
		while (cnt < dist * (chirpFactorValues.cap()-1)) {
			interpolate(cnt, dist, chirpFactorValues) * bFreq => t.freq;
			//if (cnt%5 == 0) <<<t.freq()>>>;
			0.004::second => now;
			cnt++;
		}
		1 => env.keyOff;
		// wait for envelope release
		0.01::second => now;
	}

	// Bob's chirp
	fun void chirp() {
		chirpPart(10, [0.7, 0.8]);
		0.04::second => now;
		chirpPart(40, [0.98, 1.02]);
		0.04::second => now;
		chirpPart(10, [0.7, 0.8]);
		0.04::second => now;
		chirpPart(40, [0.98, 1.02]);
		0.04::second => now;
		chirpPart(30, [0.7, 0.8]);
	}
}

