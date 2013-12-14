class W1 extends Chubgraph {
  TriOsc to => HPF f => NRev r1 => ADSR e => NRev r2 => Gain g => outlet;


  0.2 => r1.mix;
  0.08 => r2.mix;

  0.2 => float Q;
  1.0 => float _baseGain;
  
  fun float gain(float value) {
    value => _baseGain;
  }

  fun void play(int note, dur dura, float _gain) {
    <<< "play", note, dura, _gain >>>;
    if (_gain > 0.0001) {
      Q => f.Q;
      _gain * _baseGain => g.gain;
      Std.mtof(note + 20) => f.freq;
      Std.mtof(note) => to.freq;
      dura * 0.9 => dur a;
      dura * 0.1 => dur b;
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

W1 w1 => dac;
0.3 => w1.Q;
0.1 => w1.gain; 

fun int n(int nindex) {return base + notes[nindex];}
fun float g(int igain) {return igain / 9.0;}
fun dur d(int idur) {return u * idur;}


w1.play(n(0), d(2), g(9));
w1.play(n(1), d(1), g(9));
w1.play(n(2), d(2), g(0));
w1.play(n(3), d(1), g(9));
w1.play(n(4), d(3), g(9));
w1.play(n(4), d(3), g(0));
w1.play(n(3), d(1), g(3));
w1.play(n(2), d(1), g(2));
w1.play(n(1), d(1), g(1));
w1.play(n(0), d(1), g(1));



1500::ms  => now;

