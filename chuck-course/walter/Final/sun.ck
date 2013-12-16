// sun.ck
// Assignment 8: Concert for wind, sun and three birds

// play note for given duration
fun void playNote(int note, float gain, dur play, dur release) {
	//<<< "playNote", note, gain, play/second, release/second >>>;
	
	// UGens along with settings
	PercFlut i => ADSR env => dac;

	Std.mtof(note) => i.freq;
	gain => i.gain;

	(0.1::second, 0.4::second, 0.7, release) => env.set;

	// play note for given duration
	1 => i.noteOn;
	1 => env.keyOn;
	play => now;

	// set envelope off and wait for release time
	1 => env.keyOff;
	release => now;
	1 => i.noteOff;

	// unchuck Ugens
	env =< dac;
}

// get random value within a given distance from mid
fun float randomIn(float mid, float distance) {
	return Math.random2f(mid-distance, mid+distance);
}

<<< "sun is coming back" >>>;

// sun chord
[48, 52, 55, 60, 64] @=> int melodyChord[];

// kind of weaving the chord: take 3 out of 5 during each step
3 => int takeN;
0 => int chordIndex;
0 => int stepCnt;
while (stepCnt < 32) {

	// calculate gain for current step
	float gain;
	if (stepCnt < 25) {
		// sun chord is swelling
		0.1 + (stepCnt/25.0) * 0.7 => gain;
	}
	else {
		// at the end degrade gain towards 0
		0.77 - (stepCnt-25.0)/7.0 * 0.8 => gain;
	}
	gain/takeN => float noteGain;

	// loop for takeN
	for (0 => int ii; ii<takeN; ii++) {
		spork ~ playNote(
			melodyChord[chordIndex], 
			randomIn(noteGain, Math.min(noteGain, 0.1)),
			randomIn(1, 0.5)::second,
			randomIn(2, 0.5)::second);
	
		// set next index
		(chordIndex+3) % melodyChord.cap() => chordIndex;
	}

	randomIn(0.8, 0.2)::second => now;
	stepCnt++;
}

// time to release all currently played notes
3::second => now;

