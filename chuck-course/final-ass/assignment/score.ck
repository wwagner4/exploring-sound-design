// Assignment_7_marching_flutes_retreat

// The score file for that piece

// Set the speed in bpm
Bpm dur;
Config c;
100 => dur.bpm;
0.9 => c.mainGain;
0.1 => c.percGain;
0.3 => c.meloGain;

// Start the instruments
Machine.add(me.dir() + "/a.ck");
Machine.add(me.dir() + "/b.ck");


