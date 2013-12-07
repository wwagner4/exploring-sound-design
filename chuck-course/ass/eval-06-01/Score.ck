// Assignment6_JazzHands

// score.ck

//paths
me.dir() + "/Piano.ck" => string pianoPath;
me.dir() + "/Bass.ck" => string bassPath;
me.dir() + "/Drums.ck" => string drumsPath;
me.dir() + "/Flute.ck" => string flutePath;

// start piano
Machine.add(pianoPath) => int pianoID;
4.8::second => now;

// start drums
Machine.add(drumsPath) => int drumsID;
4.8::second => now;

// start bass
Machine.add(bassPath) => int bassID;
4.8::second => now;

// start flute solo
Machine.add(flutePath) => int fluteID;
4.8::second => now;

//remove drums
Machine.remove(drumsID);
4.8::second => now;

Machine.add(drumsPath) => drumsID;


//remove drums
Machine.remove(bassID);
5::second => now;

//remove drums
Machine.remove(drumsID);
1::second => now;

//remove drums
Machine.remove(fluteID);
.5::second => now;

//remove drums
Machine.remove(pianoID);
0.05::second => now;
