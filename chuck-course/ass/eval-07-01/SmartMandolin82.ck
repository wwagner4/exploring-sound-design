// Assignment_7_noises_off
// SmartMandolin82.ck
// Eight Mandolin "strings", 4 from the original SmartMandolin
//   plus 4 that mirror each string just an octave higher 
// (like a real mandolin)
// I think I modified everything except maybe the 'strum' function
class MandoPlayer {
    
    // make an arrary of eight mandolin strings and connect them up
    Mandolin m[8];
    m[0] => JCRev rev => Gain master => dac;
    m[1] => rev;
    m[2] => rev;
    m[3] => rev;
    m[4] => rev;
    m[5] => rev;
    m[6] => rev;
    m[7] => rev;
    0.02 => rev.mix;
    
 .2 => master.gain;
 
    // set all eight string frequencies in one function
    fun void freqs(float gStr, float aStr, float dStr, float eStr)
    {
        m[0].freq(gStr);
        m[1].freq(aStr);
        m[2].freq(dStr);
        m[3].freq(eStr);
        m[4].freq((gStr*2));
        m[5].freq((aStr*2));
        m[6].freq((dStr*2));
        m[7].freq((eStr*2));
    }
    
    // set all eight string notes in one function        
    fun void notes(int gNote, int aNote, int dNote, int eNote)  {
        m[0].freq(Std.mtof(gNote));
        m[1].freq(Std.mtof(aNote));
        m[2].freq(Std.mtof(dNote));
        m[3].freq(Std.mtof(eNote));
        m[4].freq(Std.mtof((gNote*2)));
        m[1].freq(Std.mtof((aNote*2)));
        m[2].freq(Std.mtof((dNote*2)));
        m[3].freq(Std.mtof((eNote*2)));
   }
    
   
    // chords changed to use allowable notes
    fun void chord(string which)  {
        if (which == "C") this.notes(48,52,57,60);
        if (which == "E") this.notes(52,55,59,64);
        if (which == "G") this.notes(55,59,62,65);
    }
    
    // roll a chord from lowest note to highest at rate
    fun void roll(string chord, dur rate) {
        this.chord(chord);
         for (0 => int i; i < 4; i++)  {
            1 => m[i].noteOn;
            1 => m[(i+3)].noteOn;
            rate => now;
        }
    }
    
    // archetypical mandolin strumming
    fun void strum(int note, dur howLong)  {
        int whichString;
        if (note < 55) 0 => whichString;
        else if (note < 60) 1 => whichString;
        else if (note < 64) 2 => whichString;
        else 3 => whichString;
        now + howLong => time stop;
        Std.mtof(note) => m[whichString].freq;
        Std.mtof(note) * 2 => m[(whichString+4)].freq;
        while (now < stop)  {
            Std.rand2f(0.5,1.0) => m[whichString].noteOn;
            Std.rand2f(0.06,0.09) :: second => now;
        }
    }    
}

// let's try all this out!!  Make a MandoPlayer object
MandoPlayer m;

    dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;

//        120.0 => float beat;
//        60.0/(beat) => float SPB; // seconds per beat
//        SPB :: second => quarterNote;
//        60.0/(beat) => float SPB; // seconds per beat
//        SPB :: second => quarterNote;
        0.625::second => quarterNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;

// and declare some data for chording and strumming
// chords and strums changed to be in the proper key for this week's assignment

["C","G","C","G","E","C","E","G"] @=> string chords[];
[0.4,0.4,0.4,0.1,0.1,0.1,0.1,0.01] @=> float durs[]; 
[67,65,64,62,67,60,60,60] @=> int strums[];

// counter to iterate through the arrays
0 => int i;
// roll the basic chords, reading through the arrays
while (i < chords.cap())  {
    m.roll(chords[i],eighthNote) ;
    eighthNote => now;
    i++;
}