// Assignment_1_All_Oscillators_Relax

/*

This assignment uses three oscillators 
to play different parts of a melody
( term used loosely here :) ).

The melody consists of eight "beats" in a "measure", 
and there are eight "measures".

Each measure uses an initial frequency 
that all notes in that measure are based on.
The initial frequency changes depending on the measure.

The 8-measure sequence repeats twice, and ends with a
fading out of the square wave.

*/

// set up oscillators
SinOsc sine => dac; 
TriOsc triangle => dac;
SqrOsc square => dac;

// set the initial volumes
0.1 => sine.gain;
0 => triangle.gain;
0=> square.gain;

// establish time counters
0 => int t; // this roughly corresponds to beats
0 => int measure; // this roughly corresponds to measures
0 => int repeats; // number of times to repeat the pattern

// this is what the frequency that the music will be based around
// every frequency used will be some variation around this intial value
220 => int initialFrequency;


initialFrequency => sine.freq;

while( repeats < 1)
{
    // keep track of where we are in the piece
    <<< "time: ", t >>>;
    <<< "measure: ", measure >>>;
    
    // start at the beginning
    if ( t < 1)
    {
        // set frequencies of sine and square waves
        initialFrequency + 110 => sine.freq;
        initialFrequency/4 => square.freq;
        
        // set volumes of sine and square waves
        0.005 => square.gain;        
        0.2 => sine.gain;

        // play triangle frequency sweep on measures 2,3,6, and 7
        if ( measure == 2 || measure == 3 || measure == 6 || measure == 7 )
        {
            for ( initialFrequency + 260 => int f; f >= 40 ; f-2 => f)
            {
                0.1 => triangle.gain;
                f => triangle.freq;
                1.25::ms => now;
            } 
        } 
        else
        {
            1::second => now;
        }
           
    }
    if ( t == 2 )
    {
        // set frequency of sine wave only
        initialFrequency + 80 => sine.freq;
        
        // set volumes of sine and square waves
        0.3 => sine.gain;
        0.010 => square.gain;
        
        // play for one second
        1::second => now;
    }
    if ( t == 3)
    {
        // set frequency of sine wave
        initialFrequency + 110 => sine.freq;     
        
        // set volumes of sine and square waves
        0.2 => sine.gain;
        0.015 => square.gain;
        
        // play triangle frequency sweep on measures 2,3,6, and 7
        // otherwise play for 1 second
        if ( measure == 2 || measure == 3 || measure == 6 || measure == 7  )
        {
            for ( initialFrequency + 260 => int f; f >= 40 ; f-2 => f)
            {
                0.1 => triangle.gain;
                f => triangle.freq;
                1.25::ms => now;
            } 
        }
        else
        {
            1::second => now;
        }
    }
    if ( t == 4)
    {
        // set frequency of sine wave only
        initialFrequency + 80 => sine.freq;
        
        // set volumes of sine and square waves
        0.3 => sine.gain;
        0.02 => square.gain;
        
        // play for 0.3 second
        0.3::second => now;
    }
    if ( t == 5)
    {
        // set frequency of sine wave only
        initialFrequency + 180 => sine.freq;
        0.2 => sine.gain;
    }   0.025 => square.gain;
    if ( t == 5 && t < 6)
    {       
        // set frequency of sine wave only
        initialFrequency + 260 => sine.freq;
        
        // set volumes of sine and square waves
        0.2 => sine.gain;
        0.03 => square.gain;
        
        // play two triangle frequency sweeps on measures 2,3,6, and 7
        if ( measure == 2 || measure == 3 || measure == 6 || measure == 7 )
        {
            for ( initialFrequency => int f; f <= initialFrequency + 260; f++)
            {
                0.1 => triangle.gain;
                f => triangle.freq; 
                1.25::ms => now;
            } 
            for ( initialFrequency + 260 => int f; f >= 40 ; f-2 => f)
            {
                0.1 => triangle.gain;
                f => triangle.freq;
                1.25::ms => now;
            } 
            0 => triangle.gain;
        }
        else
        {
            0.3::second => now;
        }
    }
    if ( t == 6 && t < 8)
    {
        // set frequency of sine wave only
        initialFrequency + 220 => sine.freq;
        
        // set volumes of sine and square waves
        0.1 => sine.gain;
        0.025 => square.gain;
        
        // time on measures 2,3,6, and 7
        if ( measure == 2 || measure == 3 || measure == 6 || measure == 7 )
        {
            1.25::ms => now;
        }
        else
        {
            0.3::second => now;
        }        
    }
    
    // increment beats, reset at beat 8
    // at beat 8, increment measure
    if ( t < 8)
    {
      t++;
      
    }
    else
    {
      0 => t;
      measure++;
    }
    
    // At measures 2 and 3, change the initial frequency -
    // this is the equivalent of a key change.
    // At any other measure, reset to original frequency.
    if ( measure == 2 || measure == 3  )
    {
        180 => initialFrequency;
        
    } 
    else
    {
        220 => initialFrequency;
    }
    
    // At measures 6 and 7, change the initial frequency 
    // to a different value than measures 2 and 3
    if ( measure == 6 || measure == 7 )
    {
        263 => initialFrequency;
    }        
    
    // At measure 8 reset measure counter.
    // increment repeats variable.
    if ( measure > 8)
    {    
      0 => measure;
      repeats++;
    }  
}

// ending phrase
0 => sine.gain;
initialFrequency/4 => square.freq;

for (0.025 => float i; i >= 0; i-0.005 => i)
{
    <<< i >>>;
    i => square.gain;
    300::ms => now;
}

