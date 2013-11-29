// score.ck
// Insert the title of your piece here

// Add your composition files when you want them to come in

Machine.add(me.dir() + "/drums.ck") => int drumID;

//10::second => now;

Machine.add(me.dir() + "/string.ck") => int stringID;

//10::second => now;

//Machine.add(me.dir() + "/flute.ck") => int fluteID;
//Machine.add(me.dir() + "/piano.ck") => int pianoID;

130::second => now;

Machine.remove(stringID);
Machine.remove(drumID);
//Machine.remove(fluteID);
//Machine.remove(pianoID);
