// Another tryout
//[50, 52, 53, 55, 57, 59, 60, 62] @=> int ddorian[];
TriOsc s => Pan2 p => dac;
TriOsc s2 => Pan2 p2 => dac;

-1 => p.pan;
1 => p2.pan;

Std.mtof(50) * 2 => float f2;
f2 => s2.freq;

0.2 => float g2;

0.5 => float g;


[52, 53, 57, 52, 53, 57, 59, 62, 57, 59, 62] @=> int ddorian[];
[50, 60, 55] @=> int bg[];
[4, 1, 1, 1] @=> int dur[];

now + 10::second => time end;
0 => int k;
while (now < end) {
  Math.random2(200, 400) => int du;
  bg[k%bg.cap()] => int b;
  <<< "b", b >>>;
  Std.mtof(b) / 2 => float f2;
  f2 => s2.freq;
  g => s.gain;
  g2 => s2.gain;
  0 => int j;
  for (0 => int i; i < 8; i++) {
    Std.mtof(ddorian[i%ddorian.cap()]) => float f;
    f => s.freq;
    du * dur[j%dur.cap()]::ms => now;
    j++;
  }
  for (0 => int i; i < 8; i++) {
    Std.mtof(ddorian[i%ddorian.cap()]) => float f;
    f => s.freq;
    du * dur[j%dur.cap()]::ms => now;
    j++;
  }
  k++;
}
