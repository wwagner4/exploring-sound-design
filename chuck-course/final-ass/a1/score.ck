// Final Project 
// Simplex Music
<<< "Simplex Music", "Score" >>>;

// The score file for that piece
// Set the speed in bpm
Bpm dur;
Config c;
100 => dur.bpm;
0.3 => c.mainGain;
0.3 => c.percGain;
0.7 => c.meloGain;

// Duration of one melody block
dur.dur(1) * 8 => dur meloDur;

// Start the percussion
Machine.add(me.dir() + "/b.ck");
meloDur * 1 => now;
// Start the melody
Machine.add(me.dir() + "/a.ck");


