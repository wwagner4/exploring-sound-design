// Envelope
TriOsc s => dac;

Std.mtof(55) => s.freq;

[0.2, 0.5, 0.7, 0.8, 1.0, 1.0, 1.0, 0.9, 0.8, 0.6, 0.4, 0.2, 0.1, 0.05, 0.001, 0.0, 0.0] @=> float env[];
while(true) {
  for (0 => int i; i<env.cap(); i++) {
    env[i] * 0.5 => s.gain;
    50::ms => now;
  }
}
