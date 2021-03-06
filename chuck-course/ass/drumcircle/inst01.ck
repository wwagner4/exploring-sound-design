// Assignment_7_marching_flutes_retreat

// A flute playing the notes up and down


// Setup sound chain
TriOsc s => ADSR e => NRev rev => Gain master => dac;

// Define some global values
50 => int tlen;
0.05 => float maxGain;
0.1 => rev.mix;
4 => int upmode;
6 => int downmode;
1 => int isdirup;

// Instantiate a BPM class
Bpm bpm;

// Configure the envelope
e.set( 25::ms, 8::ms, .9, 15::ms);

// Create a notes object
Notes n;

// Exchange up- and downmode
fun void exchangeMode() {
  upmode => int tmp;
  downmode => upmode;
  tmp => downmode;
  //<<< "exch", upmode, downmode >>>;
}

// Calculate some overall envelope for the melody
fun float gainTrend(int t, int tlen) {
  float re;
  tlen / 4.0 => float t1;
  tlen * 3.0 / 4.0 => float t2;
  // attack
  if (t <= t1) {
    maxGain / 2.0 / t1 => float k;
    maxGain / 2.0 => float a;
    t * k + a => float g;
    g => re;
  }
  // sustain
  else if (t <= t2) maxGain => re;
  // release
  else {
    - maxGain / (tlen - t2) => float k;
    - k * tlen => float a;
    t * k + a => float g;
    g => re;
  }
  return re;
}

// Play one note
// t: the time elapsed as integer
// durIndex: The duration of the note as index of possible durations
fun void playNote(int t, int durIndex) {
  gainTrend(t, tlen) => master.gain;
  if (isdirup == 1) n.freq(n.cap() - t % n.cap()) => s.freq;
  else n.freq(t % n.cap()) => s.freq;
  e.keyOn();
  //<<< "bpm.dur(0)", bpm.dur(0) / ms >>>; 
  bpm.dur(durIndex) * 0.7 => now;
  e.keyOff();
  bpm.dur(durIndex) * 0.3 => now;
  // Descide to go one octave up or down
  if (t % upmode == 0 && t % downmode == 0); // nothing to do
  else if (t % upmode == 0 ) n.octup();
  else if (t % downmode == 0 ) n.octdown();
  if (t % 20 == 0) exchangeMode();
  if (t % 30 == 0) {
    (isdirup + 1) % 2 => isdirup;
    //<<< "change dir",  isdirup >>>;
  }
}


// The melody
0 => int t;
while (t < tlen) {
  playNote(t, 0); t++;
  playNote(t, 0); t++;

  playNote(t, 0); t++;
  playNote(t, 1); t++;
  playNote(t, 1); t++;

  playNote(t, 0); t++;
  playNote(t, 0); t++;

  playNote(t, 0); t++;
  playNote(t, 1); t++;
  playNote(t, 1); t++;

  playNote(t, 1); t++;
  playNote(t, 2); t++;
  playNote(t, 2); t++;
  playNote(t, 0); t++;

  playNote(t, 1); t++;
  playNote(t, 2); t++;
  playNote(t, 2); t++;
  playNote(t, 0); t++;

  playNote(t, 1); t++;
  playNote(t, 2); t++;
  playNote(t, 2); t++;
  playNote(t, 0); t++;

  playNote(t, 1); t++;
  playNote(t, 2); t++;
  playNote(t, 2); t++;
  playNote(t, 0); t++;

}
1000::ms => now;
<<< "stop", "inst01" >>>;
