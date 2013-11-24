// Assignment 5 Unknown

[49, 50, 52, 54, 56, 57, 59, 61] @=> int notes[];

0 => int ipitch;
1 => int ilen;
2 => int igain;

8 => int mlen;
[
[
[3, 3, 0, 3, 5, 7, 5, 0], 
[2, 2, 4, 8, 2, 2, 4, 8], 
[4, 7, 9, 9, 0, 5, 5, 5]]
] @=> int fluteMelody[][][]; 

Flute flute => Gain master;

0.6 => flute.pressure;
0.6 => flute.vibratoGain;
4 => flute.vibratoFreq;

100::ms => dur lunit;

master => dac;

0.5 => master.gain;

0 => int t;
while (true) {
  0 => int imelody;
  fluteMelody[imelody][ipitch][t % mlen] => int pindex;
  Math.mtof(notes[pindex]) => flute.freq;
  
  fluteMelody[imelody][igain][t % mlen] / 9.0 => flute.gain;
  
  1.0 => flute.noteOn;
  fluteMelody[imelody][ilen][t % mlen] => int nl;
  (nl-1) * lunit => now;
  1.0 => flute.noteOff;
  1 * lunit => now;
  t++;
} 



