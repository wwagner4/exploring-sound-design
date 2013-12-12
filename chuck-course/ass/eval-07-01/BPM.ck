// Assignment_7_noises_off
// BPM.ck
// global BPM conductor Class
// *** modified to ignore input parameter and set
// quarterNote value to .625::seconds (per assignment rubric)
// other note values are calculated based on quarter note
// note values are still accessible from other ck files and functions
public class BPM
{
    // global variables
    dur myDuration[4];
    static dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;

    fun void tempo(float beat)  {
        // beat is BPM, example 120 beats per minute
        
//        60.0/(beat) => float SPB; // seconds per beat
//        SPB :: second => quarterNote;
        0.625::second => quarterNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        quarterNote*0.5 => thirtysecondNote;
        
        // store data in array
        [quarterNote, eighthNote, sixteenthNote, thirtysecondNote] @=> myDuration;
    }
}

