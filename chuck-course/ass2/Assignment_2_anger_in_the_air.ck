// Assignment_2_anger_in_the_air

SqrOsc s => dac;
SqrOsc t => Pan2 p => dac;
0.02 => t.gain;

100 => int speed;
0.01 => float gain;

now => time start;
0 => int cnt;
[59, 60, 52] @=> int at[];
while (now < start + 30::second) {
  <<< "cnt", cnt >>>;
  // Control the background osc.
  if (cnt % 2 == 0) {
    -0.5 => p.pan;
    0.003 => t.gain;
    Std.mtof(at[cnt % 3]) / 2 => t.freq;
  }
  else {
    0.5 => p.pan;
    Std.mtof(at[cnt % 3]) / 2 => t.freq;
    0.002 => t.gain;
  }
  Math.random2(1, 10) => int r;
  // Control (randomly) weather melody or monoton
  if (r < 7 || cnt < 2) {
    // Monoton
    for (0 => int j; j < 4; j++) {
      [52, 50] @=> int a[];
      [ 4,  4] @=> int d1[];
      [ 0,  2] @=> int v[];
      for (0 => int i; i < a.cap(); i++) {
        // Play one of the monotone sounds
        Std.mtof(a[i]) => float f;
        f => s.freq;
        gain * v[i] => s.gain;
        (d1[i] * speed)::ms => now;
      }
    }
  }
  else {
    // Melody
    [50, 52, 50, 52, 57, 59, 60, 62] @=> int a[];
    [ 4,  4,  4,  2,  4,  4,  4,  1] @=> int d1[];
    [ 2,  0,  2,  5,  6,  2,  5,  7] @=> int v[];
    for (1 => int i; i < a.cap(); i++) {
      // Play one of the melody sounds
      Std.mtof(a[i]) => float f;
      f => s.freq;
      gain * v[i] => s.gain;
      (d1[i] * speed)::ms => now;
    }
    for (a.cap()-1 => int i; i >=  0; i--) {
      // Play one of the melody sounds 
      // Melody backward
      Std.mtof(a[i]) => float f;
      f => s.freq;
      gain * v[i] => s.gain;
      (d1[i] * speed)::ms => now;
    }
  }
  cnt++;
}

