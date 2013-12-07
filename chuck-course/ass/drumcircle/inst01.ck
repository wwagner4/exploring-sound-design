// Instrument one

// Setup sound chain
TriOsc s => ADSR e => NRev rev => Gain master => dac;
0.07 => float maxGain;
0.05 => rev.mix;

e.set( 5::ms, 8::ms, .7, 100::ms);
// Create a notes object
Notes n;
6 => int upmode;
4 => int downmode;
1 => int isdirup;

fun void exchangeMode() {
  upmode => int tmp;
  downmode => upmode;
  tmp => downmode;
  <<< "exch", upmode, downmode >>>;
}

fun float fadeOut(int t) {
  float re;
  if (t < 150) maxGain => re;
  else {
    - maxGain / 50.0 => float k;
    - k * 200.0 => float a;
    t * k + a => float g;
    g => re;
  }
  return re;
}


0 => int t;
repeat (200) {
  fadeOut(t) => master.gain;
  if (isdirup == 1) n.freq(n.cap() - t % n.cap()) => s.freq;
  else n.freq(t % n.cap()) => s.freq;
  e.keyOn();
  100::ms => now;
  e.keyOff();
  100::ms => now;
  if (t % upmode == 0 && t % downmode == 0); // nothing to do
  else if (t % upmode == 0 ) n.octup();
  else if (t % downmode == 0 ) n.octdown();
  if (t % 20 == 0) exchangeMode();
  if (t % 30 == 0) {
    (isdirup + 1) % 2 => isdirup;
     <<< "change dir",  isdirup >>>;
  }
  t++;
}
