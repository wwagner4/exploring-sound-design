// Bird.ck
// Assignment 8: Concert for wind, sun and three birds

public class Bird {

	// gain of bird
	1 => float bGain;

	// base frequency of bird
	2500 => float bFreq;

	// panning of bird
	0 => float bPan;

	fun void chirp() {
		<<< "chirp: abstract fun ... implemented in subclass" >>>;
		return;
	}

	fun void gain(float gain) {
		gain => bGain;
	}

	fun void freq(float freq) {
		freq => bFreq;
	}

	fun void pan(float pan) {
		pan => bPan;
	}

	/**
	*	interpolates a function defined by n (>=2) values in a constant distance
	*/
	fun float interpolate(int ind, int dist, float value[]) {
		// check if 'ind' is in the defined range
		if (ind < 0 || ind >= dist * (value.cap()-1))
			return 0.0;

		1.0 * (ind % dist) / dist => float f;
		ind / dist => int pInd;
		return value[pInd]*(1-f) + value[pInd+1]*f;
	}
}

