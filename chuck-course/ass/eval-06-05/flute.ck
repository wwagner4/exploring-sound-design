      /* ******************************************
                Author: Rafal Pieterczyk
                Datum:  02/12/2013
                Note:   Assignment_6_bass
            ******************************************* */


            <<< " bass" >>>;

        //sound network
        Saxofony f => NRev revf =>Pan2 p =>  dac;
        0.3 => float panPosition;
        0.3 => revf.mix;
        
        //parameters:
        
       
        0.4 => f.gain;
        .625 => float timebase; // base time
        
        
        [ 49, 46, 54, 46, 58, 54, 49, 46] @=> int notes[];
        
        while (true)
        {
            
            for ( 0=> int i; i < notes.cap(); i++)
            {
            panPosition => p.pan;
            Math.random2f(.3,-.3) => panPosition; // panorama fluctuation
               
            Std.mtof(notes[i]+12) => f.freq; // upgrade base scale
            0.3 => f.noteOn;
            timebase::second => now;
           
            }
        }