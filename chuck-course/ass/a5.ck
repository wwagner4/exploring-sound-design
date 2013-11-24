// Assignment 5 Unknown

[49, 50, 52, 54, 56, 57, 59, 61] @=> int notes[];

[1, 3, 0, 3, 5, 7, 5, 0] @=> int npitch[];
[2, 2, 4, 8, 2, 2, 4, 8] @=> int nlength[];
[4, 0, 9, 9, 0, 5, 5, 5] @=> int ngain[];

Flute flute => Gain master;

0.6 => flute.pressure;
0.6 => flute.vibratoGain;
4 => flute.vibratoFreq;

100::ms => dur lunit;

master => dac;

0.5 => master.gain;

0 => int t;
while (true) {
  npitch[t % npitch.cap()] => int pindex;
  Math.mtof(notes[pindex]) => flute.freq;
  
  ngain[t % ngain.cap()] / 9.0 => flute.gain;
  
  1.0 => flute.noteOn;
  nlength[t % nlength.cap()] => int nl;
  (nl-1) * lunit => now;
  1.0 => flute.noteOff;
  1 * lunit => now;
  t++;
} 



