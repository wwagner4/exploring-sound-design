// string.ck
// Lonly guitar on the wall

// Music setup
NRev r => Gain master => dac;
.01 => r.mix;
0.2 => master.gain;

// Tree stif karps and three pan
StifKarp sks[3];
Pan2 pan[3];

// Initializing of the stif karps and pannings
for (0 => int i; i<sks.cap(); i++) {
    0.1 => sks[i].pickupPosition;
    0 => sks[i].sustain;
    0 => sks[i].stretch;
    -0.5 + 0.5 * i => pan[i].pan; 
    sks[i] => pan[i] => r;
}

// our notes
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int notes[];

// Some global parameters
90 => int tickLen; // in ms
-4 => int trans; // transpose in midi

0 => int ipitch;
1 => int igain;

// Melody and gain for stif karps
// Line 0: Melody
// Line 1: Gain
[
[
[5, 5, 5,  3, 3, 5,  7, 5, 5], 
[3, 2, 0,  3, 2, 0,  0, 0, 0]],
[
[5, 0, 5,  0, 3, 5,  5, 5, 5], 
[3, 2, 0,  3, 2, 0,  0, 0, 0]],
[
[0, 5, 0,  0, 3, 0,  3, 5, 5], 
[3, 2, 0,  3, 2, 0,  0, 0, 0]],
[
[5, 5, 5,  4, 2, 5,  0, 5, 5], 
[3, 0, 0,  1, 0, 0,  0, 0, 0]],
[
[4, 5, 5,  5, 2, 5,  0, 5, 5], 
[3, 0, 0,  1, 0, 0,  0, 0, 0]],
[
[0, 5, 5,  0, 2, 5,  7, 5, 5], 
[3, 0, 0,  1, 0, 0,  0, 0, 0]],
[
[0, 0, 0,  0, 0, 0,  0, 0, 0], 
[0, 0, 0,  0, 0, 0,  0, 0, 0]],
[
[5, 5, 5,  4, 2, 5,  7, 5, 5], 
[2, 0, 0,  0, 0, 0,  0, 0, 0]],
[
[4, 5, 5,  4, 2, 5,  7, 5, 5], 
[2, 0, 0,  0, 0, 0,  0, 0, 0]],
[
[0, 5, 5,  4, 2, 5,  7, 5, 5], 
[2, 0, 0,  0, 0, 0,  0, 0, 0]]
] @=> int melody[][][]; 

// Length of a melody.
// All melodies must have the same length
melody[0][0].cap() => int mlen;

// Functions

// Play one stif karp 
fun void play(StifKarp m,  float note, float velocity ) {
    // Some delay
    Math.random2(10, 30)::ms => now;
    // Some distortion in frequency
    0.005 => float fdiff;
    Std.mtof( note ) + Math.random2f(-fdiff, fdiff) => m.freq;
    velocity * Math.random2f(0.6, 1.1) => m.pluck;
    // Advance time for half a second to hear the reverbant sound
    500::ms => now;
}

// Play a cord of stif karps
fun void playCord(int note, float velo) {
                                 spork ~ play(sks[0], note, velo);
    // Up or down cord
    if (Math.random2(1, 3) == 1) spork ~ play(sks[1], note + 7, velo);
    else                         spork ~ play(sks[1], note - 5, velo);
    // Major or minor cord
    if (Math.random2(1, 4) == 1) spork ~ play(sks[2], note + 4, velo);
    else                         spork ~ play(sks[2], note + 3, velo);    
} 

// Play melody of index 'imelody'
fun void playMelo(int imelody) {
    for(0 => int i; i < mlen; i++ ) { 
      notes[melody[imelody][ipitch][i]] => int note;
      melody[imelody][igain][i] => float velo;
      velo / 9.0 => float fvelo;
      // Only play of velocety grater than 0. So you get reverb from previouas note
      if (velo > 0) playCord(note + trans, fvelo);    
      tickLen::ms => now;
    }
}

// Grouped melodies to sequences
fun void playSeqA() {
  playMelo(Math.random2(0, 2));
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(6);
}

// Grouped melodies to sequences
fun void playSeqB() {
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(6);
}

// Grouped melodies to sequences
fun void playSeqC() {
  playMelo(Math.random2(7, 9));
  playMelo(Math.random2(7, 9));
  playMelo(Math.random2(7, 9));
  playMelo(6);
}

// Grouped melodies to sequences
fun void playSeqD() {
  playMelo(Math.random2(7, 9));
  playMelo(6);
  playMelo(6);
  playMelo(6);
}

// Main 
now => time start;
playSeqC();
playSeqC();
playSeqB();
playSeqB();
playSeqA();
playSeqA();
playSeqB();
playSeqC();
playSeqC();
playSeqD();
<<< "time string", (now - start) / second >>>;
// One more second for reverb
1000::ms => now;

