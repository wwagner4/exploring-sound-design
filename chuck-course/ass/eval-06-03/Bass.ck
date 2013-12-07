//
// Assignment_6_Annoying_Parade: Bass.ck
//
// Supplies the annoying bass line.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
Mandolin bass => ADSR env1 => LPF lpf1 => dac;
env1.set(20::ms, 160::ms, 0.4, 60::ms);
0.8 => bass.gain;
0.1 => bass.bodySize;
// Oscillator to increase bass depth.
TriOsc subBass => ADSR env2 => LPF lpf2 => dac;
env2.set(100::ms, 100::ms, 0.4, 60::ms);
0.5 => subBass.gain;

// The MIDI notes to play on each eighth-note (-1 = hold note, -2 = note off).
[49,-2,-2,-2,46,-2,-2,-2,44,-2,-2,-2,46,-2,42,-2,
 41,-2,-2,-2,42,-2,-2,-2,41,-2,42,44,-2,44,46,-1,
 49,-2,-2,-2,46,-2,-2,-2,44,-2,-2,-2,46,-2,42,-2,
 41,-2,42,-2,44,-2,37,-2,41,-2,39,37,-2,39,44,-1] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        notes[i] => int note;
        if (note > 0) {
            // Note on
            Std.mtof(note - 12) => bass.freq;
            0.3 => bass.noteOn;
            1 => env1.keyOn;
            bass.freq() / 2 => subBass.freq;
            1 => env2.keyOn;
        } else if (note < -1) {
            // Note off
            1 => env1.keyOff;
            1 => env2.keyOff;
        }
        // Derive the 'swung' step duration.
        float beatEnd;
        if ((i % 2) == 0) {
            (now + ((beat / 2.0) * swing)) / ms => beatEnd;
        } else {
            (now + ((beat / 2.0) * (1.0 - swing))) / ms => beatEnd;
        }
        // Increase the filter cutoffs throughout the beat to give a bit of movement.
        Std.mtof(note + 18) => float cutoff;
        while (now / ms < beatEnd) {
            if (note > -1) {
                cutoff => lpf1.freq;
                cutoff * 2 => lpf2.freq;
                5.0 +=> cutoff;
            }
            1::ms => now;
        }
    }
}
