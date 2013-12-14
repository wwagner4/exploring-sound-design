// ###############################
// Author : 1234
// Date: 05/12/2013
// File: score.ck
// Description: on the fly drumming with global BPM conducting
// Project : Assignment 7
<<< "score.ck" >>>;

BPM tempo;
tempo.tempo(120.0);

// load in the common properties
Common property;

// load in the drone
InstDrone drone;

// time variables
now => time start;

// update the common properties

// song length
start + 30::second => property.endTime;
// song section variables
10::second + start => property.preIntro;  // length of section 10 seconds
20::second + start => property.intro;    // length of section 10 seconds
28::second + start => property.verse_1;  // length of section 8 seconds

Machine.add(me.dir()+"/kick.ck") => int kickID;
Machine.add(me.dir()+"/hat.ck") => int hatID;

Machine.add(me.dir()+"/snare.ck") => int snareID;
8.0 * tempo.quarterNote => now;

Machine.add(me.dir()+"/bass.ck") => int bassID;
8.0 * tempo.quarterNote => now;

Machine.add(me.dir()+"/piano.ck") => int pianoID;
Machine.add(me.dir()+"/playDrone.ck") => int droneID;

while( now < property.endTime ) {  
    8.0 * tempo.quarterNote => now;
}

Machine.remove(kickID);
Machine.remove(hatID);
Machine.remove(snareID);
Machine.remove(bassID);
Machine.remove(pianoID);
Machine.remove(droneID);

