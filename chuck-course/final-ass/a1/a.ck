// Final Project 
// Final Project 
// Simplex Music
<<< "Simplex Music", "Melody" >>>;

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

// TriOscs and envelopes for the melody
TriOsc oscs[3];
ADSR env[3];
for (0 => int i; i < oscs.cap(); i++) {
	oscs[i] => env[i] => master;
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
fun void envelope(int i, float dura, float maxGain, float attack) {
	config.mainGain * config.meloGain * maxGain => master.gain;
    dura::ms * 0.5 => dur a;
    dura::ms * 0.5 => dur b;
	dura::ms * 0.01 => dur a1;
	b => dur b1;
    env[i].set( a1, 0::ms, 1.0, b1 );
    env[i].keyOn();
    a => now;
    env[i].keyOff();
    b => now;
}

// Play melody and percussion together
fun void melo(int k, int melo[], float meloGain[], int isMajor, int isUp, float attack) {
	melo[k] => int rnote;
	playNote(rnote, isMajor, isUp);
    for (0 => int i; i < env.cap(); i++) {
		spork ~ envelope(i, dur.dur(1) / ms, meloGain[k], attack);
	}
	dur.dur(1) => now;
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
repeat(3) {
	for (0 => int i; i < meloLen * 1; i++ ) {
		melo(i % meloLen, melo4, melo4Gain, major, up, 0.2);
	}
}
now / second => float all;
<<< "time",  all, "s" >>>;
