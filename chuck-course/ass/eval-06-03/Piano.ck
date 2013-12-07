//
// Assignment_6_Annoying_Parade: Piano.ck
//
// Supplies the four piano lines.

// Time calculation constants.
625::ms => dur beat;
0.60 => float swing;

// Setup for the sound chain and voice/effect parameters.
Gain busR => Chorus chorR => NRev revR => dac.right;
Gain busL => Chorus chorL => NRev revL => dac.left;
0.02 => revR.mix => revL.mix;
0.20 => chorR.mix => chorL.mix;

Wurley piano1 => busL;
0.4 => piano1.gain;
6.0 => piano1.lfoSpeed;

Wurley piano2 => busR;
0.4 => piano2.gain;
8.0 => piano2.lfoSpeed;

Rhodey piano3 => busL;
0.4 => piano3.gain;
5.0 => piano3.lfoSpeed;

Rhodey piano4 => busR;
0.4 => piano4.gain;
7.0 => piano4.lfoSpeed;

// The MIDI notes to play on each eighth-note (-1 = hold note, -2 = note off).
// One array for each of the four piano voices.
[-2,-2,65,63,65,63,61,58,56,-2,58,61,-2,63,-2,-2,
 -2,-2,65,63,65,63,61,58,56,58,61,53,-2,-1,-1,-1] @=> int notes1[];
[-2,-2,61,60,61,60,58,54,53,-2,54,56,-2,58,-2,-2,
 -2,-2,61,60,61,60,58,54,53,54,56,49,-2,-1,-1,-1] @=> int notes2[];
[49,-1,-2,-2,51,-1,-2,-2,53,-1,-2,54,-2,-2,-2,-2,
 -2,53,-1,-1,51,-2,-2,-2,53,-1,51,49,-2,-1,-1,-1] @=> int notes3[];
[53,-1,-2,-2,54,-1,-2,-2,56,-1,-2,58,-2,-2,-2,-2,
 -2,56,-1,-1,54,-2,-2,-2,56,-1,54,53,-2,-1,-1,-1] @=> int notes4[];

// Play each line in its own thread to greatly simplify the code.
spork ~ play(piano1, notes1);
spork ~ play(piano2, notes2);
spork ~ play(piano3, notes3);
spork ~ play(piano4, notes4);
while (true) 1:: second => now;
////
fun void play(FM piano, int notes[]) {
    // Loop around the notes array until the shred is terminated.
    while (true)  {
        for (0 => int i; i < notes.cap(); i++) {
            notes[i] => int note;
            if (note > 0) {
                // Note on
                Std.mtof(note) => piano.freq;
                Math.random2f(0.3, 0.6) => piano.noteOn;
            } else if (note < -1) {
                // Note off
                0.3 => piano.noteOff;
            }
            // Derive the 'swung' step duration.
            float beatEnd;
            if ((i % 2) == 0) {
                (now + ((beat / 2.0) * swing)) / ms => beatEnd;
            } else {
                (now + ((beat / 2.0) * (1.0 - swing))) / ms => beatEnd;
            }
            // Increase the LFO effect throughout the beat.
            0.4 => float vib;
            while (now / ms < beatEnd) {
                vib => piano.lfoDepth;
                0.003 +=> vib;
                1::ms => now;
            }
        }
    }
}
