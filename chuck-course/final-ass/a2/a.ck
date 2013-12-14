TriOsc to => HPF f => NRev r1 => ADSR e => NRev r2 => Gain g => dac;

43 => int base;
150::ms => dur u;

0.1 => r1.mix;
0.01 => r2.mix;

0.1 => f.Q;

1.0 => float baseGain;

[0, 2, 4, 7, 9] @=> int notes[];

[0, 3, 3, 3, 2, 2] @=> int melo[];
[4, 4, 2, 4, 2, 2] @=> int dur[];
[2, 5, 5, 9, 5, 5] @=> int gain[];

for (0 => int i; i< melo.cap(); i++) {
  gain[i] / 9.0 * baseGain => g.gain;
  base + notes[melo[i]] => int note;
  Std.mtof(note + 10) => f.freq;
  Std.mtof(note) => to.freq;
  dur[i] * u * 0.5 => dur a;
  dur[i] * u * 0.5 => dur b;
  e.set( u / 10, 0::ms, 1.0, b);
  
  e.keyOn();
  a => now;
  e.keyOff();
  b => now;
}
5*u => now;

