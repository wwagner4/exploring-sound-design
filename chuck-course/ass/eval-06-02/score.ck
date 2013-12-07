//FutureBeat__Programming_for_Musicians_&_Digital Artists
//score.ck

//paths
me.dir() +"/hihat.ck" => string drumsPath;
me.dir() +"/bass.ck" => string bassPath;
me.dir() +"/introBass.ck" => string introBassPath;
me.dir() +"/kick.ck" => string kickPath;
me.dir() +"/moog.ck" => string moogPath;

//reference for timing
0.625::second => dur fourth;
fourth * 2 => dur half;
fourth * 4 => dur whole;
fourth / 2 => dur eighth;
fourth / 4 => dur sixteenth;
fourth / 8 => dur thirty2nd;

//add intro bass
Machine.add(introBassPath) => int introBassID ;
(fourth*8)=> now;

//add hihats
Machine.add(drumsPath) => int drumsID;
(fourth*8)=> now;

//remove introBass
Machine.remove(introBassID);

//add moog, bass and kick drumm
Machine.add(moogPath) => int moogID;
Machine.add(bassPath) => int bassID;
Machine.add(kickPath) => int kickID ;
(fourth*16)=> now;

//remove Hihats
Machine.remove(drumsID);
(fourth*8) => now;

//remove moog
Machine.remove(moogID);
(fourth*8) => now;

//remove kick
Machine.remove(kickID);
(fourth*16) => now;

//remmove bass
Machine.remove(bassID);


