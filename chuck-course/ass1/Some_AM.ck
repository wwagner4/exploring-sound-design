// Assignment 1

// Some AM

SqrOsc s => dac;
SawOsc s1 => dac;

0.2 => float max;
0.0 => float min;
0.0 => s1.gain;
100 => s1.freq;

// Part one
{
  now + 10::second => time l;
  while (now < l) {
    Math.random2(100, 200) => s.freq;
    Math.random2(2, 7) => int n;
    for (1 => int i; i <= n; i++) {
      0.001 => float diff;
      0.0001::second => dur d;
      if (Math.random2(0, 10) < 3) {
        0.0 => s.gain;
        1000 * d => now;
      } else {
        // Gain up
        for (min => float g; g <= max; diff +=> g) {
          g => s.gain;
          d => now;
        }
        // Gain down
        for (max => float g; g >= min; diff -=> g) {
          g => s.gain;
          d => now;
        }
      }
    }
  }
}
// Part two
{
  now => time start;
  now + 10::second => time l;
  while (now < l) {
    Math.random2(500, 800) => s.freq;
    Math.random2(2, 7) => int n;
    for (1 => int i; i <= n; i++) {
      0.0001 => float diff;
      0.00001::second => dur d;
      if (Math.random2(0, 10) < 3) {
        0.0 => s.gain;
        1000 * d => now;
      } else {
        // Gain up
        for (min => float g; g <= max; diff +=> g) {
          g => s.gain;
          d => now;
        }
        // Gain down
        for (max => float g; g >= min; diff -=> g) {
          g => s.gain;
          d => now;
        }
      }
    }
    // Some background
    if (now > start + 1::second) {
      0.03 => s1.gain;
      100 => s1.freq;
    }
    if (now > start + 5::second) {
      0.02 => s1.gain;
      120 => s1.freq;
    }
    if (now > start + 6::second) {
      0.01 => s1.gain;
      150 => s1.freq;
    }
    if (now > start + 9::second) {
      0.0 => s1.gain;
    }
  }
}
// Part three
{
  now + 10::second => time l;
  now => time start;
  while (now < l) {
    Math.random2(80, 200) => s.freq;
    Math.random2(10, 1) => int n;
    for (1 => int i; i <= n; i++) {
      0.001 => float diff;
      0.0001::second => dur d;
      // Gain up
      for (min => float g; g <= max; diff +=> g) {
        g => s.gain;
        d => now;
      }
      // Gain down
      for (max => float g; g >= min; diff -=> g) {
        g => s.gain;
        d => now;
      }
    }
  }
}

