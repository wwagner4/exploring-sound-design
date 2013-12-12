// Assignment_7_noises_off
// mockSynth.ck
//
// This was originally written to be tom-toms. 
// but I was trying different samples and found 
// this really cool sound that I ended up using
// as a kind of synth bass. It has the tom-tom rhythmic pattern
// so it sounds kind of odd by itself. I think it works in the
// context of the composition as a whole.

SndBuf synth1 => Pan2 pt1 => dac;
SndBuf synth2 => Pan2 pt2 => dac;
me.dir(-1)+"/audio/stereo_fx_02.wav" => synth1.read;
me.dir(-1)+"/audio/stereo_fx_02.wav" => synth2.read;

// turn down the volume so no sounds escape early
0 => synth1.gain;
0 => synth2.gain;
0=>pt2.gain;
// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

while (1)  {
    // update our basic beat each measure
    tempo.quarterNote => dur quarter;
    tempo.eighthNote => dur eighth;

    // play some funky synth sounds
    for (0 => int beat; beat < 4; beat++)  
    {
        // add some randomness into the rhythym so it won't
        // get boring as quickly.
        //
 
 // reverse the panning of the two synths 50% of the time 
        if ( Math.random2(0,1) == 0 )
        { 
            -0.7 => pt1.pan;
            0.7 => pt2.pan;
        }
        else
        { 
            -0.7 => pt2.pan;
            0.7 => pt1.pan;
        }
 
       // 3 different patterns for synths ('toms')
       // synth1 always plays, vary the pattern
       // synth2 plays 40% of the time 
       if ( Math.random2(0,5) < 2 )
        {
            if ( beat == 4 )
            {
                0 => synth2.pos;
                .3 => synth2.gain;
            }
            else
            {
                0 => synth2.gain;
            }
            0 => synth1.pos;
            .3 => synth1.gain;
            tempo.quarterNote => now;
        }
        else
        {
            // different rates give different pitches
            // vary the pitches and pattern of beats randomly
            if ( Math.random2(0,5) < 3 )
            {
                0 => synth1.pos;
                3.0 => synth1.rate;
                .3 => synth1.gain;
                tempo.eighthNote => now;
                0 => synth2.pos;
                .3 => synth2.gain;
                2.0 => synth2.rate;
                tempo.eighthNote => now;
            }
            else
            {
                4.0 => synth1.rate;
                .3 => synth1.gain;
                0 => synth1.pos;
                tempo.sixteenthNote => now;
                0 => synth1.pos;
                tempo.sixteenthNote => now;
                tempo.sixteenthNote => now;
                2.0 => synth1.rate;
                tempo.sixteenthNote => now;
            }
            
    }
    
    }
}    
    
