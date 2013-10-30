<<< "hello" >>>;
SinOsc s => Gain g => dac;
0.05 => g.gain;
0.002::second => dur d;
200 => s.freq;
while (true) {
  0.1 => s.gain;
  d => now;
  0.2 => s.gain;
  d => now;
  0.3 => s.gain;
  d => now;
  0.2 => s.gain;
  d => now;
}
<<< "bye" >>>;

