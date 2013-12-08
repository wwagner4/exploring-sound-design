// Class defining the length of notes

public class Bpm {

  // Initial value for _bpm
  120 => int _bpm;
  
  // Define a static array of size 8. (workaround)
  8 => int _size;
  static dur blens[];
  [500::ms, 250::ms, 125::ms, 63::ms, 31::ms, 16::ms, 8::ms, 4::ms] @=> blens;
  
  // calculate the duration for a given bpm
  fun void defineBlens() {
    for (0=>int i; i < _size; i++) {
      calcBlen(i) => blens[i];
    }
  }
  // calculate the duration for a given bpm and a power 2 factor
  // power two factors are 1, 2, 4, 8, 16 ,...
  fun dur calcBlen(int i) {
    Math.pow(2.0, i) => float fact;
    return ((60000.0 / _bpm) / fact)::ms;
  }  

  // get a duration with a certain factor
  fun dur dur(int durIndex) {
    return blens[durIndex % _size];
  }

  // Set a new bpm and recalculate the durations 
  fun void bpm(int bpm) {
    bpm => _bpm;
    defineBlens();
  }
}


/** Try it out
Bpm b1;
Bpm b2;

150 => b2.bpm;
<<< b1.dur(0) / ms, 
    b1.dur(1) / ms, 
    b1.dur(2) / ms, 
    b1.dur(3) / ms, 
    b1.dur(4) / ms, 
    b1.dur(5) / ms, 
    b1.dur(6) / ms, 
    b1.dur(7) / ms >>> ;
<<< b2.dur(0) / ms, 
    b2.dur(1) / ms, 
    b2.dur(2) / ms, 
    b2.dur(3) / ms, 
    b2.dur(4) / ms, 
    b2.dur(5) / ms, 
    b2.dur(6) / ms, 
    b2.dur(7) / ms >>> ;
*/
