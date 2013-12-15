public class W1 extends W {
  SawOsc to => HPF f => NRev rev => ADSR e => Gain g => outlet;

  // Mix of the build in NRev 
  0.001 => float _mix;
  fun void mix(float value) { value => _mix; }
  
  // Q of the build in filter
  10.0 => float Q;
  
  // Offset of the frequency of the
  // build in filter relative to the
  // note parameter in the 'play' function
  25 => int filterOffsetMidi;

  // To have reasonable results if the 
  // _gain parameter in 'play' is 1.0
  0.2 => float masterGain; 
  
  // Configuration of the build in 
  // ADSR envelope.
  // 'attack', 'decay', and 'release' are
  // fractions of the duration paramer 'dura'
  // in the play function. 
  // 'attack' + 'decay' + 'release' should not be greater than 1.0
  0.05 => float attack;
  0.2 => float decay;
  0.8 => float sustain;
  0.5 => float release;
  
  // Overrides the function in Chubgraph
  // Has the same effect as setting ''
  fun float gain(float value) {
    value => masterGain;
  }
  
  // Plays a midi note for a certain duration with
  // a certain gain.
  //
  // int    note: The midi note to be played
  // dur    dura: The duration the note is played
  // float _gain: The gain the note is played with  
  fun void play(int note, dur dura, float _gain) {
    <<< "play", note, dura, _gain, Q, _mix >>>;
    if (_gain > 0.0001) {
      _mix => rev.mix;
      Q => f.Q;
      _gain * masterGain => g.gain;
      Std.mtof(note + filterOffsetMidi) => f.freq;
      Std.mtof(note) => to.freq;
      dura * (1.0 - release) => dur a;
      dura * release => dur b;
      e.set( dura * attack, dura * decay, sustain, b);
      e.keyOn();
      a => now;
      e.keyOff();
      b => now;
    } else {
      dura => now;
    }
  }  

}

// Example for the usage of W1
// Make sure you have w.ck and w1.ck loaded before
// Machine.add(me.dir() + "/w.ck");
// Machine.add(me.dir() + "/w1.ck");

// W1 w => dac;

// 0.001 => w.mix;
// 10.0 => w.Q;
// 25 => w.filterOffsetMidi;
// 0.2 => w.masterGain; 
// 0.05 => w.attack;
// 0.2 => w.decay;
// 0.8 => w.sustain;
// 0.5 => w.release;
 
// [40, 50, 51, 50, 55, 61, 62, 63, 65, 70] @=> int notes[];
// [200::ms, 400::ms, 200::ms, 800::ms, 100::ms, 100::ms] @=> dur durs[];
// [1.0, 1.0, 0.5, 0.5, 0.0] @=> float gains[];
// 0 => int i;
// while(true) {
//   w.play(notes[i%notes.cap()], durs[i%durs.cap()], gains[i%gains.cap()]);
//   durs[i%durs.cap()] => now;
//   i++;
// }




