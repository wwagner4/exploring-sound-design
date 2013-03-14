// Chuck usage: chuck + bar.ck:1 or chuck + bar.ck:2 or chuck + bar.ck:4...

100 => int speed;
if (me.args() > 0) {
   Std.atoi(me.arg(0)) * 100 => speed;
}
<<<"speed", speed>>>;
   
speed::ms => dur T;

[ 0, 5, 9] @=> int hi[];
[ 36, 36, 36, 41, 41, 41, 48, 48, 48, 48, 53, 55] @=> int bases[];


fun void pitch(int midi) {
  TriOsc s => ADSR e => dac;
  e.set( 10::ms, 10::ms, .5, 1::T );
  .1 => s.gain;
  s.freq(Math.mtof(midi));
  e.keyOn();
  1::T => now;
  e.keyOff();
  6::T => now;
}


fun void doit(int base, int k, int j) {
   0 => int off; 
   Std.randf() => float r;
   if (r > 0.9) {
      -1 => off; 
      <<<"atonal">>>;
   } 
   Math.random2(0, hi.cap() - 1) => int i;
   base + j + hi[i] + off => int midi;
   //<<<"midi", midi>>>;
   spork ~ pitch(midi);
   1::T => now;
}


T - (now % T) => now;

for(0 => int k; k < 3; k++) {
  Math.random2(0, bases.cap() - 1) => int i;
  bases[i] => int base;
  for(0 => int j; j < 24; j + 3 => j) {
    doit(base, k, j);
  }
  for(23 => int j; j >= 0; j - 3 => j) {
    doit(base, k, j);
  }
}
2::T => now;
