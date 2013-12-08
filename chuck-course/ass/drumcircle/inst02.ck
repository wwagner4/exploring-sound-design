// Another Instrument

Bpm bpm;

Sounds snds;
0.5 => snds.gain;
2 => snds.instIndex;

repeat(5) {
  snds.keyOn(0.5); bpm.dur(0) => now;
  snds.keyOn(0.5); bpm.dur(0) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;

  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(2) => now;
  snds.keyOn(0.5); bpm.dur(1) => now;
}
<<< "stop", "inst02" >>>;
