// drums.ck
// Insert the title of your piece here

// Part of your composition goes here

[
[5, 0, 0, 0, 0, 0,  5, 0, 0, 0, 0, 0,  5, 0, 0, 0, 0, 0], 
[5, 0, 0, 0, 0, 0,  5, 0, 0, 0, 0, 0,  5, 0, 0, 0, 0, 0]
] @=> int drum[][];

18 => int drumLen;
200 => float tickLen; // in ms


BandedWG wg => dac;

fun void playDrum(float velo) {
  <<< "playDrum", (now / ms) >>>;
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
