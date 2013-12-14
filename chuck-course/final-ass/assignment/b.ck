// Assignmet 4 Function Junction
// Assignmet_4_African_Accordeon

<<< "b", "started" >>>;

Bpm dur;
8 => int meloLen; 

// Midi notes
[51, 53, 55, 56, 58, 60, 61, 63] @=> int scale[];

// Files available
[
me.dir(-1) + "/audio/clap_01.wav", // 0
me.dir(-1) + "/audio/click_01.wav",
me.dir(-1) + "/audio/click_02.wav",
me.dir(-1) + "/audio/click_03.wav",
me.dir(-1) + "/audio/click_04.wav",
me.dir(-1) + "/audio/click_05.wav", // 5
me.dir(-1) + "/audio/cowbell_01.wav",
me.dir(-1) + "/audio/hihat_01.wav",
me.dir(-1) + "/audio/hihat_02.wav",
me.dir(-1) + "/audio/hihat_03.wav",
me.dir(-1) + "/audio/hihat_04.wav", // 10
me.dir(-1) + "/audio/kick_01.wav",
me.dir(-1) + "/audio/kick_02.wav",
me.dir(-1) + "/audio/kick_03.wav",
me.dir(-1) + "/audio/kick_04.wav",
me.dir(-1) + "/audio/kick_05.wav", // 15
me.dir(-1) + "/audio/snare_01.wav",
me.dir(-1) + "/audio/snare_02.wav",
me.dir(-1) + "/audio/snare_03.wav",
me.dir(-1) + "/audio/stereo_fx_01.wav",
me.dir(-1) + "/audio/stereo_fx_02.wav", // 20
me.dir(-1) + "/audio/stereo_fx_03.wav",
me.dir(-1) + "/audio/stereo_fx_04.wav",
me.dir(-1) + "/audio/stereo_fx_05.wav"
] @=> string files[];

// Percussion Instruments
[1, 2, 3, 5] @=> int percussion[];
[
// One pattern for each percussion, 
// length must be meloLen
[1,0,0,0,1,0,0,0], 
[1,1,0,0,1,0,0,0], 
[1,0,1,0,1,0,0,0], 
[1,0,0,1,0,1,1,1]  
] @=> int beats1[][];

[
// One pattern for each percussion, 
// length must be meloLen
[1,0,0,0,0,0,1,0], 
[1,0,0,0,1,1,0,0], 
[1,0,0,0,1,0,0,0], 
[1,0,0,1,1,0,0,0]  
] @=> int beats2[][];

// Master gain
Gain master => dac;
0.1 => master.gain;

// Master gain for melody
Gain mmaster => master;
2.0 => mmaster.gain;

// SndBuf for percussion
SndBuf bufs[percussion.cap()];
for (0 => int i; i < percussion.cap(); i++) {
	files[percussion[i]] => string file;
	bufs[i].read(file);
	bufs[i].samples() => bufs[i].pos;
	bufs[i] => master;
}

// Play the beats for one timeslot
fun void setBeat(int k, int beats[][]) {
	for (0 => int j; j < bufs.cap(); j++) {
		if (beats[j][k] > 0) {
			0 => bufs[j].pos;
		}
	}
}

// Play melody and percussion together
fun void melo(int k, int beats[][]) {
	setBeat(k, beats);
	dur.dur(1) => now;
}

// Main Program
for (0 => int i; i < meloLen * 4; i++ ) {
	melo(i % meloLen, beats1);
}
// Main melody
for (0 => int j; j < 3; j++) {
	for (0 => int i; i < meloLen; i++ ) {
		melo(i % meloLen, beats1);
	}
	for (0 => int i; i < meloLen; i++ ) {
		melo(i % meloLen, beats2);
	}
}
// Endphase
for (0 => int i; i < meloLen * 1; i++ ) {
	melo(i % meloLen, beats1);
}
for (0 => int i; i < meloLen * 1; i++ ) {
	melo(i % meloLen, beats1);
}

now / second => float all;
<<< "time",  all, "s" >>>;
