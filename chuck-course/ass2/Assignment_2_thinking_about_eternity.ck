// Thinking about eternity
// 50, 52, 53, 55, 57, 59, 60, 62

// Setup oscillators
TriOsc s => Pan2 pan => dac;
SawOsc s2 => Pan2 pan2 => dac;

// Overall gainfactor for melody
0.4 => float gf;
// Overall gainfactor for background
0.02 => float g2f;

// Pan melody to the middle
0 => pan.pan;

// Envelope parameters for melody
50 => int t1;
60 => int t2;
70 => int t3;
100 => int t4;

// Define the melody
[
[57, 57, 52, 52, 53],
[57, 57, 52, 52, 53],
[57, 57, 52, 52, 53],
[57, 57, 52, 52, 53],
[57, 57, 52, 52, 53],
[57, 57, 52, 52, 53],
[57, 57, 52, 52, 53],
[57, 57, 57, 57, 57],
[57, 57, 57, 57, 57],
[57, 57, 57, 57, 57],
[57, 57, 57, 57, 52],
[57, 57, 57, 57, 52],
[57, 55, 55, 55, 55],
[50, 55, 52, 52, 52],
[62, 62, 62, 62, 60],
[62, 62, 62, 62, 60],
[62, 62, 62, 62, 60],
[62, 62, 62, 62, 60],
[57, 52, 52, 52, 52]
] @=> int dd[][];
// Define the rhythm
[
[2, 1, 1, 1, 4],
[2, 1, 1, 1, 4],
[2, 1, 1, 1, 4],
[2, 2, 2, 1, 1],
[2, 1, 1, 1, 4],
[2, 1, 1, 1, 4]
] @=> int r[][];

// Define the duration of the patch
now + 30::second => time end;

0 => int l;
while (now < end) {
  // Index of melody
  Math.random2(0, dd.cap()-1) => int j; 
  // Index for rhythm
  l % r.cap() => int k; 
  dd[j].cap()=> int imax;
  // Background frequency is the last pitch of the melody
  Std.mtof(dd[j][imax-1]) / 2.0 => s2.freq;
  for (0 => int i; i < imax; i++) {
    // Play one note of the melody    
    i => float fi;
    // Calculate background gain and pan
    1.0 - (fi / imax) => float g2;
    -1.0 + g2 * 1.5 => float p2;
    p2 => pan2.pan;
    g2 * g2f => s2.gain;
    // Set melody frequency
    Std.mtof(dd[j][i])  => s.freq;
    // Set end of duration of the envelope. Controls rhythm
    r[k][i%r[k].cap()] * 100 => t4; 
    0.0 => float g;
    for (0 => float t; t < t4; 0.022 +=> t) {
      // Calculate melody gain. 
      if (t < t1) {
        // Gain assending
        t * Math.PI / t1 => float x1;
        (2.0 - (Math.cos(x1) + 1)) / 2.0 => g;
      } else if (t > t1 && t < t2) {
        // Gain is top value
        1.0 => g;
      } else if (t > t2 && t < t3) {
        // Gain is descending 
        (t - t2) * Math.PI / (t2 - t3) => float x1;
        (Math.cos(x1) + 1) / 2.0 => g;
      } else {
        // Gain is zero 
        0.0 => g;
      }
      g * gf => s.gain;
      // play what was defined before
      0.1::ms => now;
    }
  }
  l++;
}

