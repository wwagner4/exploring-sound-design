// ###############################
// Author : 1234
// Date: 05/12/2013
// File: hat.ck
// Description: on the fly drumming with global BPM conducting
// Project : Assignment 7
<<< "hat.ck" >>>;

Gain master => dac;
SndBuf hihat2 => master;
SndBuf hihat4 => master;

me.dir(-1)  + "/audio/hihat_02.wav" => hihat2.read;
me.dir(-1)  + "/audio/hihat_04.wav" => hihat4.read;

// parameter setup
.5 => hihat2.gain;
.5 => hihat4.gain;

// set all playhead to end so no sound is made
hihat2.samples() => hihat2.pos;
hihat4.samples() => hihat4.pos;

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
// play hat beat
// parameter:
//   counter : The beat count
//   counter : The measure count
// #####################################    
fun void playHat(int beat, int measure)
{
    // hihat 2
    if ( (beat == 0) || (beat == 2) || (beat == 4) ||
         (beat == 6) || (beat == 8) ||
         (beat == 10) || (beat == 11) || (beat == 12) ||
         (beat == 13) || (beat == 14) )
    {
      Math.random2f(0.2,0.4) => hihat2.gain;
      Math.random2f(0.9,1.2) => hihat2.rate;
      0 => hihat2.pos;
    } 

    // hihat 4
    if ( (beat == 0) || (beat == 10) )
    {
      Math.random2f(0.1,0.2) => hihat4.gain;
      Math.random2f(0.9,1.2) => hihat4.rate;
      0 => hihat4.pos;
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
      playHat(beat, measureCount);  
    } else if ( now < property.intro ) {
      doNothing(beat, measureCount);  
    } else if ( now < property.verse_1 ) {
      playHat(beat, measureCount);  
    } else {
      doNothing(beat, measureCount);  
    }

    // the counters, beat and measure
    if ( (beat == 0) || (beat == 8) )
      measureCount++; // measureCount + 1 => measureCount; 
    counter++; // counter + 1 => counter; 
    <<<"Hat Counter: ", counter, "Beat: ", beat >>>;
    <<<"Hat Measure: ", measureCount, "Beat: ", beat >>>;

    // advance time
    tempo => now;
}    
    
