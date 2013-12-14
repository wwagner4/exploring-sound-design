// myscore.ck
// BPM controls the beat for all things
// timed at approx 31 seconds
BPM tempo;
tempo.tempo(96.0);// 0.625 found!!

Machine.add(me.dir()+"/myosc.ck") => int ionID;
1.6::second => now;

Machine.add(me.dir()+"/mybass.ck") => int bassID;
10.0 * tempo.quarterNote => now;
Machine.remove(bassID);

tempo.tempo(120);// speed it up a little
Machine.add(me.dir()+"/mybass.ck") => bassID;
9.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/mysnare.ck") => int snareID;

Machine.add(me.dir()+"/myhat.ck") => int hatID;
9.0 * tempo.quarterNote => now;

Machine.remove(bassID);
9.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/mybass.ck") => bassID;
Machine.remove(snareID);
9.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/mysnare.ck") => snareID;
Machine.remove(hatID);
9.0 * tempo.quarterNote => now;


Machine.remove(bassID);
Machine.remove(snareID);
