// score.ck
// Assignment 8: Concert for wind, sun and three birds

<<< "Concert for wind, sun and three birds" >>>;

now => time begin;

// Wind
Machine.add(me.dir()+"/soughingWind.ck") => int soughingWindID;
Machine.add(me.dir()+"/howlingWind.ck") => int howlingWindID;

25::second => now;

// Birds
Machine.add(me.dir()+"/chirpingBirds.ck") => int chirpingBirdsID;

10::second => now;

// Sun
Machine.add(me.dir()+"/sun.ck") => int sunID;

3::second => now;
Machine.remove(soughingWindID);

25::second => now;

<<< "the end ... played for", (now-begin)/1::second, "seconds" >>>;

