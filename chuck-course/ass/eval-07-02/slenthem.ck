// slenthem.ck
// Assignment 7: Gamelan Again
ModalBar slenthem => Pan2 p => dac;

// attributes
4 => slenthem.preset;
0.2 => slenthem.damp;
1.0 => slenthem.volume;
-0.6 => p.pan;

Gamelan betty;
BPM tempo;

[2,1,6,1,3,2,1] @=> int buka[];

fun void playBuka(int j){
    for (0 => int i; i < buka.cap(); i++)
    {
        playNote(buka[i]);
    }
}

fun void playNote(int note){
    1.0 => float hit;
    if (note == 6)
    {
        betty.itof(6,-2) => slenthem.freq;
        
    }
    else if (note == 0)
    {
        0.0 => hit;
        <<< "Rest" >>>;
    }
    else
    {
        betty.itof(note,-1) => slenthem.freq;
    }
    hit => slenthem.noteOn;
    <<< "Slenthem: ", slenthem.freq() >>>;
    tempo.quarterNote => now;
    1.0 => slenthem.noteOff;
}    

playBuka(7);

while (true)
{
    betty.bulangan.cap() => int max;
    for (0 => int i; i < max; i++)
    {
        playNote(betty.bulangan[i]);
    }
}