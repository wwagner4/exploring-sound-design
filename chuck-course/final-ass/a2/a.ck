class W1 extends Chubgraph {
  TriOsc to => HPF f => NRev r1 => ADSR e => NRev r2 => Gain g => outlet;

  43 => int base;
  150::ms => dur u;

  0.1 => r1.mix;
  0.01 => r2.mix;

  0.1 => f.Q;

  1.0 => float baseGain;

  fun void play(int note, int dur, float gain) {
    <<< "play", note, dur, gain >>>;
    gain * baseGain => g.gain;
    Std.mtof(note + 10) => f.freq;
    Std.mtof(note) => to.freq;
    dur * u * 0.5 => dur a;
    dur * u * 0.5 => dur b;
    e.set( u / 10, 0::ms, 1.0, b);
    e.keyOn();
    a => now;
    e.keyOff();
    b => now;
  }  

}

W1 w1 => dac;

w1.play(55, 2, 1.0);
w1.play(55, 2, 1.0);



500::ms  => now;

