
[0, 2, 4, 7, 9] @=> int notes[];

45 => int base;
Conf c;


fun int n(int nindex) {return base + notes[nindex];}
fun float g(int igain) {return igain / 9.0;}
fun dur d(int idur) {return c.unit * idur;}

fun void pause(int n) {n * c.unit => now;}

fun void s1(W ugen) {
  ugen.play(n(2), d(1), g(4));
  ugen.play(n(2), d(1), g(4));
  pause            (1);
  ugen.play(n(2), d(1), g(4));

  ugen.play(n(3), d(1), g(4));
  pause            (1);
  ugen.play(n(3), d(1), g(5));
  pause            (1);
}
fun void s2(W ugen) {
  ugen.play(n(2), d(1), g(4));
  ugen.play(n(2), d(1), g(5));
  ugen.play(n(2), d(1), g(6));
  ugen.play(n(2), d(1), g(7));

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
  pause            (4);
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
  s5(ugen);
  s4(ugen);
  s5(ugen);
  s3(ugen);
  s5(ugen);
  s4(ugen);
  s5(ugen);
  s3(ugen);
}

Gain master => dac;
fun void main(W ugen) {
  m1(ugen);
  m2(ugen);
  m3(ugen);
  m1(ugen);
  m3(ugen);
  m2(ugen);
  m3(ugen);
}


W1 w1 => master;

0.01 => w1.mix;
100.0 => w1.Q;
25 => w1.filterOffsetMidi;
0.1 => w1.masterGain; 

0.3 => w1.attack;
0.3 => w1.decay;
0.7 => w1.sustain;
0.2 => w1.release;

main(w1);

1500::ms  => now;

