// Assignmet 4 Function Junction
// Assignmet_4_African_Accordeon

<<< "b", "started" >>>;

Bpm dur;
Config config;
8 => int meloLen; 

// Percussion Instruments
[1, 2, 3, 5] @=> int percussion[];
[-0.6, -0.4, 0.4, 0.6] @=> float percPan[];
[
// One pattern for each percussion, 
// length must be meloLen
[1,0,0,0,1,0,0,0], 
[1,1,0,0,1,0,0,0], 
[1,0,1,0,1,0,0,0], 
[1,0,0,1,0,1,1,1]  
] @=> int beats1[][];

[
[1,0,0,0,0,0,0,0], 
[1,0,0,0,0,0,0,0], 
[0,0,0,0,0,0,0,0], 
[1,0,0,1,0,1,1,1]  
] @=> int beats3[][];

[
// One pattern for each percussion, 
// length must be meloLen
[1,0,0,0,0,0,1,0], 
[1,0,0,0,1,1,0,0], 
[1,0,0,0,1,0,0,0], 
[1,0,0,1,1,0,0,0]  
] @=> int beats2[][];

// SndBuf for percussion
Sounds sounds[percussion.cap()];
for (0=>int i; i<percussion.cap(); i++) {
  percussion[i] => sounds[i].instIndex;
  percPan[i] => sounds[i].pan;
}

// Play the beats for one timeslot
fun void setBeat(int k, int beats[][]) {
	for (0 => int j; j < sounds.cap(); j++) {
		if (beats[j][k] > 0) {
			1.0 * config.mainGain * config.percGain => sounds[j].keyOn;
		}
	}
}

// Play percussion
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
repeat (14) {
  for (0 => int i; i < meloLen * 1; i++ ) {
	  melo(i % meloLen, beats1);
  }
}
repeat (4) {
  for (0 => int i; i < meloLen * 1; i++ ) {
	  melo(i % meloLen, beats3);
  }
}
now / second => float all;
<<< "time",  all, "s" >>>;
