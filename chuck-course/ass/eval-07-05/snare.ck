// ###############################
// Author : 1234
// Date: 05/12/2013
// File: snare.ck
// Description: on the fly drumming with global BPM conducting
// Project : Assignment 7
<<< "snare.ck" >>>;

// sound chain
Gain master => dac;
SndBuf snare => master;

me.dir(-1)+"/audio/snare_01.wav" => snare.read;

// parameter setup
.5 => snare.gain;
.5 => master.gain;

// set all playhead to end so no sound is made
snare.samples() => snare.pos;

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
// play snare beat
// parameter:
//   counter : The beat count
//   counter : The measure count
// #####################################    
fun void playSnare(int beat, int measure)
{
    // snare
    if ( (beat == 4) || (beat == 12) )
    {
      Math.random2f(0.9,1.2) => snare.rate;
      Math.random2f(1.2,2.0) => snare.gain;
      0 => snare.pos;
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
      playSnare(beat, measureCount);  
    } else if ( now < property.intro ) {
      doNothing(beat, measureCount);  
    } else if ( now < property.verse_1 ) {
      playSnare(beat, measureCount);  
    } else {
      doNothing(beat, measureCount);  
    }

    // the counters, beat and measure
    if ( (beat == 0) || (beat == 8) )
      measureCount++; // measureCount + 1 => measureCount; 
    counter++; // counter + 1 => counter; 
    <<<"Snare Counter: ", counter, "Beat: ", beat >>>;
    <<<"Snare Measure: ", measureCount, "Beat: ", beat >>>;

    // advance time
    tempo => now;
}    
    
