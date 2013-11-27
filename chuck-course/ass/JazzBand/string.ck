// bass.ck
// Insert the title of your piece here

// Part of your composition goes here

NRev r => dac;
.7 => r.gain;
.01 => r.mix;

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
[1, 1, 50, 50],
[50, 1, 50, 1],
[1, 50, 50, 50],
[50, 1, 1, 1],
[50, 50, 50, 1]] @=> int len[][];

// basic play function (add more arguments as needed)
fun void play(StifKarp m,  float note, float velocity )
{
    // start the note
    0.1 => float fdiff;
    Std.mtof( note ) + Math.random2f(-fdiff, fdiff) => m.freq;
    velocity * Math.random2f(0.6, 1.1) => m.pluck;
}

fun void playMulti(StifKarp m, int note) {
    repeat(4) {
        spork ~ play(m, note , 0.1 );
        Math.random2f(10, 20) => float delay;
        delay::ms => now;
    }
}
fun void playCord(int note) {
    spork ~ playMulti(sks[0], note );
    if (Math.random2(1, 2) == 1) spork ~ playMulti(sks[1], note + 7);
    else                         spork ~ playMulti(sks[1], note - 5);
    if (Math.random2(1, 2) == 1) spork ~ playMulti(sks[2], note + 4);
    else                         spork ~ playMulti(sks[2], note + 3);    
 } 

// infinite time-loop
-6 => int trans;

while( true )
{
    for(0 => int i; i < notes.cap(); i++ )
    {   
      Math.random2(0, len.cap()-1) => int chara;
      for (0 => int j; j < len[chara].cap(); j++ ) {
        playCord(notes [i] + trans);    
        len[chara][j]::ms => now;
      }
      500::ms => now;
    }
}

