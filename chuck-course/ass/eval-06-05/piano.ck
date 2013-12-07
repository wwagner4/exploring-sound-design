  /* ******************************************
                Author: Rafal Pieterczyk
                Datum:  02/12/2013
                Note:   Assignment_6_piano
            ******************************************* */


            <<< " piano" >>>;
            
            //sound network
            
            ModalBar m => NRev revm => dac;
            0.15 => revm.mix;
            
            //paramters:
            
            1 => m.preset;
            0.4 => m.masterGain;
            0.7 => m.stickHardness;
            .625 => float timebase; // base time
            
            [49,49,46,46] @=> int notes[]; // scale
            
            while (true)
        {
            
            for ( 0=> int i; i < notes.cap(); i++)
            {
           
            Std.mtof(notes[i]) => m.freq; 
            0.4 => m.noteOn;
            ((timebase)::second)/2 => now;
             
          
            }
        }