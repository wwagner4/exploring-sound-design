// Assignment_7_noises_off
// kick.ck
// pretty vanilla kick drum
SndBuf kick => dac;
me.dir(-1)+"/audio/kick_01.wav" => kick.read;
.4 => kick.gain;
kick.samples() => kick.pos;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

while (1)  {
    // update our basic beat each measure
    tempo.quarterNote => dur quarter;
    tempo.eighthNote => dur eighth;
    
    // play kick every beat
    for (0 => int beat; beat < 4; beat++)  {
        0 => kick.pos;
        quarter => now;
    }
    // at the end of every 2 measures play a triplet
    for (0 => int beat; beat < 4; beat++)  {
        if ( beat == 3)
        {
            0 => kick.pos;
            eighth => now;
            0 => kick.pos;
            eighth => now;
       }
    }

}    

