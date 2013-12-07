// pads.ck
// Assignment 6: Jazz Band

//
0.625::second => dur quarter;
quarter / 4 => dur sixteenth;

// MIDI notes of Bb Aeoliann mode scale
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int midi_notes[];

// master gain
Gain master => dac;
1.0 => master.gain;

// oscillator sound chains
TriOsc s[3];
Pan2 p[3];

// sound chains
for ( 0 => int i ; i < 3; i++) {
    s[i] => p[i] => master;
    0 => s[i].gain;
    0.0 => p[i].pan;
}

// set gain to oscillators
fun void setGain(float v) {
    for (0 => int i; i < s.cap(); i++) {
        v => s[i].gain;
    }
}

// update pan
fun void updatePan() {
    // loop 8 beats
    for ( 0 => int k; k < 8; k++) {
        // set pan
        // Math.sgn(Math.random2f(-1.0, 1.0)) => float pan; // left or right
        Math.random2f(-1.0, 1.0) => float pan; // left or right
        pan => p[0].pan; // medium note pan
        - pan => p[2].pan; // high note pan, opposite to medium note
        
        sixteenth => now; // forward one quarter
    }
}

// play notes
fun void play_notes() {
    // loop 8 beats
    for ( 0 => int k; k < 2; k++) {
        setGain(0.15);
        // set chord
        // get a random MIDI note.
        midi_notes[ Math.random2(0, midi_notes.cap()-1) ] => int m;
        // convert MIDI note to frequency.
        Std.mtof(m) => float f;
        // set frequency.
        f => s[0].freq;
        f / 2 => s[1].freq; // below octave
        f * 2 => s[2].freq; // above octave
      
        quarter => now; // forward one quarter
    }
}

// play the pattern
// 0.625 secs * 2 quarters = 1.25 secs
fun void play_pattern() {
    spork ~ play_notes(); // spork play_notes shred
    spork ~ updatePan(); // spork updatePan shred
    1.25::second => now;
}

// play 2 bars
// 1.25 secs * 4 = 5.0 secs
fun void play_2_bars() {
    for ( 0 => int i ; i < 4; i++ ) {
        play_pattern();
    }
}

// MAIN PROGRAM
while (true) {
    play_2_bars(); // 5.0 secs
}

// END
