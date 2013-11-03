// Another Envelope
TriOsc s => dac;

5 => int t1;
80 => int t2;
90 => int t3;
100 => int t4;

0.0 => float g;

[50, 52, 53, 53, 53, 55, 57, 59, 60, 62] @=> int dd[];

for (0 => int i; i < dd.cap(); i++) {
  Std.mtof(dd[i]) => s.freq;
  for (0 => float t; t < t4; 0.1 +=> t) {
    if (t < t1) {
      t * Math.PI / t1 => float x1;
      (2.0 - (Math.cos(x1) + 1)) / 2.0 => g;
    } else if (t > t1 && t < t2) {
      1.0 => g;
    } else if (t > t2 && t < t3) {
      (t - t2) * Math.PI / (t2 - t3) => float x1;
      (Math.cos(x1) + 1) / 2.0 => g;
    } else {
      0.0 => g;
    }
    g => s.gain;
    0.5::ms => now;
  }
}

