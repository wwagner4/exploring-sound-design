// drums.ck
// Insert the title of your piece here

// Part of your composition goes here

[
[2,2,0,0,5,0,0,0,0, 5,0,0,0,5,0,0,0,0, 2,0,0,0,2,0,0,0,0, 0,0,0,0,0,0,0,0,0],
[5,5,0,0,6,0,0,0,0, 5,0,0,0,5,0,0,0,0, 2,0,0,0,2,0,0,0,0, 0,0,0,0,0,0,0,0,0],
[3,3,0,0,6,0,0,0,0, 2,0,0,0,2,0,0,0,0, 2,0,0,0,2,0,0,0,0, 0,0,0,0,0,0,0,0,0]
] @=> int drum[][];

drum[0].cap() => int drumLen;
<<< "drumLen", drumLen >>>;
100 => float tickLen; // in ms


BandedWG wg => Gain master => dac;

0.3 => master.gain;

fun void playDrum(float velo) {
  velo => wg.noteOn;
  500::ms => now;
}

while (true) {
  for (0 => int i; i < drum.cap(); i++) {
    for (0 => int j; j < drumLen; j++) {
      drum[i][j] => int velo;
      if (velo > 0) {
        velo / 1.0 => float fvelo;
        spork ~ playDrum(fvelo);
      }
      tickLen::ms => now;
    }
  }
}
