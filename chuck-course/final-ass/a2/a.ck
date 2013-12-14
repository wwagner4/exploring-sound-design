class W1 extends Chubgraph {
  TriOsc to => HPF f => NRev r1 => ADSR e => NRev r2 => Gain g => outlet;

  150::ms => dur u;

  0.1 => r1.mix;
  0.08 => r2.mix;

  0.1 => f.Q;

  2.0 => float baseGain;

  fun void play(int note, int dur, float _gain) {
    <<< "play", note, dur, _gain >>>;
    if (_gain > 0.0001) {
      _gain * baseGain => g.gain;
      Std.mtof(note + 40) => f.freq;
      Std.mtof(note) => to.freq;
      dur * u * 0.9 => dur a;
      dur * u * 0.1 => dur b;
      e.set( u * 0.01, 0::ms, 1.0, b);
      e.keyOn();
      a => now;
      e.keyOff();
      b => now;
    } else {
      dur * u => now;
    }
  }  

}

[0, 2, 4, 7, 9] @=> int notes[];

50 => int base;

W1 w1 => dac;


fun int n(int nindex) {return base + notes[nindex];}
fun float g(int igain) {return igain / 9.0;}


w1.play(n(0), 2, g(9));
w1.play(n(2), 1, g(0));
w1.play(n(2), 2, g(7));
w1.play(n(1), 1, g(0));
w1.play(n(2), 4, g(5));
w1.play(n(2), 1, g(4));



500::ms  => now;

