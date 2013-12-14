// ###############################
// Author : 1234
// Date: 05/12/2013
// File: piano.ck
// Description: piano
// Project : Assignment 7
<<< "piano.ck" >>>;

// sound chain
Rhodey piano[4];
piano[0] => dac.left;
piano[1] => dac; 
piano[2] => dac;
piano[3] => dac.right; 

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

// load in the common properties
Common property;

// chord 2D array
[[48,51,54,58],[46,49,53,56]] @=> int chordz[][];

// #####################################    
// Piano section  
// #####################################    
fun void pianoSection()
{
    // build first chord
    for( 0 => int i; i < 4; i++ )  
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.3,.7) => piano[i].noteOn;
    }
    1.0 :: second => now;
    // build second chord
    for( 0 => int i; i < 4; i++ )  
    {
        Math.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.3,.7) => piano[i].noteOn;
    }
    1.4 :: second => now;
}

// #####################################    
// do Nothing section  
// #####################################    
fun void doNothing()
{
    for( 0 => int i; i < 4; i++ )  
    {
        Math.random2f(0.3,.7) => piano[i].noteOff;
    }
    tempo.sixteenthNote => now;
}

// loop 
while (1)  {
    if ( now <= property.preIntro )
    {
      doNothing();  
    } else if ( now < property.intro ) {
      pianoSection();  
    } else if ( now < property.verse_1 ) {
      doNothing();  
    } else {
      pianoSection();  
    }
}
