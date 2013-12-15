// Assignment_7_marching_flutes_retreat

// The score file for that piece

// Set the speed in bpm
Bpm dur;
Config c;
100 => dur.bpm;
0.3 => c.mainGain;
0.3 => c.percGain;
0.7 => c.meloGain;

dur.dur(1) * 8 => dur meloDur;

// Start the instruments
Machine.add(me.dir() + "/b.ck");
meloDur * 1 => now;
Machine.add(me.dir() + "/a.ck");


