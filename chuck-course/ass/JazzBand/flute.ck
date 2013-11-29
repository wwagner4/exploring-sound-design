// flute.ck
// Insert the title of your piece here

// Part of your composition goes here


Saxofony s1 => dac;
Saxofony s2 => dac;

// our notes
[ 46, 48, 49, 51, 53, 54, 56, 58 ] @=> int notes[];
[3, 7, 5] @=>  int noteIndex[];


0.01 => s1.gain;
0.006 => s2.gain;

fun void playSax(Saxofony s) {
  now => time start;
  while(now < start + 20::second){
      Math.random2(0, noteIndex.cap()-1) => int i;
      Math.mtof(notes[noteIndex[i]]) => s.freq;
      0.6 => s.startBlowing;
      Math.random2(2000, 4000) => int len;
      len::ms => now;
      1.0 => s.stopBlowing;
      Math.random2(100, 500) => len;
      len::ms => now;
  }
}

spork ~ playSax(s1);
10::second => now;
spork ~ playSax(s2);
40000::second => now;
