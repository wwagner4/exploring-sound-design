//
// Assignment_6_Annoying_Parade: Swanee.ck
//
// Supplies the annoying swanee-whistle effect.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
BlowHole swanee => ADSR env => PRCRev rev => Pan2 pan => dac;
env.set(250::ms, 250::ms, 1.0, 250::ms);
0.02 => rev.mix;
0.90 => swanee.tonehole;
0.70 => swanee.reed;
0.20 => swanee.gain;
0.20 => swanee.noiseGain;
1.00 => swanee.rate;
-0.6 => pan.pan;

// The MIDI notes to play on each eighth-note (-1 = hold note, -2 = note off).
[37,-1,-1,-1,-1,-1,-1,-1,44,-1,-2,-1,-1,-1,-1,-1,
 13,-1,-1,-1,-1,-1,-1,-1,63,-2,-2,-1,-1,-1,-1,-1,
 25,-1,-1,-1,-1,-1,-1,-1,68,-1,-2,-1,-1,-1,-1,-1,
 73,-1,70,-1,68,-1,65,-1,63,65,68,65,63,61,58,-2] @=> int notes[];

// Loop around the notes array until the shred is terminated.
while (true)  {
    for (0 => int i; i < notes.cap(); i++) {
        notes[i] => int note;
        if (note > 0) {
            // Note on
            Std.mtof(note + 12) - 5.0 => swanee.freq;
            1 => env.keyOn;
            0.8 => swanee.startBlowing;
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
        // Slide the pitch and fiddle with the vent parameter throughout the beat for maximum annoyance.
        0.8 => float vent;
        while (now / ms < beatEnd) {
            vent => swanee.vent;
            swanee.freq() + 0.05 => swanee.freq;
            0.002 +=> vent;
            1::ms => now;
        }
    }
}
