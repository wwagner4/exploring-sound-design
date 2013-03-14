// Chuck usage: chuck + bar.ck:1 or chuck + bar.ck:2 or chuck + bar.ck:4ls...

100 => int speed;
if (me.args() > 0) {
   Std.atoi(me.arg(0)) * 100 => speed;
}
<<<"speed", speed>>>;
   
speed::ms => dur T;

[ 0, 5, 9] @=> int hi[];
[ 36, 41, 48, 53, 55, 55, 55, 55, 55] @=> int bases[];


fun void pitch(int midi) {
  SinOsc s => ADSR e => dac;
  e.set( 10::ms, 30::ms, .5, 1::T );
  0.1 => s.gain;
  Math.random2f(0.0, 1.0) => float r1;
  s.freq(Math.mtof(midi) + r1);
  e.keyOn();
  1::T => now;
  e.keyOff();
  6::T => now;
}


fun void doit(int base, int j) {
   0 => int off; 
   Std.randf() => float r;
   if (r > 0.5) {
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

for(0 => int k; k < 20; k++) {
  Math.random2(0, bases.cap() - 1) => int i;
  bases[i] => int base;
  doit(base, 0);
}
7::T => now;
