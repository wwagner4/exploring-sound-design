
[0, 2, 4, 7, 9] @=> int notes[];

30 => int base;
150::ms => dur u;



fun int n(int nindex) {return base + notes[nindex];}
fun float g(int igain) {return igain / 9.0;}
fun dur d(int idur) {return u * idur;}

fun void pause(int n) {
  n * u => now;
}
fun void s1(W ugen) {
  ugen.play(n(4), d(1), g(4));
  ugen.play(n(4), d(1), g(4));
  pause            (1);
  ugen.play(n(4), d(1), g(4));

  ugen.play(n(3), d(1), g(4));
  pause            (1);
  ugen.play(n(3), d(1), g(5));
  pause            (1);
}
fun void s2(W ugen) {
  ugen.play(n(4), d(1), g(4));
  ugen.play(n(4), d(1), g(5));
  ugen.play(n(4), d(1), g(6));
  ugen.play(n(4), d(1), g(7));

  ugen.play(n(3), d(1), g(7));
  ugen.play(n(3), d(1), g(6));
  ugen.play(n(3), d(1), g(5));
  ugen.play(n(3), d(1), g(4));
}
fun void s3(W ugen) {
  ugen.play(n(2), d(1), g(5));
  pause            (3);

  ugen.play(n(2), d(1), g(3));
  pause            (3);
}
fun void s4(W ugen) {
  ugen.play(n(0), d(2), g(5));
  pause            (2);

  pause            (4);
}
fun void s5(W ugen) {
  ugen.play(n(0), d(1), g(4));
  ugen.play(n(0), d(1), g(5));
  ugen.play(n(0), d(1), g(6));
  ugen.play(n(1), d(1), g(7));

  ugen.play(n(0), d(1), g(7));
  ugen.play(n(0), d(1), g(6));
  ugen.play(n(0), d(1), g(5));
  ugen.play(n(1), d(1), g(4));
}
fun void m1(W ugen) {
  s1(ugen);
  s1(ugen);
  s1(ugen);
  s3(ugen);
  s2(ugen);
  s2(ugen);
  s2(ugen);
  s3(ugen);
}
fun void m2(W ugen) {
  s1(ugen);
  s4(ugen);
  s1(ugen);
  s4(ugen);
  s2(ugen);
  s4(ugen);
  s2(ugen);
  s4(ugen);
}
fun void m3(W1 ugen) {
  s5(ugen);
  s4(ugen);
  s5(ugen);
  s3(ugen);
  s5(ugen);
  s4(ugen);
  s5(ugen);
  s3(ugen);
}

W1 w1 => Gain master => dac;

0.5 => master.gain;
m1(w1);
m2(w1);
0.9 => master.gain;
m3(w1);
m1(w1);
0.5 => master.gain;
m3(w1);
m2(w1);
0.1 => master.gain;
m3(w1);

1500::ms  => now;

