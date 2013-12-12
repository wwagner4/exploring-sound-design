// assignment_7_noises_off
// score.ck
// air traffic control of composition. Rhythm controlled by BPM temp class

BPM tempo;
tempo.tempo(120.0); // 120 not used, overridden to .625s/quarternote in tempo class


// start with the 'mock synth' bass
Machine.add(me.dir()+"/mockSynth.ck") => int mockID;
4.0 * tempo.quarterNote => now;

// bring in some tubal bells
Machine.add(me.dir()+"/cowbell.ck") => int bellsID;
4.0 * tempo.quarterNote => now;

// kick up the beat 
Machine.add(me.dir()+"/kick.ck") => int kickID;
4.0 * tempo.quarterNote => now;

// bring in toms and snare drums
Machine.add(me.dir()+"/toms.ck") => int tomsID;
Machine.add(me.dir()+"/snare.ck") => int snareID;
4.0 * tempo.quarterNote => now;

// time for the melody 'bridge'
// shut off the mock synth and kick drums
Machine.remove(mockID);
Machine.remove(kickID);

// play the mandolin over the bells and snare and tom
Machine.add(me.dir()+"/smartMandolin82.ck") => int mandoID;
8.0 * tempo.quarterNote => now;

// add some hihat
Machine.add(me.dir()+"/hat.ck") => int hatID;

// transition back to main theme - bring back kick 
4.0 * tempo.quarterNote => now;
Machine.add(me.dir()+"/kick.ck") => int kick2ID;
4.0 * tempo.quarterNote => now;

// play some 'clapping' (different sample, same pattern as clapping)
Machine.add(me.dir()+"/clap.ck") => int clapID;
4.0 * tempo.quarterNote => now;

// Bridge is over, turn the mandolin and hihat off
// turn the mock synths back on
Machine.remove(mandoID);
Machine.remove(hatID);
Machine.add(me.dir()+"/mockSynth.ck") => int mock2ID;
12.0 * tempo.quarterNote => now;

// time to wind things down - immediately
// turn off all the instruments except kick drum
Machine.remove(hatID);
Machine.remove(snareID);
Machine.remove(mock2ID);
Machine.remove(tomsID);
Machine.remove(clapID);
Machine.remove(bellsID);

// play one more 'measure' of the kick drum.
tempo.quarterNote => now;
Machine.remove(kick2ID);
