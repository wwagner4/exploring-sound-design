// ###############################
// Author : 1234
// Date: 05/12/2013
// File: playDrone.ck
// Description: play the drone
// Project : Assignment 7
<<< "playDrone.ck" >>>;


// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

// load in the common properties
Common property;

// load the drone
InstDrone drone;

drone.initialise();
drone.mix();

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
  drone.play(0);
  tempo.sixteenthNote => now;
}

// #####################################    
// Drone section  
// parameter:
//   beat : The beat count
//   measure : The measure count
// #####################################    
fun void playDrone(int beat, int measure)
{

  drone.play(0.4);

  drone.setPanPosition(Math.random2f(-1,1));  
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
      doNothing(beat, measureCount);  
    } else if ( now < property.intro ) {
      playDrone(beat, measureCount);  
    } else if ( now < property.verse_1 ) {
      doNothing(beat, measureCount);  
    } else {
      playDrone(beat, measureCount);  
    }

    // the counters, beat and measure
    if ( (beat == 0) || (beat == 8) )
      measureCount++; // measureCount + 1 => measureCount; 
    counter++; // counter + 1 => counter; 
    <<<"Drone Counter: ", counter, "Beat: ", beat >>>;
    <<<"Drone Measure: ", measureCount, "Beat: ", beat >>>;
}    


