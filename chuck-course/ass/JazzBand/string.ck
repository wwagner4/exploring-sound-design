// bass.ck
// Insert the title of your piece here

// Part of your composition goes here

NRev r => Gain master => dac;
.01 => r.mix;
0.05 => master.gain;

StifKarp sks[3];

for (0 => int i; i<sks.cap(); i++) {
    0.3 => sks[i].pickupPosition;
    0.5 => sks[i].sustain;
    0.5 => sks[i].stretch;
    sks[i] => r;
}



// our notes
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int notes[];

100 => int tickLen; // in ms
-12 => int trans; // transpose in midi

[
[1, 2, 3, 3],
[1, 2, 1, 1],
[1, 2, 1, 3],
[1, 1, 1, 3],
[1, 1, 3, 3]] @=> int charaLen[][];

9 => int mlen;

0 => int ipitch;
1 => int igain;
[
[
[7, 5, 5,  4, 2, 5,  7, 5, 5], 
[3, 2, 0,  3, 2, 0,  0, 0, 0]],
[
[4, 0, 5,  0, 2, 5,  7, 5, 5], 
[3, 2, 0,  3, 2, 0,  0, 0, 0]],
[
[4, 2, 5,  7, 5, 5,  7, 5, 5], 
[3, 2, 0,  3, 2, 0,  0, 0, 0]],
[
[7, 5, 5,  4, 2, 5,  7, 5, 5], 
[3, 0, 0,  3, 0, 0,  0, 0, 0]],
[
[4, 5, 5,  7, 2, 5,  7, 5, 5], 
[3, 0, 0,  3, 0, 0,  0, 0, 0]],
[
[0, 5, 5,  0, 2, 5,  7, 5, 5], 
[3, 0, 0,  3, 0, 0,  0, 0, 0]],
[
[0, 0, 0,  0, 0, 0,  0, 0, 0], 
[0, 0, 0,  0, 0, 0,  0, 0, 0]]
] @=> int melody[][][]; 

// functions
fun void play(StifKarp m,  float note, float velocity )
{
    0.01 => float fdiff;
    Std.mtof( note ) + Math.random2f(-fdiff, fdiff) => m.freq;
    velocity * Math.random2f(0.6, 1.1) => m.pluck;
}

fun void playMulti(StifKarp m, int note, float velo) {
    repeat(4) {
        play(m, note , velo);
        Math.random2f(10, 20) => float delay;
        delay::ms => now;
    }
}
fun void playCord(int note, float velo, float delay) {
    delay::ms => now;
                                 playMulti(sks[0], note, velo);
    if (Math.random2(1, 7) == 1) playMulti(sks[1], note + 7, velo);
    else                         playMulti(sks[1], note - 5, velo);
    if (Math.random2(1, 7) == 1) playMulti(sks[2], note + 4, velo);
    else                         playMulti(sks[2], note + 3, velo);    
} 

fun void playMelo(int imelody) {
    <<< "melo", (now / ms) >>>;
    for(0 => int i; i < mlen; i++ ) { 
      notes[melody[imelody][ipitch][i]] => int note;
      melody[imelody][igain][i] / 9.0 => float velo;
      Math.random2(0, charaLen.cap()-1) => int chara;
      for (0 => int j; j < charaLen[chara].cap(); j++ ) {
        if (velo > 0) {
          spork ~ playCord(note + trans, velo, charaLen[chara][j]);    
        }
      }
      tickLen::ms => now;
    }
}

fun void playSeq() {
  playMelo(Math.random2(0, 2));
  playMelo(Math.random2(3, 5));
  playMelo(Math.random2(3, 5));
  playMelo(6);
}

repeat ( 10 )
{
  playSeq();
}
1000::ms => now;

