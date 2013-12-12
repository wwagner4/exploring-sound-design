// montuno.ck
// Assignment 7: latin classes
// montuno piano chord rhythm using global BPM conducting

// make a conductor for our tempo
BPM tempo;
0.5::second => dur noteDur;  // from noteOn 'til noteOff
0.7::second => dur release;

// UGens : piano
Gain master => dac;

// parallel set of instruments to be able to play a note over the start of the next
2 => int setCnt;
Rhodey instrSets[setCnt][4];
0 => int currSetNo; // currently used instrument set, is incremented mod setCnt

// envelope per instrument set
ADSR env[setCnt];

// chuck the instrument sets to "their" envelopes and finally to master
for (0 => int ii; ii<instrSets.cap(); ii++) {
	for (0 => int jj; jj<instrSets[ii].cap(); jj++) {
		instrSets[ii][jj] => env[ii];
		1.0/instrSets[ii].cap() => instrSets[ii][jj].gain;
	}
	env[ii] => master;
	(.1::second, .2::second, 0.7, release) => env[ii].set;
}
0.4 => master.gain;

// montuno chords
[[48, 60, 36], [48, 60, 36], [48, 60, 36], [52, 40], [55, 43],
 [48, 60, 36], [53, 57, 41, 45],
 [50, 62, 38], [55, 59, 43, 47],
 [48, 60, 36], [53, 57, 41, 45]
] @=> int montuno[][];

[ 1, 1, 1,  1,  1,
  2, 2,
  2, 2,
  2, 1
] @=> int montunoEighthCnt[];

// play one note on given instrument
fun void playNote(int note, StkInstrument instr) {
    instr.freq(Std.mtof(note));
	instr.noteOn(1);
}

// play chord consisting of up to 4 notes with given set (via setNo) of instruments
// is sporked to allow overlay of consecutive notes
fun void playChord(int chord[], int eighthCnt, int setNo) {
	//<<< "begin", setNo >>>;
	// turn notes on
	for (0 => int ii; ii<chord.cap(); ii++) {
		playNote(chord[ii], instrSets[setNo][ii]);
	}
    env[setNo].keyOn(1);
    noteDur => now;

	// turn notes off
	for (0 => int ii; ii<chord.cap(); ii++) {
		1 => instrSets[setNo][ii].noteOff;
	}
    env[setNo].keyOff(1);
    release => now;
	//<<< "end", setNo >>>;
}

// play sequence of chords with given length (= number of eighth)
fun void playChordSequence(int chords[][], int eightCnt[]) {
    for (0 => int ii; ii < chords.cap(); ii++) {
        spork ~ playChord(chords[ii], eightCnt[ii], currSetNo);
		// small variation of timing
		Math.random2f(-0.03,0.03)::second => dur beginOffset;
		(tempo.eighthNote * eightCnt[ii] + beginOffset) => now;
		
		// increment current set of instruments
		currSetNo++;
		if (currSetNo >= setCnt)
			0 => currSetNo;
    }
}

// play montuno chord sequence
while (true) {
	playChordSequence(montuno, montunoEighthCnt);
}
