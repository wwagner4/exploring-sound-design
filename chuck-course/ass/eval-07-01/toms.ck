 // Assignment_7_noises_off
// toms.ck
// Not really 'toms', I couldn't get a good tom-tom sound so this
// is a clicky percussion instrument.

SndBuf tom1 => dac;
SndBuf tom2 => dac;
me.dir(-1)+"/audio/snare_01.wav" => tom1.read;
me.dir(-1)+"/audio/snare_02.wav" => tom2.read;

0 => tom1.gain;
0 => tom2.gain;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

// use different rates to effect the pitch so 
//there is a high tom and a low tom
.8 => tom1.rate;
.3 => tom2.rate;

while (1)  {
    // update our basic beat each measure
    tempo.eighthNote => dur quarter;

    // play some tom sounds -- not rhythm is similar (or identical)
    // to the rhythym used in the mockSynth.ck file for the synth bass
    for (0 => int beat; beat < 4; beat++)  
    {
        if ( Math.random2(0,5) < 2 )
        {
            if ( beat == 4 )
            {
                0 => tom2.pos;
                .3 => tom2.gain;
            }
            else
            {
                0 => tom2.gain;
            }
            0 => tom1.pos;
            .3 => tom1.gain;
            tempo.quarterNote => now;
        }
        else
        {
            if ( Math.random2(0,5) < 3 )
            {
                0 => tom1.pos;
                3.0 => tom1.rate;
                .3 => tom1.gain;
                tempo.eighthNote => now;
                0 => tom2.pos;
                .3 => tom2.gain;
                2.0 => tom2.rate;
                tempo.eighthNote => now;
            }
            else
            {
                4.0 => tom1.rate;
                .3 => tom1.gain;
                0 => tom1.pos;
                tempo.sixteenthNote => now;
                0 => tom1.pos;
                tempo.sixteenthNote => now;
                tempo.sixteenthNote => now;
                2.0 => tom1.rate;
                tempo.sixteenthNote => now;
            }
            
    }
    
    }
}    