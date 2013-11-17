// Assignmet 4 Function Junction

[51, 53, 55, 56, 58, 60, 61, 63] @=> int scale[];

[
me.dir() + "/audio/clap_01.wav", // 0
me.dir() + "/audio/click_01.wav",
me.dir() + "/audio/click_02.wav",
me.dir() + "/audio/click_03.wav",
me.dir() + "/audio/click_04.wav",
me.dir() + "/audio/click_05.wav", // 5
me.dir() + "/audio/cowbell_01.wav",
me.dir() + "/audio/hihat_01.wav",
me.dir() + "/audio/hihat_02.wav",
me.dir() + "/audio/hihat_03.wav",
me.dir() + "/audio/hihat_04.wav", // 10
me.dir() + "/audio/kick_01.wav",
me.dir() + "/audio/kick_02.wav",
me.dir() + "/audio/kick_03.wav",
me.dir() + "/audio/kick_04.wav",
me.dir() + "/audio/kick_05.wav", // 15
me.dir() + "/audio/snare_01.wav",
me.dir() + "/audio/snare_02.wav",
me.dir() + "/audio/snare_03.wav",
me.dir() + "/audio/stereo_fx_01.wav",
me.dir() + "/audio/stereo_fx_02.wav", // 20
me.dir() + "/audio/stereo_fx_03.wav",
me.dir() + "/audio/stereo_fx_04.wav",
me.dir() + "/audio/stereo_fx_05.wav"
] @=> string files[];

6 => int meloLen; 
[  0,   1,   5,   5,   5,   4] @=> int   melo1[];
[1.0, 0.1, 1.0, 0.1, 1.0, 1.0] @=> float melo1Gain[];

[1, 6] @=> int percussion[];
[
// One pattern for each percussion, 
// length must be meloLen
[1,0,1,0,1,0], 
[1,0,0,0,0,0]  
] @=> int beats1[][];

[
// One pattern for each percussion, 
// length must be meloLen
[1,0,1,0,1,0], 
[1,0,0,0,0,0]  
] @=> int beats2[][];


Gain master => dac;
0.1 => master.gain;
Gain mmaster => master;
0.3 => mmaster.gain;
TriOsc oscs[3];
for (0 => int i; i < oscs.cap(); i++) {
	oscs[i] => mmaster;
}

SndBuf bufs[percussion.cap()];
for (0 => int i; i < percussion.cap(); i++) {
	files[percussion[i]] => string file;
	bufs[i].read(file);
	bufs[i].samples() => bufs[i].pos;
	bufs[i] => master;
}

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

fun void playNote(int rnote, int isMinor, int isUp) {
	scale[rnote] => int note;
	<<< "note", note >>>;
	chord(note, isMinor, isUp);
} 

fun void setBeat(int k, int beats[][]) {
	for (0 => int j; j < bufs.cap(); j++) {
		if (beats[j][k] > 0) {
			0 => bufs[j].pos;
		}
	}
}

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

fun void melo(int k, int melo[], int beats[][], 
		int isMajor, int isUp, float attack) {
	melo[k] => int rnote;
	playNote(rnote, isMajor, isUp);
	setBeat(k, beats);
	envelope(300, melo1Gain[k], attack);
}

0 => int i;
while(true) {
	for (0 => int j; j < 4; j++) {
		melo(i % meloLen, melo1, beats1, 1, 0, 0.2);
		i++;
		melo(i % meloLen, melo1, beats1, 0, 0, 0.2);
		i++;
		melo(i % meloLen, melo1, beats1, 0, 0, 0.2);
		i++;
	}
	for (0 => int j; j < 4; j++) {
		melo(i % meloLen, melo1, beats1, 1, 0, 0.2);
		i++;
		melo(i % meloLen, melo1, beats1, 0, 0, 0.2);
		i++;
		melo(i % meloLen, melo1, beats1, 0, 0, 0.2);
		i++;
	}
}