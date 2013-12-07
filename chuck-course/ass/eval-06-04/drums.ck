// drums.ck
// Assignment 6: Jazz Band

// drum patterns
[
[
[ 1, 0, 0, 1, 1, 0, 0, 1 ], // kick  #1
[ 0, 0, 1, 0, 0, 0, 1, 0 ], // snare #1
[ 1, 0, 1, 0, 1, 0, 1, 0 ]  // hihat #1
],
[
[ 1, 0, 0, 1, 0, 0, 0, 0 ], // kick  #2
[ 0, 0, 1, 0, 1, 1, 1, 1 ], // snare #2
[ 1, 0, 1, 0, 1, 0, 1, 0 ]  // hihat #2
]  
] @=> int drumPatterns[][][];

//
0.625::second => dur quarter;
quarter / 2 => dur eighth;
quarter / 4 => dur sixteenth;

// define string array of sound files
[ "kick_01", "snare_01", "hihat_02" ] @=> string drums_sound_files[];

// define SndBufs for drums and FX
SndBuf drums[3];

// defines drums gain
[ 0.6, 0.7, 0.2 ] @=> float gains[];

// master gain
Gain master => dac;
1.0 => master.gain;

// read audio file
fun void setAudioFile(string name, SndBuf sndBuf) {
    me.dir(-1) + "/audio/" + name + ".wav" => sndBuf.read; // read audio file
}

// set a drum
fun void setDrum(int i) {
    drums[i] => master; // assign drums SndBuf to master gain
    setAudioFile(drums_sound_files[i], drums[i]); // read audio file
    gains[i] => drums[i].gain; // set gain
    drums[i].samples() => drums[i].pos; // move position to the end
}

// set drums
fun void setDrums() {
    for ( 0 => int i ; i < drums.cap() ; i++) {
        // <<< "setting drum ", i >>>;
        setDrum(i);
    }
}

// play the pattern
// 0.625 secs * 2 quarters = 1.25 secs
fun void play_pattern(int i) {
    // loop 8 beats
    for ( 0 => int k; k < 8; k++) {
  
        // check drum pattern and set position accordingly
        for ( 0 => int j; j < 3; j++) {
            if (drumPatterns[i][j][k] == 1) {
                0 => drums[j].pos;
            }
        }
           
        sixteenth => now; // forward one sixteenth
    }
}

// play 2 bars
// 1.25 secs * 4 = 5.0 secs
fun void play_2_bars() {
    play_pattern(0);
    play_pattern(0);
    play_pattern(0);
    play_pattern(1);
}

// MAIN PROGRAM
// setup
setDrums();
// play
while (true) {
    play_2_bars(); // 5.0 secs
}
// END