class W1 extends Chubgraph {
  TriOsc to => HPF f => NRev r1 => ADSR e => NRev r2 => Gain g => outlet;

  0.05 => float mix1;
  0.02 => float mix2;
  0.5 => float Q;
  1.0 => float _baseGain;
  
  
  fun float gain(float value) {
    value => _baseGain;
  }

  fun void play(int note, dur dura, float _gain) {
    //<<< "play", note, dura, _gain, Q >>>;
    if (_gain > 0.0001) {
      mix1 => r1.mix;
      mix2 => r2.mix;
      Q => f.Q;
      _gain * _baseGain => g.gain;
      Std.mtof(note + 20) => f.freq;
      Std.mtof(note) => to.freq;
      dura * 0.7 => dur a;
      dura * 0.3 => dur b;
      e.set( dura * 0.01, 0::ms, 1.0, b);
      e.keyOn();
      a => now;
      e.keyOff();
      b => now;
    } else {
      dura => now;
    }
  }  

}

[0, 2, 4, 7, 9] @=> int notes[];

50 => int base;
150::ms => dur u;

W1 w1 => Gain master => dac;


fun int n(int nindex) {return base + notes[nindex];}
fun float g(int igain) {return igain / 9.0;}
fun dur d(int idur) {return u * idur;}

fun void pause(int n) {
  n * u => now;
}
fun void s1(W1 ugen) {
  ugen.play(n(4), d(1), g(4));
  ugen.play(n(4), d(1), g(4));
  pause            (1);
  ugen.play(n(4), d(1), g(4));

  ugen.play(n(3), d(1), g(4));
  pause            (1);
  ugen.play(n(3), d(1), g(5));
  pause            (1);
}
fun void s2(W1 ugen) {
  ugen.play(n(4), d(1), g(4));
  ugen.play(n(4), d(1), g(5));
  ugen.play(n(4), d(1), g(6));
  ugen.play(n(4), d(1), g(7));

  ugen.play(n(3), d(1), g(7));
  ugen.play(n(3), d(1), g(6));
  ugen.play(n(3), d(1), g(5));
  ugen.play(n(3), d(1), g(4));
}
fun void s3(W1 ugen) {
  ugen.play(n(2), d(1), g(5));
  pause            (3);

  ugen.play(n(2), d(1), g(3));
  pause            (3);
}
fun void s4(W1 ugen) {
  ugen.play(n(0), d(1), g(5));
  pause            (3);

  pause            (4);
}
fun void s5(W1 ugen) {
  ugen.play(n(0), d(1), g(4));
  ugen.play(n(0), d(1), g(5));
  ugen.play(n(0), d(1), g(6));
  ugen.play(n(1), d(1), g(7));

  ugen.play(n(0), d(1), g(7));
  ugen.play(n(0), d(1), g(6));
  ugen.play(n(0), d(1), g(5));
  ugen.play(n(1), d(1), g(4));
}
fun void m1(W1 ugen) {
  s1(w1);
  s1(w1);
  s1(w1);
  s3(w1);
  s2(w1);
  s2(w1);
  s2(w1);
  s3(w1);
}
fun void m2(W1 ugen) {
  s1(w1);
  s4(w1);
  s1(w1);
  s4(w1);
  s2(w1);
  s4(w1);
  s2(w1);
  s4(w1);
}
fun void m3(W1 ugen) {
  s5(w1);
  s4(w1);
  s5(w1);
  s3(w1);
  s5(w1);
  s4(w1);
  s5(w1);
  s3(w1);
}

0.5 => master.gain;
m1(w1);
m2(w1);
0.9 => master.gain;
m3(w1);
m1(w1);
0.5 => master.gain;
m3(w1);
m2(w1);
0.1 => master.gain;
m3(w1);

1500::ms  => now;

