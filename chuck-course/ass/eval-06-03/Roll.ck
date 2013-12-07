//
// Assignment_6_Annoying_Parade: Roll.ck
//
// Supplies a crude (and slightly annoying) drum roll.

// Time calculation constants.
625::ms => dur beat;

// Setup for the sound chain and voice/effect parameters.
SndBuf snare => dac;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;
snare.samples() => snare.pos;

// Recursive function to to produce a 'tightening' snare roll.  Just play it once.
roll(60);

fun void roll(int count) {
    if(count > 30) {
        (1 + ((50 - count) * 0.00001)) => float increment;
        0.030 * (60 - count) => snare.gain;
        2000 => snare.pos;
        Math.random2f(1.0, 1.10) * increment => snare.rate;
        count::ms => now;
        roll(count - 1);
    }
}
