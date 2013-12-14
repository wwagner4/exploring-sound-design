// Assignmet 4 Function Junction
// Assignmet_4_African_Accordeon

<<< "a", "started" >>>;

Bpm dur;
Config config;

// Midi notes
[51, 53, 55, 56, 58, 60, 61, 63] @=> int scale[];

// Length of melody
8 => int meloLen; 

// five different melodies and their gain per note
[  0,   0,   0,   7,   6,   7,   1,   1] @=> int   melo1[];
[1.0, 0.1, 0.1, 1.0, 0.1, 0.1, 0.1, 0.1] @=> float melo1Gain[];

[  1,   1,   1,   6,   7,   6,   6,   6] @=> int   melo2[];
[1.0, 0.1, 0.1, 1.0, 0.1, 0.1, 0.1, 0.1] @=> float melo2Gain[];

[  5,   5,   5,   5,   5,   4,   4,   4] @=> int   melo3[];
[0.1, 0.0, 0.1, 0.0, 0.1, 0.0, 0.1, 0.1] @=> float melo3Gain[];

[  0,   0,   0,   0,   3,   3,   3,   3] @=> int   melo4[];
[0.1, 0.0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0] @=> float melo4Gain[];

[  0,   0,   0,   0,   3,   3,   3,   3] @=> int   melo5[];
[0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] @=> float melo5Gain[];

// Master gain
Gain master => dac;
config.mainGain * config.meloGain => master.gain;

// TriOscs for the melody
TriOsc oscs[3];
for (0 => int i; i < oscs.cap(); i++) {
	oscs[i] => master;
}

// Play a chord
fun void chord(int base, int isMinor, int isUp) {
    Std.mtof(base) => oscs[0].freq;
	if (isMinor == 1) {
		Std.mtof(base + 4) => oscs[1].freq;
	} else {
		Std.mtof(base + 3) => oscs[1].freq;
	}
	if (isUp == 1) {
		Std.mtof(base + 7) => oscs[2].freq;
	} else {
		Std.mtof(base - 3) => oscs[2].freq;
	}
}

// Play one note
fun void playNote(int rnote, int isMinor, int isUp) {
	scale[rnote] => int note;
	chord(note, isMinor, isUp);
} 

// Envelope for note
fun void envelope(float dur, float maxGain, float attack) {
	now + dur::ms => time end;
	0.01 => float gain;
	maxGain / dur / attack => float diffAttack;
	- maxGain / dur / (1.0 - attack) => float diffDecay;
	diffAttack => float diff;
	while (now < end) {
		for (0 => int i; i < oscs.cap(); i++) {
			gain => oscs[i].gain;
		}
		1::ms => now;
		if (gain >= maxGain) {
			maxGain => gain;
			diffDecay => diff;
		}
		if (gain <= 0.0) {
			0.0 => gain;
			0.0 => diff;
		}
		diff +=> gain;
	}
}

// Play melody and percussion together
fun void melo(int k, int melo[], float meloGain[], int isMajor, int isUp, float attack) {
	melo[k] => int rnote;
	playNote(rnote, isMajor, isUp);
	envelope(dur.dur(1) / ms, meloGain[k], attack);
}


// Main Program
Math.random2(1, 2) => int meloNr;
Math.random2(0, 1) => int major;
Math.random2(0, 1) => int up;

Math.random2(1, 2) => meloNr;
Math.random2(0, 1) => major;
Math.random2(0, 1) => up;
for (0 => int i; i < meloLen * 4; i++ ) {
	melo(i % meloLen, melo4, melo4Gain, major, up, 0.2);
}
// Main melody
for (0 => int j; j < 3; j++) {
	Math.random2(1, 2) => meloNr;
	Math.random2(0, 1) => major;
	Math.random2(0, 1) => up;
	if (meloNr == 1) {
		for (0 => int i; i < meloLen; i++ ) {
			melo(i % meloLen, melo1, melo1Gain, major, up, 0.2);
		}
	} else if (meloNr == 2) {
		for (0 => int i; i < meloLen; i++ ) {
			melo(i % meloLen, melo2, melo2Gain, major, up, 0.2);
		}
	} 
	for (0 => int i; i < meloLen; i++ ) {
		melo(i % meloLen, melo3, melo3Gain, major, up, 0.2);
	}
}
for (0 => int i; i < meloLen * 1; i++ ) {
	melo(i % meloLen, melo5, melo5Gain, major, up, 0.2);
}
for (0 => int j; j < 3; j++) {
	Math.random2(1, 2) => meloNr;
	Math.random2(0, 1) => major;
	Math.random2(0, 1) => up;
	if (meloNr == 1) {
		for (0 => int i; i < meloLen; i++ ) {
			melo(i % meloLen, melo1, melo1Gain, major, up, 0.2);
		}
	} else if (meloNr == 2) {
		for (0 => int i; i < meloLen; i++ ) {
			melo(i % meloLen, melo2, melo2Gain, major, up, 0.2);
		}
	} 
	for (0 => int i; i < meloLen; i++ ) {
		melo(i % meloLen, melo3, melo3Gain, major, up, 0.2);
	}
}
for (0 => int i; i < meloLen * 1; i++ ) {
	melo(i % meloLen, melo5, melo5Gain, major, up, 0.2);
}
// Endphase
Math.random2(1, 2) => meloNr;
Math.random2(0, 1) => major;
Math.random2(0, 1) => up;
for (0 => int i; i < meloLen * 1; i++ ) {
	melo(i % meloLen, melo4, melo4Gain, major, up, 0.2);
}
for (0 => int i; i < meloLen * 1; i++ ) {
	melo(i % meloLen, melo5, melo5Gain, major, up, 0.2);
}

now / second => float all;
<<< "time",  all, "s" >>>;
