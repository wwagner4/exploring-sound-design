//
// Assignment_6_Annoying_Parade: Ride.ck
//
// Supplies a rhythmic ride-cymbal part.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
SndBuf rides[3];
["hihat_04.wav", "hihat_02.wav", "hihat_02.wav"] @=> string files[];
[0.30, 0.25, 0.15] @=> float gains[];
[0.9, 1.5, 1.45] @=> float rates[];
// Set up each of the three voices in a loop.
for (0 => int i; i < rides.cap(); i++) {
    rides[i] => Pan2 pan => dac;
    -0.3 => pan.pan;
    me.dir(-1) + "/audio/" + files[i] => rides[i].read;
    rides[i].samples() => rides[i].pos;
    gains[i] => rides[i].gain;
    rates[i] => rides[i].rate;
}

// The array indices (+1) of the ride voices to play on each eighth-note (0 = rest).
[2,3,1,0] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        notes[i] - 1 => int note;
        if (note >= 0) {
            rides[note] @=> SndBuf sb;
            // Soften the attack by reading slightly into the sample.
            500 => sb.pos;
            gains[note] + Math.random2f(-0.05,0.05) => sb.gain;
            rates[note] + Math.random2f(-0.01,0.01) => sb.rate;
        }
        // Derive the 'swung' step duration.
        if ((i % 2) == 0) {
            (beat / 2.0) * swing => now;
        } else {
            (beat / 2.0) * (1.0 - swing) => now;
        }
    }
}
