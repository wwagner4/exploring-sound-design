// Assignment #5: Unit Generators
<<<"Assignment_5_Phrygid">>>;

// ===============================================
// Set parameters for scale, tempo, and percussion
// ===============================================

// Db Phrygian scale
[ 49, 50, 52, 54, 56, 57, 59, 61 ] @=> int scale[];

// 3/4 sec quarter note duration
0.75::second => dur quarterNoteDur;

// Percussion instruments
[ "kick_01.wav", "snare_01.wav" ] @=> string sampleNames[];

// =======================================
// Setup sound chains and their parameters
// =======================================

// Master gain and pan into dac
Gain master => Pan2 pan => dac;
0.5 => master.gain;

// Mandolin 
Mandolin mandolin => Chorus chor => master;
0.05 => chor.modDepth;
0.5 => chor.modFreq;

// Baseline
SinOsc base1mod => SawOsc base1car => ResonZ base1filt => ADSR base1env => master;
1 => base1mod.freq;
3 => base1mod.gain;
2 => base1car.sync;
40 => base1car.freq;
100 => base1filt.freq;
(.1::second, .1::second, 1.0, .1::second) => base1env.set;

// Percussion
SndBuf samples[sampleNames.cap()];
for(0 => int i; i < sampleNames.cap(); i++) {
    // Chuck sample to master and adjust gain
    samples[i] => master;
    0.9 => samples[i].gain;

    // Read sample
    me.dir() + "/audio/" + sampleNames[i] => samples[i].read;

    // Turn off sample till we are ready to use it, and set rate
    samples[i].samples() => samples[i].pos;
    1 => samples[i].rate;
}

// ==========================================================
// Notes to play, plus their corresponding durations and beat
// ==========================================================

// The notes are offsets in the scale, above
// The durations are measured in 1/16ths (4 = quarter note, 8 = half note, etc)
// Beat is 0 for no beat, or "index+1" for which sample to play

// First part: no beat
[
    3, 1, 2, 2, 2, 2, 4, 3, 1, 2, 2, 2, 2, 4, 3, 1, 2, 2, 2, 2, 4
] @=> int durations1[];
[
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
] @=> int beats1[];
// Notes are random for this part
int notes1[durations1.cap()];
Math.srandom(43);
for(0 => int i; i < notes1.cap(); i++) {
    Math.random2(0,7) => notes1[i];
}

// Second part: intermediate Baseline
[ 1, 1, 3, 2, 2, 3, 2, 1 ] @=> int notes2[];
[ 4, 4, 4, 4, 4, 4, 4, 4 ] @=> int durations2[];
[ 1, 2, 1, 2, 1, 2, 1, 2 ] @=> int beats2[];

// Third part: with beat
[
    0, 1, 2, 3, 2, 3, 4, 5, 4, 3, 2, 4, 3, 1, 4, 3, 2, 1, 3, 2, 0,
    0, 2, 3, 1, 2, 3, 4, 1, 3, 4, 2, 3, 4, 5
] @=> int notes3[];
[
    3, 1, 2, 2, 2, 2, 4, 3, 1, 2, 2, 2, 2, 4, 3, 1, 2, 2, 2, 2, 4,
    3, 1, 2, 2, 2, 2, 4, 3, 1, 2, 2, 2, 2, 4
] @=> int durations3[];
[
    1, 0, 2, 0, 1, 0, 2, 1, 0, 2, 0, 1, 0, 2, 1, 0, 2, 0, 1, 0, 2,
    1, 0, 2, 0, 1, 0, 2, 1, 0, 2, 0, 1, 0, 2
] @=> int beats3[];


// =======================
// Define helper functions
// =======================

// Play beat for given index and advance time
fun void playBeatAndAdvanceTime(int i, int durations[], int beats[])
{
    // Play beat if not zero
    if (beats[i] != 0) {
        0 => samples[beats[i]-1].pos;
    }
    // Play for duration
    durations[i]*quarterNoteDur/4 => now;
}

// Play the specified set of notes and accompanying beat
fun void playTune(int notes[], int durations[], int beats[])
{
    for(0 => int i; i < notes.cap(); i++)
    {
        // Play note
        Std.mtof(scale[notes[i]]) => mandolin.freq;
        1 => mandolin.noteOn;

        playBeatAndAdvanceTime(i, durations, beats);
    }
}

// Play baseline
fun void playBaseline(int notes[], int durations[], int beats[]) {
    for(0 => int i; i<beats.cap(); i++) {
        // Play note, and drop 2 octaves in scale
        Std.mtof(scale[notes[i]]-24) => base1car.freq;
        1 => base1env.keyOn;

        // Pan from one side to the other during baseline
        2.0*i/(beats.cap()-1) - 1.0 => pan.pan;

        playBeatAndAdvanceTime(i, durations, beats);
    }
    // Turn off baseline and reset pan
    1 => base1env.keyOff;
    0 => pan.pan;
}

// =============
// Play the song
// =============

playTune(notes1, durations1, beats1);
playBaseline(notes2, durations2, beats2);
playTune(notes3, durations3, beats3);
