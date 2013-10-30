// Assignment 1

// Some AM

Std.atoi(me.arg(0)) => int _freq;
Std.atof(me.arg(1)) => float _modFreq;
Std.atoi(me.arg(2))::second => dur _dur;
<<< _freq, _modFreq, _dur >>>;

SqrOsc s => dac;

0.1 => float max;
_freq => s.freq;
now + _dur => time l;

while (now < l) {
  0.0 => float min;
  _modFreq => float diff;
  0.0001::second => dur d;
  for (min => float g; g <= max; diff +=> g) {
    g => s.gain;
    d => now;
  }
  for (max => float g; g >= min; diff -=> g) {
    g => s.gain;
    d => now;
  }
}
