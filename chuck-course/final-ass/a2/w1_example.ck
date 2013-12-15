// Example for the usage of W1

W1 w => dac;

0.001 => float mix;
10.0 => float Q;
25 => int filterOffsetMidi;
0.2 => float masterGain; 
0.05 => float attack;
0.2 => float decay;
0.8 => float sustain;
0.5 => float release;
 
[40, 50, 51, 50, 55, 61, 62, 63, 65, 70] @=> int notes[];
[200::ms, 400::ms, 200::ms, 800::ms, 100::ms, 100::ms] @=> dur durs[];
[1.0, 1.0, 0.5, 0.5, 0.0] @=> float gains[];
0 => int i;
while(true) {
  w.play(notes[i%notes.cap()], durs[i%durs.cap()], gains[i%gains.cap()]);
  durs[i%durs.cap()] => now;
  i++;
}


