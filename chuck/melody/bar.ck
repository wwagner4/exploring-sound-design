// point of attack for random otf demo

[ 0, 4, 9, 4, 0 ] @=> int hi[];

fun void pitch(int midi) {
  SinOsc s => ADSR e => dac;
  e.set( 100::ms, 80::ms, .5, 500::ms );
  .2 => s.gain;
  s.freq(Math.mtof(midi));
  e.keyOn();
  1500::ms => now;
  e.keyOff();
  500::ms => now;
}


while( true ) {
  for(0 => int j; j < 12; j + 3 => j) {
    for(0 => int i; i < hi.cap(); i++) {
      55 + j + hi[i] => int midi;
      <<<"midi", midi>>>;
      spork ~ pitch(midi);
      200::ms => now;
    }
  }

