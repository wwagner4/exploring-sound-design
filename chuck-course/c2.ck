// Author WW 21.Oct 2013

// Sound network
SinOsc s => dac;

while (true) {
  for (0.4 => float j; j<0.9; j + 0.01 => j) {
    for (0 => int i; i<10; i++) {
       0.005 * i => s.gain;
       j * 100 => s.freq;
       0.1::second => now;
    }
  }
}
