// Assignment_7_marching_flutes_retreat

// The score file for that piece

// Set the speed in bpm
Bpm dur;
60 => dur.bpm;

// Start the instruments
Machine.add(me.dir() + "/inst01.ck");
Machine.add(me.dir() + "/inst02.ck");
Machine.add(me.dir() + "/inst03.ck");

dur.dur(0) * 4 => now;
Machine.add(me.dir() + "/inst04.ck");

dur.dur(0) * 4 => now;
Machine.add(me.dir() + "/inst01a.ck");
Machine.add(me.dir() + "/inst04.ck");

dur.dur(0) * 4 => now;
Machine.add(me.dir() + "/inst04.ck");

dur.dur(0) * 4 => now;
Machine.add(me.dir() + "/inst01a.ck");


