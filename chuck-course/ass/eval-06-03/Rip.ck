//
// Assignment_6_Annoying_Parade: Rip.ck
//
// Supplies the annoying rising sound.

// Time calculation constants.
625::ms => dur beat;

// Setup for the sound chain and voice/effect parameters.
SndBuf slide => JCRev rev => Pan2 pan => dac;
0.3 => rev.mix;
me.dir(-1) + "/audio/stereo_fx_04.wav" => slide.read;

// Run the rip in a separate thread (originally with the intention of doing
// something else at the same time, but I ended up not bothering).
spork ~ rip();
beat * 8 => now;

fun void rip() {
    // Slide the sound up in pitch and across the stereo image.
    0.40 => slide.gain;
    0.10 => slide.rate;
    0 => slide.pos;
    -1.0 => pan.pan;
    now + (beat * 4) => time ripEnd;
    while (now < ripEnd) {
        slide.rate() + 0.003 => slide.rate;
        pan.pan() + 0.001 => pan.pan;
        1::ms => now;
    }
}