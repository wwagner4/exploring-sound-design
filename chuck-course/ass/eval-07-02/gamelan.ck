//Gamelan.ck
//Assignment 7: Gamelan Again
public class Gamelan
{
    // global variables
    [48,50,52,53,55,57,59,60] @=> int scale[];
    
    /*
    Return the frequency when given a degree (1-6)
    like standard gamelan tablature
    This will make more sense when using a real gamelan scale.
    */
    
    // for the last gong
    static int lastGong;
       
    fun float itof(int degree,int octave)
    {
            Std.mtof(scale[degree-1]+(12*octave)) => float returnedNote;
            return returnedNote;
    }
    
    [6,1,2,3,1,5,2,5,3,2,1,2] @=> int bulangan[];
}