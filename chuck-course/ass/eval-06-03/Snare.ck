//
// Assignment_6_Annoying_Parade: Snare.ck
//
// Supplies the snarek-drum part.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
SndBuf snare => JCRev rev => Pan2 pan => dac;
-0.4 => pan.pan;
0.03 => rev.mix;
me.dir(-1) + "/audio/snare_03.wav" => snare.read;
snare.samples() => snare.pos;
0.30 => snare.gain;

// The eighth-notes on which to play (0 = rest, 1 = hit).
[0,0,1,0,0,0,1,0,0,0,1,0,0,1,1,0,
 0,0,1,0,0,0,1,0,0,0,1,1,0,1,1,0] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        if (notes[i] > 0) 0 => snare.pos;
        // Derive the 'swung' step duration.
        if ((i % 2) == 0) {
            (beat / 2.0) * swing => now;
        } else {
            (beat / 2.0) * (1.0 - swing) => now;
        }
    }
}
