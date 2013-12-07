            /* ******************************************
                Author: Rafal Pieterczyk
                Datum:  02/12/2013
                Note:   Assignment_6_score
            ******************************************* */
            
            <<< " score" >>>;
            
            me.dir() + "/perc.ck" => string percPath;
            me.dir() + "/bass.ck" => string bassPath;
            me.dir() + "/flute.ck" => string flutePath;
            me.dir() + "/piano.ck" => string pianoPath;
            
            
            Machine.add(bassPath) => int bassID;
            7.5::second => now;
            
            Machine.add(percPath) => int percID;
            5.0::second => now;
           
            Machine.add(pianoPath) => int pianoID;
            10.0::second => now;
          
            Machine.add(flutePath) => int fluteID;
            5.0::second => now;
            
            Machine.remove(percID);
            10.0::second => now;
            
            Machine.remove(fluteID);
            5.0::second => now;
            
            Machine.remove(pianoID);
            5.0::second => now;
            
            Machine.remove(bassID);
            5.0::second => now;