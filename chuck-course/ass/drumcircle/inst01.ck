// Instrument one

// Setup sound chain
TriOsc s => ADSR e => NRev rev => Gain master => dac;
0.07 => float maxGain;
0.1 => rev.mix;

// Instantiate a BPM class
Bpm bpm;

// Configure the envelope
e.set( 20::ms, 8::ms, .9, 100::ms);

// Create a notes object
Notes n;

// Some global variables
6 => int upmode;
4 => int downmode;
1 => int isdirup;

// Exchange up- and downmode
fun void exchangeMode() {
  upmode => int tmp;
  downmode => upmode;
  tmp => downmode;
  //<<< "exch", upmode, downmode >>>;
}

fun float gainTrend(int t, int tlen) {
  float re;
  tlen / 4.0 => float t1;
  tlen * 3.0 / 4.0 => float t2;
  if (t <= t1) {
    maxGain / 2.0 / t1 => float k;
    maxGain / 2.0 => float a;
    t * k + a => float g;
    g => re;
  }
  else if (t <= t2) maxGain => re;
  else {
    - maxGain / (tlen - t2) => float k;
    - k * tlen => float a;
    t * k + a => float g;
    g => re;
  }
  return re;
}

100 => int tlen;
0 => int t;
repeat (tlen) {
  gainTrend(t, tlen) => master.gain;
  if (isdirup == 1) n.freq(n.cap() - t % n.cap()) => s.freq;
  else n.freq(t % n.cap()) => s.freq;
  e.keyOn();
  //<<< "bpm.dur(0)", bpm.dur(0) / ms >>>; 
  bpm.dur(0) * 0.7 => now;
  e.keyOff();
  bpm.dur(0) * 0.3 => now;
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
<<< "stop", "inst01" >>>;
