//
// Assignment_6_Annoying_Parade: Reed.ck
//
// Supplies the annoying main tune.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
Saxofony reed => ADSR env => PRCRev rev => dac;
env.set(60::ms, 150::ms, 0.6, 150::ms);
0.02 => rev.mix;
6.00 => reed.vibratoFreq;
0.40 => reed.gain;

// The MIDI notes to play on each eighth-note (-1 = hold note, -2 = note off).
[-2,-2,70,68,70,68,65,63,61,-2,63,65,-2,68,-2,-2,
 -2,-2,70,68,70,68,65,63,61,63,65,58,-2,-1,-1,-1,
 -2,-2,70,68,70,68,65,63,61,-2,63,65,-2,68,-2,-2,
 -2,-2,70,68,70,68,65,63,61,63,65,68,-2,-1,-1,-1] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        notes[i] => int note;
        if (note > 0) {
           // Note on
           Std.mtof(note + 12) => reed.freq;
            1 => env.keyOn;
            1 => reed.startBlowing;
        } else if (note < -1) {
            // Note off
            1 => env.keyOff;
        }
        // Derive the 'swung' step duration.
        float beatEnd;
        if ((i % 2) == 0) {
            (now + ((beat / 2.0) * swing)) / ms => beatEnd;
        } else {
            (now + ((beat / 2.0) * (1.0 - swing))) / ms => beatEnd;
        }
        // Increase the vibrato throughout the beat to make it a bit more annoying.
        0.0 => float vib;
        while (now / ms < beatEnd) {
            vib => reed.vibratoGain;
            0.003 +=> vib;
            1::ms => now;
        }
    }
}
