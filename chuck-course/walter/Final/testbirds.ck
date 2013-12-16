// testbirds.ck
// test file to run chirpingBirds standalone, not part of the assignment

now => time begin;

// the bird base class
Machine.add(me.dir()+"/Bird.ck");

// Alice, the first bird
Machine.add(me.dir()+"/Alice.ck");

// Bob, the second bird
Machine.add(me.dir()+"/Bob.ck");

// Carroll, the third bird
Machine.add(me.dir()+"/Carroll.ck");

// Chirping birds
Machine.add(me.dir()+"/chirpingBirds.ck") => int chirpingBirdsID;

20::second => now;
<<< "played for", (now-begin)/1::second, "seconds" >>>;

