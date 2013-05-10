// Chuck usage: eg. bar1.ck:75:100


90 => int bpm; // speed of patch in beats per minute
if (me.args() > 0) {
   Std.atoi(me.arg(0)) => bpm;
}
60000 / bpm => int speed;
   
speed::ms => dur T;

5 => int dura; // Duration of patch in seconds
if (me.args() > 1) {
   Std.atoi(me.arg(1)) => dura;
}
1::second => dur oneSec;
oneSec * dura => dur durb;

2 => int base; // Bases
if (me.args() > 2) {
   Std.atoi(me.arg(2)) => base;
}

<<<"start >>> bpm", bpm, "dura", dura, "s", base, "base">>>;

[ 0, 4, 9] @=> int hi[];

[[ 36, 38, 40],
[ 40, 42, 50, 52],
[ 48, 50, 59, 62],
[ 66, 66, 68, 68],
[ 70, 70, 73, 73, 77, 77, 77]] @=> int bbases[][];

bbases[base] @=> int bases[];

fun void pitch(int midi) {
  SinOsc s => ADSR e => dac;
  e.set( 5::ms, 300::ms, .5, 2::T );
  0.1 => s.gain;
  Math.random2f(0.0, 1.0) => float r1;
  //0.0 => float r1;
  s.freq(Math.mtof(midi) + r1);
  e.keyOn();
  1::T => now;
  e.keyOff();
  6::T => now;
}


fun void doit(int base, int j) {
   0 => int off; 
   (Std.randf() + 1.0) / 2.0 => float r;
   //<<<"r", r>>>;
   if (r > 0.95) {
      -1 => off; 
      <<<"atonal", "">>>;
   } 
   Math.random2(0, hi.cap() - 1) => int i;
   base + j + hi[i] + off => int midi;
   //<<<"midi", midi>>>;
   spork ~ pitch(midi);
   1::T => now;
}


T - (now % T) => now;

now + durb => time stop;

while(now < stop) {
  Math.random2(0, bases.cap() - 1) => int i;
  bases[i] => int base;
  doit(base, 0);
}
7::T => now;
<<<"end <<<", "">>>;
