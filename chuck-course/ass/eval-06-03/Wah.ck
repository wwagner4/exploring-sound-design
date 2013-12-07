//
// Assignment_6_Annoying_Parade: Wah.ck
//
// Supplies the annoying wah-wah voice.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
VoicForm wah => ADSR env => BPF bpf => PRCRev rev => Pan2 pan => dac;
env.set(120::ms, 150::ms, 0.8, 50::ms);
0.04 => rev.mix;
18.00 => wah.gain;
500.0 => bpf.freq;
5.00 => bpf.Q;
0.6 => pan.pan;

// The MIDI notes to play on each eighth-note (-1 = hold note, -2 = note off).
[-1,-1,-1,-1,-1,-1,-1,-1,70,-2,68,-2,65,-2,68,-2,
 61,-1,-1,-1,-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        notes[i] => int note;
        if (note > 0) {
            // Note on
            Std.mtof(note) => wah.freq;
            1 => env.keyOn;
            1 => wah.speak;
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
        // Modulate the filter throughout the beat to create the wah-wah effect.
        200.0 => float freq;
        while (now / ms < beatEnd) {
            if (note > 0) {
                freq => bpf.freq;
                freq + 10.0 => freq;
            }
            1::ms => now;
        }
    }
}
