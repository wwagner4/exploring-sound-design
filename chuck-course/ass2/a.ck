// Assignment_2_anger_in_the_air

SqrOsc s => dac;
100 => int speed;
0.01 => float gain;


while (true) {
  Math.random2(1, 10) => int r;
  if (r < 6) {
    <<< r, "a" >>>;
    for (0 => int j; j < 4; j++) {
      [52, 50] @=> int a[];
      [ 4,  4] @=> int d1[];
      [ 0,  2] @=> int v[];
      for (0 => int i; i < a.cap(); i++) {
        Std.mtof(a[i]) => float f;
        f => s.freq;
        gain * v[i] => s.gain;
        (d1[i] * speed)::ms => now;
      }
    }
  }
  else {
    <<< r, "b" >>>;
    [50, 52, 50, 52, 57, 59, 60, 62] @=> int a[];
    [ 4,  4,  4,  2,  4,  4,  4,  1] @=> int d1[];
    [ 2,  0,  2,  5,  6,  2,  5,  7] @=> int v[];
    for (1 => int i; i < a.cap(); i++) {
      Std.mtof(a[i]) => float f;
      f => s.freq;
      gain * v[i] => s.gain;
      (d1[i] * speed)::ms => now;
    }
    for (a.cap()-1 => int i; i >=  0; i--) {
      Std.mtof(a[i]) => float f;
      f => s.freq;
      gain * v[i] => s.gain;
      (d1[i] * speed)::ms => now;
    }
  }
}

