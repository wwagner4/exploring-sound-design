//
// Assignment_6_Annoying_Parade: Kick.ck
//
// Supplies the kick-drum part.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
SndBuf kick => dac;
me.dir(-1) + "/audio/kick_03.wav" => kick.read;
kick.samples() => kick.pos;
0.30 => kick.gain;

// The eighth-notes on which to play (0 = rest, 1 = kick).
[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1,
 1,0,0,0,1,0,0,0,1,0,0,1,0,0,1,0] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        if (notes[i] > 0) 0 => kick.pos;
        // Derive the 'swung' step duration.
        if ((i % 2) == 0) {
            (beat / 2.0) * swing => now;
        } else {
            (beat / 2.0) * (1.0 - swing) => now;
        }
    }
}
