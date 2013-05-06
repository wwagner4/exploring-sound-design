500::ms => dur T;

2::second => dur patchDuration; 
if (me.args() > 0) {
   Std.atoi(me.arg(0))::second => patchDuration; 
}
<<<"patchDuration", patchDuration>>>;

T - (now % T) => now;

now + patchDuration => time stopTime;
while (now < stopTime) {
  <<<"hallo">>>;
  1::T => now;
}
stopTime + 1::T => now;
  <<<"stopped">>>;
