//
// Assignment_6_Annoying_Parade: Hihat.ck
//
// Supplies a rhythmic hi-hat part.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
SndBuf hats[4];
["hihat_02.wav", "hihat_01.wav", "hihat_03.wav", "hihat_04.wav"] @=> string files[];
[0.10, 0.10, 0.10, 0.15] @=> float gains[];
// Set up each of the four voices in a loop.
for (0 => int i; i < hats.cap(); i++) {
    hats[i] => Pan2 pan => dac;
    0.5 => pan.pan;
    me.dir(-1) + "/audio/" + files[i] => hats[i].read;
    hats[i].samples() => hats[i].pos;
    gains[i] => hats[i].gain;
}

// The array indices (+1) of the hi-hat voices to play on each eighth-note (0 = rest).
[1,3,1,2,1,2,3,0,1,3,4,0,3,0,1,2] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        notes[i] - 1 => int note;
        if (note >= 0) 0 => hats[note].pos;
        // Derive the 'swung' step duration.
        if ((i % 2) == 0) {
            (beat / 2.0) * swing => now;
        } else {
            (beat / 2.0) * (1.0 - swing) => now;
        }
    }
}
