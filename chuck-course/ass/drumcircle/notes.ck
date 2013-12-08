// Assignment_7_marching_flutes_retreat

// The notes class provides the allowed notes for that piece

public class Notes {

  [48, 50, 52, 53, 55, 57, 59, 60] @=> int midiNotes[];
  
  // A value that transposes the original midi note
  0 => int transp;

  // Set transpose one octave up
  fun void octup() {
    transp + 12 => transp;
  }

  // Set transpose one octave down
  fun void octdown() {
    transp - 12 => transp;
  }
  
  // Capacity of notes
  fun int cap() {
    return midiNotes.cap();
  }
  
  // Returns the frequency of the note indicated by index
  // plus the transpose value
  fun float freq(int index) {
    midiNotes[index % midiNotes.cap()] => int midi;
    return Std.mtof(midi + transp);
  }

}
