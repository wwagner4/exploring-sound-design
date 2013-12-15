
public class W1 extends Chubgraph {
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
      Std.mtof(note + 30) => f.freq;
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

