// bonang.ck
// Assignment 7: Gamelan Again
ModalBar bonang => Pan2 p => Gain master => dac;

// attributes
1 => bonang.preset;
0.2 => bonang.damp;
0.2 => master.gain;
0.6 => p.pan;

Gamelan betty;
BPM tempo;

fun void playNote(int note){
    1.0 => float hit;
    if (note == 6)
    {
        betty.itof(6,-1) => bonang.freq;
    }
    else if (note == 0)
    {
        0.0 => hit;
        <<< "Rest" >>>;
    }
    else
    {
        betty.itof(note,0) => bonang.freq;
    }
    hit => bonang.noteOn;
    <<< "Bonang: ", bonang.freq() >>>;
    tempo.eighthNote => now;
    1.0 => bonang.noteOff;
}  

while (1) {
    betty.bulangan.cap() => int max;
    for (0 => int i; i < max; i++)
    {
        betty.bulangan[i] => int noteA;
        betty.bulangan[i+1] => int noteB;
        repeat (2) {
            playNote(noteA);
            playNote(noteB);
        }
        i++;
    }
}

