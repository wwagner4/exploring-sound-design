// Another Instrument

Bpm bpm;

Sounds snds;
0.2 => snds.gain;
1 => snds.instIndex;

repeat(3) {
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
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
snds.keyOn(0.5); bpm.dur(0) => now;
<<< "stop", "inst02" >>>;
