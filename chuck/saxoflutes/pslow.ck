// percussion patch 1. slow

0.5::second => dur T;

fun void shell(int id) {
   Shakers shk => dac;
   id => shk.which;
   Math.random2(5, 15) => int times;
   for (0 => int i; i < times; i++) {
      1.0 => shk.noteOn;
      2.0::T => now;
      1.0 => shk.noteOff;

      1.0 => shk.noteOn;
      2.0::T => now;
      1.0 => shk.noteOff;

      1.0 => shk.noteOn;
      1.0::T => now;
      1.0 => shk.noteOff;

   }
}
[ 6, 12, 7  ] @=> int ids[];

T - (now % T) => now;

<<<"slow 1/4">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
10.0::T => now;

<<<"slow 2/4">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
10.5::T => now;

<<<"slow 3/4">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
10.5::T => now;

<<<"slow 4/4">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
100::T => now;


