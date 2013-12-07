// score.ck
// Assignment 6: Jazz Band

// Add your composition files when you want them to come in
    
Machine.add(me.dir() + "/drums.ck") => int drumID;
5::second => now;

Machine.add(me.dir() + "/piano.ck") => int pianoID;
5::second => now;

Machine.add(me.dir() + "/pads.ck") => int padsID;
5::second => now;

Machine.remove(drumID);
Machine.remove(padsID);
Machine.add(me.dir() + "/shakers.ck") => int shakerID;
5::second => now;

Machine.add(me.dir() + "/drums.ck") => drumID;
Machine.add(me.dir() + "/pads.ck") => padsID;
5::second => now;

Machine.remove(padsID);
Machine.remove(pianoID);
5::second => now;

Machine.remove(drumID);
Machine.remove(shakerID);
