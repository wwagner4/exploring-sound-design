// Assignment 5 Unknown

[49, 50, 52, 54, 56, 57, 59, 61] @=> int notes[];

0 => int ipitch;
1 => int igain;

8 => int mlen;
[
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[1, 0, 5, 2, 0, 1, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[3, 0, 6, 3, 0, 3, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[5, 0, 7, 4, 0, 5, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[7, 0, 8, 5, 0, 6, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[6, 6, 6, 2, 2, 0, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[9, 0, 8, 5, 0, 9, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[9, 0, 8, 5, 0, 7, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[6, 0, 8, 5, 0, 5, 0, 1]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[4, 0, 7, 4, 0, 3, 0, 0]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[2, 0, 5, 3, 0, 2, 0, 0]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[0, 0, 1, 1, 0, 1, 0, 0]],
[
[0, 0, 0, 5, 5, 2, 7, 0], 
[0, 0, 0, 0, 0, 0, 0, 0]]
] @=> int fluteMelody[][][]; 

Flute flutes[3];
Gain flutesMaster => Gain master => JCRev rev => dac;
for (0 => int i; i < flutes.cap(); i++) {
  flutes[i] => flutesMaster; 
  0.6 => flutes[i].pressure;
  0.2 => flutes[i].vibratoGain;
  4 => flutes[i].vibratoFreq;
}

30::ms => dur lunit;
0.1 => rev.mix;
0.1 => master.gain;

JCRev srev => Gain sgain => dac;

Shakers shakers[5];
for (0 => int j; j < shakers.cap(); j++) {
  9 => shakers[j].preset;
  60 => shakers[j].objects;
  shakers[j] => srev;
}

Shakers shakers1[5];
for (0 => int j; j < shakers1.cap(); j++) {
  10 => shakers1[j].preset;
  10.0 => shakers1[j].objects;
  shakers1[j] => srev;
}

[
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[1, 0, 1, 0, 1, 0, 0, 0], 
[2, 0, 1, 1, 1, 0, 0, 0], 
[3, 0, 2, 3, 2, 1, 0, 0], 
[4, 1, 2, 4, 2, 1, 1, 0], 
[5, 2, 2, 3, 2, 1, 1, 1], 
[6, 3, 2, 2, 2, 1, 1, 1], 
[6, 3, 2, 1, 2, 1, 1, 0], 
[5, 3, 2, 1, 2, 1, 1, 0], 
[4, 2, 2, 0, 2, 1, 0, 0], 
[4, 1, 2, 0, 2, 0, 0, 0], 
[4, 0, 2, 0, 2, 0, 0, 0], 
[3, 0, 2, 0, 2, 0, 0, 0], 
[2, 0, 1, 0, 2, 0, 0, 0], 
[1, 0, 0, 0, 1, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0] 
] @=> int beat[][];

[
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[1, 3, 2, 1, 2, 1, 5, 5], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[1, 3, 2, 1, 2, 1, 5, 5], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[1, 3, 2, 1, 2, 1, 5, 5], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[1, 1, 0, 1, 1, 1, 2, 2], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 1, 0, 0, 1, 1, 1, 1], 
[0, 0, 0, 0, 0, 0, 0, 0], 
[0, 0, 0, 0, 0, 0, 0, 0] 
] @=> int beat1[][];


0 => int t;
0 => int imelody;
now => time start;
0 => int n;
while (now < start + 30::second) {
  <<< "t", t, "imelody", imelody, "n", n, "time", (now - start) / second >>>;
  for (0 => int i; i < flutes.cap(); i++) {
    fluteMelody[imelody][ipitch][t % mlen] => int pindex;
    notes[pindex] => int midin;
    if (i == 0) Math.mtof(midin) => flutes[i].freq;
    else if (i == 1) Math.mtof(midin + 3) => flutes[i].freq;
    else {
      if (t % 4 == 0) Math.mtof(midin + 7) => flutes[i].freq;
      else Math.mtof(midin - 4) => flutes[i].freq;
    }
  }
  
  for (0 => int i; i < flutes.cap(); i++) {
    fluteMelody[imelody][igain][t % mlen] / 9.0 => float baseg;
    Math.random2f(0.2, 0.9) * baseg => flutes[i].gain;
  }
  for (0 => int j; j < shakers.cap(); j++) {
    beat[n][t % mlen]  / 9.0 * 1.0 => shakers[j].gain;
    beat1[n][t % mlen] / 9.0 * 1.0 => shakers1[j].gain;
    Math.random2f(100, 200) => shakers[j].freq;
    Math.random2(0, 10) => float del;
    del::ms => now;
    1.0 => shakers[j].noteOn;
    1.0 => shakers1[j].noteOn;
  }
  
  for (0 => int i; i < flutes.cap(); i++) {
    1.0 => flutes[i].noteOn;
  }
  5 * lunit => now;
  for (0 => int i; i < flutes.cap(); i++) {
    1.0 => flutes[i].noteOff;
  }
  lunit => now;
  for (0 => int j; j < shakers.cap(); j++) {
    1.0 => shakers[j].noteOff;
    1.0 => shakers1[j].noteOff;
  }
  if (t % 8 == 0) (imelody + 1) % fluteMelody.cap() => imelody;
  if (t % 8 == 0) (n + 1) % beat.cap() => n;
  t++;
} 



