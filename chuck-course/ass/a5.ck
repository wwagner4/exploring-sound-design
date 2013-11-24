// Assignment 5 Unknown

[49, 50, 52, 54, 56, 57, 59, 61] @=> int notes[];

0 => int ipitch;
1 => int ilen;
2 => int igain;

8 => int mlen;
[
[
[3, 7, 0, 0, 7, 3, 0, 0], 
[4, 2, 4, 8, 4, 4, 2, 8], 
[6, 6, 6, 2, 6, 6, 6, 2]],
[
[5, 6, 0, 0, 6, 5, 0, 0], 
[4, 4, 2, 8, 4, 4, 2, 8], 
[6, 6, 6, 2, 6, 6, 6, 2]],
[
[3, 2, 0, 0, 2, 3, 0, 0], 
[4, 4, 2, 8, 4, 2, 4, 8], 
[6, 6, 6, 2, 6, 6, 6, 2]],
[
[2, 0, 4, 4, 0, 2, 4, 4], 
[4, 4, 2, 8, 2, 4, 4, 8], 
[6, 6, 6, 2, 6, 6, 6, 2]],
[
[1, 2, 4, 4, 2, 1, 4, 4], 
[4, 4, 2, 8, 4, 2, 4, 8], 
[6, 6, 6, 2, 6, 6, 6, 2]],
[
[7, 6, 4, 4, 6, 7, 4, 4], 
[4, 4, 2, 8, 2, 4, 4, 8], 
[6, 6, 6, 2, 6, 6, 6, 2]]
] @=> int fluteMelody[][][]; 

Flute flute => Gain master;

0.6 => flute.pressure;
0.2 => flute.vibratoGain;
4 => flute.vibratoFreq;

100::ms => dur lunit;

master => JCRev rev => dac;

<<< rev.mix() >>>;
0.1 => rev.mix;

0.2 => master.gain;

0 => int t;
0 => int imelody;
while (true) {
  if (t % 8 == 0) {
    (imelody + 1) % fluteMelody.cap() => imelody;
  }
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



