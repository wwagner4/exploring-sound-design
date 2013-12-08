// Assignment_7_marching_flutes_retreat
// Rythm for a Snear

// Instantiate the Bpm class
Bpm bpm;

// Instantiate the Sounds class
Sounds snds;
0.2 => snds.gain;
16 => snds.instIndex;

// Play the rythm
repeat(2) {
  snds.keyOn(0.5); bpm.dur(3) => now;
  snds.keyOn(0.5); bpm.dur(3) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(0) => now;
  snds.keyOn(0.5); bpm.dur(0) => now;
  snds.keyOn(0.5); bpm.dur(0) => now;

  snds.keyOn(0.5); bpm.dur(3) => now;
  snds.keyOn(0.5); bpm.dur(3) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(3) => now;
  snds.keyOn(0.5); bpm.dur(3) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(0) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(0) => now;

}
<<< "stop", "inst04" >>>;
