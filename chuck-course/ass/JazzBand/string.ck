// bass.ck
// Insert the title of your piece here

// Part of your composition goes here

NRev r => Gain master => dac;
.01 => r.mix;
0.4 => master.gain;

StifKarp sks[3];

for (0 => int i; i<sks.cap(); i++) {
    0.3 => sks[i].pickupPosition;
    0.5 => sks[i].sustain;
    0.5 => sks[i].stretch;
    sks[i] => r;
}



// our notes
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int notes[];

[
[10, 20, 30, 30],
[10, 20, 10, 10],
[10, 20, 10, 30],
[10, 10, 10, 30],
[10, 10, 30, 30]] @=> int charaLen[][];

9 => int mlen;
[6, 6, 0, 4, 4, 0, 3, 0, 0] @=> int m2p[];
[4, 5, 0, 4, 8, 0, 4, 0, 0] @=> int m2v[];

[0, 4, 0, 6, 2, 0, 5, 0, 0] @=> int m1p[];
[4, 5, 0, 4, 8, 0, 4, 0, 0] @=> int m1v[];

// basic play function (add more arguments as needed)
fun void play(StifKarp m,  float note, float velocity )
{
    // start the note
    0.01 => float fdiff;
    Std.mtof( note ) + Math.random2f(-fdiff, fdiff) => m.freq;
    velocity * Math.random2f(0.6, 1.1) => m.pluck;
}

fun void playMulti(StifKarp m, int note, float velo) {
    repeat(4) {
        spork ~ play(m, note , velo);
        Math.random2f(10, 20) => float delay;
        delay::ms => now;
    }
}
fun void playCord(int note, float velo) {
    spork ~ playMulti(sks[0], note, velo);
    if (Math.random2(1, 7) == 1) spork ~ playMulti(sks[1], note + 7, velo);
    else                         spork ~ playMulti(sks[1], note - 5, velo);
    if (Math.random2(1, 7) == 1) spork ~ playMulti(sks[2], note + 4, velo);
    else                         spork ~ playMulti(sks[2], note + 3, velo);    
 } 

// infinite time-loop
-6 => int trans;

while( true )
{
    for(0 => int i; i < mlen; i++ ) { 
      notes[m1p[i]] => int note;
      m1v[i] / 9.0 => float velo;
      Math.random2(0, charaLen.cap()-1) => int chara;
      for (0 => int j; j < charaLen[chara].cap(); j++ ) {
        if (velo > 0) {
          playCord(note + trans, velo);    
          charaLen[chara][j]::ms => now;
        }
      }
      150::ms => now;
    }
}

