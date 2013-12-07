            /* ******************************************
                Author: Rafal Pieterczyk
                Datum:  02/12/2013
                Note:   Assignment_6_bass
            ******************************************* */


            <<< " bass" >>>;

        //sound network
        
        Mandolin m => NRev revb => dac;
        
        // parameters
       0.01 => revb.mix;
        0.9 => m.pluck;
        0.1 => m.bodySize;
        0 => int j;
        0.6 => m.gain;
        .625 => float timebase; // base time
        
        [ 58, 46, 54, 46, 54, 58, 56, 46] @=> int notes[]; // first part
        [ 46, 54, 56, 58, 58, 58, 56, 54] @=> int notes1[]; // second part
        //chce abu co 3 takty byla inna muzyczka
       
   
while (true)
{ 
 if (j<3) // 3 times played first part
     { 
                  
      for ( 0=> int i; i < notes.cap(); i++)
        {
            Std.mtof(notes[i] - 12) => m.freq; // downgrade the scale
            0.3 => m.noteOn;
            (timebase::second)/2 => now; // speed up base time
          
        }
        j++;
     
    }
    
    if (j == 3) // one time played second part
 
  {
     for ( 0=> int i; i < notes1.cap(); i++)
        {
            Std.mtof(notes1[i] - 12) => m.freq;  // downgrade the scale
            0.3 => m.noteOn;
            (timebase::second)/2 => now;  // speed up base time
            
        }
      0 => j; // clearing "j
    }
 }