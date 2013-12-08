// The score file for that piece

Bpm dur;
60 => dur.bpm;


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


