// second percussion patch (fast)

0.5::second => dur T;

fun void shell(int id) {
   Shakers shk => dac;
   id => shk.which;
   Math.random2(5, 7) => int times;
   for (0 => int i; i < times; i++) {
      1.0 => shk.noteOn;
      1.0::T => now;
      1.0 => shk.noteOff;

      1.0 => shk.noteOn;
      // this value makes it fast
      0.25::T => now;
      1.0 => shk.noteOff;

      1.0 => shk.noteOn;
      // this value makes it fast
      0.25::T => now;
      1.0 => shk.noteOff;

      1.0 => shk.noteOn;
      0.5::T => now;
      1.0 => shk.noteOff;

   }
}


[ 13, 0, 1, 2 ] @=> int ids[];

T - (now % T) => now;

<<<"fast 1/3">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
5::T => now;
<<<"fast 2/3">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
5.5::T => now;
<<<"fast 3/3">>>;
spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);

20::T => now;


