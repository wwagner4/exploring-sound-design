// bass.ck
// Insert the title of your piece here

// Part of your composition goes here

NRev r => Gain master => dac;
.01 => r.mix;
0.2 => master.gain;

StifKarp sks[3];
Pan2 pan[3];

for (0 => int i; i<sks.cap(); i++) {
    0.1 => sks[i].pickupPosition;
    0 => sks[i].sustain;
    0 => sks[i].stretch;
    -0.5 + 0.5 * i => pan[i].pan; 
    sks[i] => pan[i] => r;
}



// our notes
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int notes[];

90 => int tickLen; // in ms
-4 => int trans; // transpose in midi

0 => int ipitch;
1 => int igain;
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

melody[0][0].cap() => int mlen;

// functions
fun void play(StifKarp m,  float note, float velocity ) {
    Math.random2(10, 30)::ms => now;
    0.005 => float fdiff;
    Std.mtof( note ) + Math.random2f(-fdiff, fdiff) => m.freq;
    velocity * Math.random2f(0.6, 1.1) => m.pluck;
    500::ms => now;
}

fun void playCord(int note, float velo) {
                                 spork ~ play(sks[0], note, velo);
    if (Math.random2(1, 3) == 1) spork ~ play(sks[1], note + 7, velo);
    else                         spork ~ play(sks[1], note - 5, velo);
    if (Math.random2(1, 4) == 1) spork ~ play(sks[2], note + 4, velo);
    else                         spork ~ play(sks[2], note + 3, velo);    
} 

fun void playMelo(int imelody) {
    for(0 => int i; i < mlen; i++ ) { 
      notes[melody[imelody][ipitch][i]] => int note;
      melody[imelody][igain][i] => float velo;
      velo / 9.0 => float fvelo;
      if (velo > 0) playCord(note + trans, fvelo);    
      tickLen::ms => now;
    }
}

fun void playSeqA() {
  playMelo(Math.random2(0, 2));
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(6);
}

fun void playSeqB() {
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(6);
}

fun void playSeqC() {
  playMelo(Math.random2(7, 9));
  playMelo(Math.random2(7, 9));
  playMelo(Math.random2(7, 9));
  playMelo(6);
}

fun void playSeqD() {
  playMelo(Math.random2(7, 9));
  playMelo(6);
  playMelo(6);
  playMelo(6);
}

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
1000::ms => now;

