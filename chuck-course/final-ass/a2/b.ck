
[0, 2, 4, 7, 9] @=> int notes[];

38 => int base;
Conf c;


fun int n(int nindex) {return base + notes[nindex];}
fun float g(int igain) {return igain / 9.0;}
fun dur d(int idur) {return c.unit * idur;}

fun void pause(int n) {n * c.unit => now;}

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
  ugen.play(n(0), d(4), g(5));

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
fun void m3(W ugen) {
  s3(ugen);
  s3(ugen);
  s3(ugen);
  s3(ugen);
  s4(ugen);
  s3(ugen);
  s4(ugen);
  s3(ugen);
}

Gain master => dac;
fun void main(W ugen) {
  m3(ugen);
  m3(ugen);
  m3(ugen);
  m3(ugen);
  m3(ugen);
  m3(ugen);
  m3(ugen);
}


W2 w2 => master;

0.1 => w2.mix;
30.0 => w2.Q;
10 => w2.filterOffsetMidi;
9.0 => w2.masterGain; 

0.003 => w2.attack;
0.4 => w2.decay;
0.05 => w2.sustain;
0.5 => w2.release;

main(w2);

1500::ms  => now;

