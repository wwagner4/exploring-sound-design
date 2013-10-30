// Another Tryal
SawOsc s => dac;

Std.atoi(me.arg(0)) => int _freq;
Std.atof(me.arg(1)) => float _gain;


for (0 => int i; i < 10; i ++) {
  _freq => float f;
  f => s.freq;
  {
    now => time start;
    while (now < start + 400::ms) {
      f => s.freq;
      5 +=> f;
      0.2 * _gain => s.gain;
      0.01::second => now;
    }
  }
  {
    now => time start;
    while (now < start + 400::ms) {
      f => s.freq;
      5 -=> f;
      0.15 * _gain => s.gain;
      0.01::second => now;
    }
  }
  {
    now => time start;
    while (now < start + 400::ms) {
      f => s.freq;
      3 +=> f;
      0.1 * _gain => s.gain;
      0.02::second => now;
    }
  }
  {
    now => time start;
    while (now < start + 400::ms) {
      f => s.freq;
      3 -=> f;
      0.01 * _gain => s.gain;
      0.05::second => now;
    }
  }
}
0.0 => s.gain;
10::ms => now;
