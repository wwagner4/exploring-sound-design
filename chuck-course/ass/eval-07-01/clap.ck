// Assignment_7_noises_off
// clap.ck
// basic clapping code from class, but I changed the sample
// because I wanted something rhythmically similar just way
// less annoying.
SndBuf click => dac;
me.dir(-1)+"/audio/click_01.wav" => click.read;

// make a conductor
// this is set and controlled elsewhere
BPM tempo;
2 => click.rate;
.2 => click.gain;

while (1)  {
    // our basic beat for this instrument
    // update this every measure
    tempo.sixteenthNote => dur sixteenth;
    
    // play a whole measure of 16 16th notes
    for (0 => int beat; beat < 16; beat++)  {
        // click randomly on 16th notes
//        if (Math.random2(0,7) < 3) {
            0 => click.pos;
//        }
        sixteenth => now;
    }
}    
    
