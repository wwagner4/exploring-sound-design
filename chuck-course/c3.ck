<<< "hello" >>>;
TriOsc s => dac;
300 => s.freq;
0.1 => s.gain;
2::second => now;
<<< "bye" >>>;
