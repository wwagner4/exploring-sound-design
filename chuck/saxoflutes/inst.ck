// intrument patch

0.5::second => dur T;

/**
 * Controls the gain of a unit generator over the time with a ramp
 * function defined by the following parameters.
 * NOTICE: The duration parameters must all be defined with the same unit.
 * att: Attac time
 * sustain: Sustain time (not level)
 * release: Release time
 * durunit: One unit of the time unit of att, sust, release.
 * maxGain: Maximum gain. [0.0, 1.0]
 * 
 * EXAMPLE: controlGain(sinOsc, 100::ms, 200::ms, 50::ms, 1::MS, 0.6);
 */
fun void controlGain(UGen ugen, dur att, dur sust, dur ret, dur durunit, float maxGain) {
   att / durunit => float fatt;
   sust / durunit => float fsust;
   ret / durunit => float fret;
   now => time start;
   0.0 => float val;
   att + sust + ret => dur dura;
   //<<<"controlGain >", now, "dura=", dura>>>;
   while (now < start + (dura * 1.1)) {
      (now - start) / 1::T => float t;
      if (now - start < att) maxGain / fatt * t => val;
      else if (now - start < att + sust) maxGain => val;
      else if (now - start < att + sust + ret) {
         (fatt + fsust + fret) * maxGain / fret => float a;
         -maxGain / fret * t + a => val;
      }
      else 0 => val;
      //<<<"gain=", val>>>;
      val => ugen.gain;
      10::ms => now;
   }   
   //<<<"controlGain <", now>>>;
   
}

/**
 * A flute with certain parameter settings. Listen to it if you 
 * want to know how it sounds.
 * use FluteA => dac;
 */
class FluteA extends Flute {
   clear( 1.0 );
   0.55 => jetDelay;
   0.59 => jetReflection;
   0.58 => endReflection;
   0.78 => noiseGain;
   11.2 => vibratoFreq;
   0.9  => vibratoGain;
   0.7  => pressure;
}

/**
 * Another parameterset for a flute.
 */
class FluteB extends Flute {
   clear( 1.0 );
   0.4 => jetDelay;
   0.6 => jetReflection;
   0.6 => endReflection;
   0.2 => noiseGain;
   9.0 => vibratoFreq;
   0.9  => vibratoGain;
   0.8  => pressure;
}

/**
 * A parameterset for a Saxophone.
 */
class SaxofonyA extends Saxofony {
   0.9 => stiffness;
   0.2 => aperture;
   0.5 => noiseGain;
   0.6 => blowPosition;
   6.0 => vibratoFreq;
   0.7 => vibratoGain;
   0.5 => pressure;
}

/**
 * A parameterset for a Saxophone.
 */
class SaxofonyB extends Saxofony {
   0.9 => stiffness;
   0.2 => aperture;
   0.5 => noiseGain;
   0.6 => blowPosition;
   11.0 => vibratoFreq;
   0.7 => vibratoGain;
   0.2 => pressure;
}

/**
 * Plays an instrument for a certain duration (dura)
 */
fun void inst(StkInstrument inst, int mnote, dur dura, float maxGain) {
   //<<<"inst >", now, "dura=", dura>>>;

   inst => dac;

   Std.mtof( mnote ) => inst.freq;
   0.9 => inst.noteOn;
   0.0 => inst.gain;
   
   T - (now % T) => now;
   dura * 0.05 => dur att;
   dura * 0.6 => dur sust;
   dura * 0.35 => dur ret;
   controlGain(inst, att, sust, ret, 1::T, maxGain);   
   (dura * 1.1) => now;
   //<<<"inst <", now>>>;
}

/**
 * Starts multiple threads playing flutes with different pitch
 */
fun void flutes(dur dura) {
   <<<"flutes >", now, "dura=", dura>>>;
   now => time start;
   // The pitches as midi numbers.
   [ 53, 53, 59, 59, 59, 48, 48, 48, 48, 48, 48 ] @=> int notes[];
   while (now < start + dura) {
      {
         // Selct a random gain
         Math.random2f(0.01, 0.03) => float mg;
         // Selct a random pitch from notes 
         notes[Math.random2(0, notes.cap()-1)] => int note;
         // Start a new shred playing a flute
         spork ~ inst(new FluteA, note, 10::T, mg); 
         // Wait for two time units
         2::T => now;
      }
      {
         // Play another flute (details see above)     
         Math.random2f(0.01, 0.04) => float mg;
         notes[Math.random2(0, notes.cap()-1)] => int note;
         spork ~ inst(new FluteB, note, 12::T, mg); 
         3::T => now;
      }
   }
   dura => now;
   <<<"flutes <", now>>>;
}

/**
 * Play multiple saxophones (details see above)
 */
fun void saxofonies(dur dura) {
   <<<"sax >", now, "dura=", dura>>>;
   now => time start;
   [ 53, 53, 59, 59, 59, 48, 48, 48, 48, 48, 48 ] @=> int notes[];
   while (now < start + dura) {
      {
         Math.random2f(0.01, 0.02) => float mg;
         spork ~ inst(new SaxofonyA, notes[Math.random2(0, notes.cap()-1)], 20::T, mg); 
         10::T => now;
      }
      {
         Math.random2f(0.01, 0.05) => float mg;
         spork ~ inst(new SaxofonyB, notes[Math.random2(0, notes.cap()-1)], 25::T, mg); 
         15::T => now;
      }
   }
   dura => now;
   <<<"sax <", now>>>;
}

// The main sound table of that patch

70::T => dur dura;
<<<"blow >", now, "dura=", dura>>>;

spork ~ flutes(dura * 0.5);

dura * 0.3 => now;
spork ~ saxofonies(dura * 0.5);

dura * 0.7 => now;
spork ~ flutes(dura * 0.3);

dura => now;
<<<"blow <", now>>>;

