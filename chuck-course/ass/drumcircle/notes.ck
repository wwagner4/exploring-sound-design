//

// The notes class provides the allowed notes for that piece

public class Notes {

  [48, 50, 52, 53, 55, 57, 59, 60] @=> int midiNotes[];

  0 => int transp;

  fun void octup() {
    transp + 12 => transp;
  }

  fun void octdown() {
    transp - 12 => transp;
  }
  
  fun int cap() {
    return midiNotes.cap();
  }
  
  fun float freq(int index) {
    midiNotes[index % midiNotes.cap()] => int midi;
    return Std.mtof(midi + transp);
  }

}
