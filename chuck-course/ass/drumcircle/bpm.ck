// Assignment_7_marching_flutes_retreat

// Class defining the length of notes

public class Bpm {

  // Initial value for _bpm
  120 => int _bpm;
  
  // Define a static array of size 8. (workaround)
  8 => int _size;
  static dur blen0;
  static dur blen1;
  static dur blen2;
  static dur blen3;
  static dur blen4;
  static dur blen5;
  static dur blen6;
  static dur blen7;
  
  // calculate the duration for a given bpm
  fun void defineBlens() {
    calcBlen(0) => blen0;
    calcBlen(1) => blen1;
    calcBlen(2) => blen2;
    calcBlen(3) => blen3;
    calcBlen(4) => blen4;
    calcBlen(5) => blen5;
    calcBlen(6) => blen6;
    calcBlen(7) => blen7;
  }
  // calculate the duration for a given bpm and a power 2 factor
  // power two factors are 1, 2, 4, 8, 16 ,...
  fun dur calcBlen(int i) {
    Math.pow(2.0, i) => float fact;
    return ((60000.0 / _bpm) / fact)::ms;
  }  

  // get a duration with a certain factor
  fun dur dur(int durIndex) {
    Math.abs(durIndex) % _size => int i;
    if (i == 0) return blen0;
    if (i == 1) return blen1;
    if (i == 2) return blen2;
    if (i == 3) return blen3;
    if (i == 4) return blen4;
    if (i == 5) return blen5;
    if (i == 6) return blen6;
    if (i == 7) return blen7;
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
50 => b1.bpm;
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

