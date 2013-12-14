// ###############################
// Author : 1234
// Date: 05/12/2013
// File: kick.ck
// Description: on the fly drumming with global BPM conducting
// Project : Assignment 7
<<< "kick.ck" >>>;

SndBuf kick => Gain master => dac;
me.dir(-1)+"/audio/kick_04.wav" => kick.read;

// parameter setup
.5 => kick.gain;

// set all playhead to end so no sound is made
kick.samples() => kick.pos;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;
// load in the common properties
Common property;

// initialize counter variable
0 => int counter;
0 => int measureCount;
16 => int beatCount;

// #####################################    
// do Nothing section  
// parameter:
//   counter : The beat count
//   counter : The measure count
// #####################################    
fun void doNothing(int beat, int measure)
{
}

// #####################################    
// play drum beat
// parameter:
//   counter : The beat count
//   counter : The measure count
// #####################################    
fun void playDrumBeat(int beat, int measure)
{
    // bass drum
    if ( (beat == 0) || (beat == 10) )
    {
        0 => kick.pos;
    }
}

while (1)  {
    // update our basic beat each measure
    tempo.sixteenthNote => dur tempo;

    // beat goes from 0 to (beatCount -1)
    counter % beatCount => int beat;

    // measure goes from 0 to (measureCount -1)
    measureCount % 4 => measureCount;

    if ( now <= property.preIntro )
    {
      playDrumBeat(beat, measureCount);  
    } else if ( now < property.intro ) {
      doNothing(beat, measureCount);  
    } else if ( now < property.verse_1 ) {
      playDrumBeat(beat, measureCount);  
    } else {
      doNothing(beat, measureCount);  
    }

    // the counters, beat and measure
    if ( (beat == 0) || (beat == 8) )
      measureCount++; // measureCount + 1 => measureCount; 
    counter++; // counter + 1 => counter; 
    <<<"Kick Counter: ", counter, "Beat: ", beat >>>;
    <<<"Kick Measure: ", measureCount, "Beat: ", beat >>>;

    // advance time
    tempo => now;
}    
    
