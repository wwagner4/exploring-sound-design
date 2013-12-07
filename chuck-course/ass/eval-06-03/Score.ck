//
// Assignment_6_Annoying_Parade: Score.ck
//
// This controls the piece by starting and stopping the various musical
// instrument elements, some of which are quite annoying.

// Quarter-note beat
625::ms => dur beat;

// Instrument scripts
me.dir() + "/Ride.ck" => string ride;
me.dir() + "/Hihat.ck" => string hihat;
me.dir() + "/Kick.ck" => string kick;
me.dir() + "/Snare.ck" => string snare;
me.dir() + "/Hit.ck" => string hit;
me.dir() + "/Roll.ck" => string roll;
me.dir() + "/Reed.ck" => string reed;
me.dir() + "/Piano.ck" => string piano;
me.dir() + "/Bass.ck" => string bass;
me.dir() + "/Rip.ck" => string rip;
me.dir() + "/Fall.ck" => string fall;
me.dir() + "/Swanee.ck" => string swanee;
me.dir() + "/Wah.ck" => string wah;

<<< "Assignment_6_Annoying_Parade" >>>;

////// Lead-in
Machine.add(hit); 
Machine.add(rip);
beat * 2 => now;
Machine.add(roll);
beat * 2 => now;

////// Section A
Machine.add(hit); 
Machine.add(ride) => int cymbalID; 
Machine.add(kick) => int kickID; 
Machine.add(reed) => int reedID;
Machine.add(piano) => int pianoID;
Machine.add(bass) => int bassID;
beat * 8 => now;

////// Section A repeat
Machine.add(snare) => int snareID; 
beat * 8 => now;

////// Section B
Machine.replace(reedID, swanee);
Machine.remove(pianoID);
Machine.replace(cymbalID, hihat);
Machine.replace(bassID, bass);
Machine.add(wah) => int wahID;
beat * 4 => now;
Machine.replace(wahID, wah);
beat * 3.50 => now;
Machine.remove(wahID);
beat / 2 => now;
Machine.add(wah) => wahID;
beat * 4 => now;
Machine.remove(wahID);
beat * 2 => now;
Machine.replace(snareID, roll);
beat * 2 => now;

/////// Section A reprise
Machine.replace(cymbalID, ride);
Machine.add(hit); 
Machine.replace(snareID, snare);
Machine.replace(reedID, reed); 
Machine.add(piano) => pianoID; 
Machine.replace(bassID, bass);
beat * 8 => now;

////// Coda
Machine.replace(reedID, swanee);
Machine.remove(pianoID);
Machine.remove(cymbalID);
Machine.remove(kickID);
Machine.remove(snareID);
Machine.remove(bassID);
Machine.add(hit); 
Machine.add(rip);
beat * 2 => now;
Machine.add(fall);
Machine.add(roll);
Machine.add(wah) => wahID;
beat => now;
Machine.add(roll) => int rollID;
beat => now;
Machine.replace(rollID, roll);
Machine.add(hit); 
beat => now;
Machine.replace(rollID, roll);
beat * 2 => now;
Machine.remove(wahID);
Machine.remove(reedID);
Machine.remove(rollID);
Machine.add(hit);
Machine.add(bass) => bassID;
beat * 1 => now;
Machine.remove(bassID);
<<< "That's all, folks." >>>;