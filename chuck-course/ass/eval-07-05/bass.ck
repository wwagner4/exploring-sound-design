// ###############################
// Author : 1234
// Date: 05/12/2013
// File: bass.ck
// Description: mandolin for bass
// Project : Assignment 7
<<< "bass.ck" >>>;

// sound chain (mandolin for bass)
Mandolin bass => NRev r => dac;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

// load in the common properties
Common property;

// parameter setup
0.1 => r.mix;
0.0 => bass.stringDamping;
0.02 => bass.stringDetune;
0.05 => bass.bodySize;
4 => int walkPos;
.5 => bass.gain;

// initialize counter variable
0 => int counter;
0 => int measureCount;
16 => int beatCount;

// #####################################    
// do Nothing section  
// parameter:
//   beat : The beat count
//   measure : The measure count
// #####################################    
fun void doNothing(int beat, int measure)
{
    1 => bass.noteOff;
    // advance time
    tempo.sixteenthNote => now;
}

// #####################################    
// Bass section  
// parameter:
//   beat : The beat count
//   measure : The measure count
// #####################################    
fun void bassLine(int beat, int measure)
{
    beat => walkPos; 
    if (walkPos < 0) 1 => walkPos;
    if (walkPos >= property.scale.cap()) property.scale.cap()-2 => walkPos;
    Std.mtof(property.scale[walkPos]-12) => bass.freq;
    Math.random2f(0.05,0.5) => bass.pluckPos;
    1 => bass.noteOn;
    // advance time
    tempo.sixteenthNote => now;

    1 => bass.noteOff;
    // advance time
    tempo.sixteenthNote => now;
}

// loop
while (1)  {
    // beat goes from 0 to (beatCount -1)
    counter % beatCount => int beat;

    // measure goes from 0 to (measureCount -1)
    measureCount % 4 => measureCount;

    if ( now <= property.preIntro )
    {
      bassLine(beat, measureCount);  
    } else if ( now < property.intro ) {
      doNothing(beat, measureCount);  
    } else if ( now < property.verse_1 ) {
      bassLine(beat, measureCount);  
    } else {
      doNothing(beat, measureCount);  
    }

    // the counters, beat and measure
    if ( (beat == 0) || (beat == 8) )
      measureCount++; // measureCount + 1 => measureCount; 
    counter++; // counter + 1 => counter; 
    <<<"Bass Counter: ", counter, "Beat: ", beat >>>;
    <<<"Bass Measure: ", measureCount, "Beat: ", beat >>>;
}    


