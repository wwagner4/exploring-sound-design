// ###############################
// Author : 1234
// Date: 05/12/2013
// File: drone.ck
// Description: drone
// Project : Assignment 7
<<< "drone.ck" >>>;


// requires common properties to be loaded
Common property;

// drone Class
public class InstDrone
{
  // sound chain
  Blit s => ADSR e => JCRev r => Delay delay => Gain master => Pan2 paning => dac;
  NRev vocRev => master;

  // This should vary between -1 and +1
  0 => float panPosition; 

  VoicForm voc[6];

  fun void initialise()  {
    master => Gain feedback => DelayL feedbackDelay => master;

    // parameter setup
    for ( 0 => int i; i < voc.cap(); i++ )
     {
      voc[i] => vocRev;
      (.5/voc.cap()) => voc[i].gain;
    }
  }

  fun void initialise()  {
    master => Gain feedback => DelayL feedbackDelay => master;

    // parameter setup
    for ( 0 => int i; i < voc.cap(); i++ )
     {
      voc[i] => vocRev;
      (.5/voc.cap()) => voc[i].gain;
    }
  }

  // set Pan Position
  fun void setPanPosition(float position)  {
    position => paning.pan;
  }
    
  // background drone mix
  fun void mix()  {
    0.5 => vocRev.mix;
    for ( 0 => int i; i < voc.cap(); i++ )
    {
      0.02 => voc[i].vibratoGain;
      "lll" => voc[i].phoneme;
      Std.mtof(property.scale[i]) => voc[i].freq;
      0.2 => voc[i].gain;
    }
  }
  
  // background noise
  fun void play(float gain)  {
    for ( 0 => int i; i < voc.cap(); i++ )
    {
      gain => voc[i].gain;
    }
  }
}