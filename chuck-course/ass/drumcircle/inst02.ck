// Another Instrument

Bpm bpm;

Sounds snds;
0.9 => snds.gain;

while (true) {
  <<< "inst02" >>>;
  10 => snds.instIndex;
  snds.keyOn(0.5);
  bpm.dur(2) => now;
}

