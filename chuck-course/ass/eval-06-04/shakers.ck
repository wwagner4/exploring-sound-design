// drums.ck
// Assignment 6: Jazz Band

//
0.625::second => dur quarter;
quarter / 4 => dur sixteenth;

// STD instruments and effects
Shakers shakers => NRev nrev => Gain master => dac;
7 => shakers.preset; // Sleigh Bells
16 => shakers.objects;
0.15 => nrev.mix;


// play the pattern
// 0.625 secs * 2 quarters = 1.25 secs
fun void play_pattern() {
    // loop 8 beats
    for ( 0 => int k; k < 8; k++) {
        1.0 => shakers.noteOn;
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
