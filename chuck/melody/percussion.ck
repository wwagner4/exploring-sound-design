// percussion patch 1. slow

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


fun void shell(int id) {
   Shakers shk => dac;
   id => shk.which;
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

[ 6, 12, 7  ] @=> int ids[];

T - (now % T) => now;

now + durb => time stop;
while(now < stop) {
	spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
	T => now;
	spork ~ shell(ids[Math.random2(0, ids.cap()-1)]);
	T => now;
}
<<<"percussion finished">>>;
