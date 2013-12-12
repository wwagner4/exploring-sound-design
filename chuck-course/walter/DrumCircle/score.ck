// score.ck
// Assignment 7: latin classes

// using global BPM conducting
BPM tempo;
tempo.tempo(96.0);
<<< "Quarter [s] = ", tempo.quarterNote/1::second >>>;

now => time begin;

<<< "Tumbao" >>>;
Machine.add(me.dir()+"/tumbao.ck") => int tumbaoID;
8.0 * tempo.quarterNote => now;

<<< "Clave" >>>;
Machine.add(me.dir()+"/clave.ck") => int claveID;
8.0 * tempo.quarterNote => now;

<<< "Montuno" >>>;
Machine.add(me.dir()+"/montuno.ck") => int montunoID;
24.0 * tempo.quarterNote => now;

<<< "remove Montuno" >>>;
Machine.remove(montunoID);
4.0 * tempo.quarterNote => now;

<<< "remove Tumbao" >>>;
Machine.remove(tumbaoID);
4.0 * tempo.quarterNote => now;

Machine.remove(claveID);
<<< "at end: ", (now-begin)/1::second >>>;

