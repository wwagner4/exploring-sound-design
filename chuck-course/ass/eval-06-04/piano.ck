// piano.ck
// Assignment 6: Jazz Band

//
0.625::second => dur quarter;
quarter / 4 => dur sixteenth;

// MIDI notes of Bb Aeoliann mode scale
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int midi_notes[];

// STD instruments and effects
Rhodey rhodey => Pan2 rhodeyPan => Chorus chorus => Gain master => dac; // Fender Rhodes-like electric piano FM
0.2 => chorus.mix;
1.0 => master.gain;

// play the pattern
// 0.625 secs * 2 quarters = 1.25 secs
fun void play_pattern() {
    // loop 8 beats
    for ( 0 => int k; k < 8; k++) {
        // set melody
        Math.random2(0,1) => int m;
        if (k == 0) {
            1 => m;
        }
        if (m) {
            // get a random MIDI note.
            midi_notes[ Math.random2(0, midi_notes.cap()-1) ] => int m;
            // convert MIDI note to frequency.
            Std.mtof(m) => float f;
            // set frequency.
            f => rhodey.freq;
            1.0 => rhodey.noteOn;
            // set pan
            Math.random2f(-1.0, 1.0) * 0.7 => rhodeyPan.pan;
        }
        sixteenth => now; // forward one sixteenth
    }
}

// play 2 bars
// 1.25 secs * 4 = 5.0 secs
fun void play_2_bars() {
    for ( 0 => int i; i < 4; i++) {
        play_pattern();
    }
}

// MAIN PROGRAM
while (true) {
    play_2_bars(); // 5.0 secs
}

// END
