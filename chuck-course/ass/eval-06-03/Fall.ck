//
// Assignment_6_Annoying_Parade: Fall.ck
//
// Supplies the annoying falling sound.

// Time calculation constants.
625::ms => dur beat;

// Setup for the sound chain and voice/effect parameters.
SndBuf slide => JCRev rev => Pan2 pan => dac;
0.3 => rev.mix;
me.dir(-1) + "/audio/stereo_fx_02.wav" => slide.read;

// Run the fall in a separate thread (originally with the intention of doing
// something else at the same time, but I ended up not bothering).
spork ~ fall();
beat * 8 => now;

fun void fall() {
    // Slide the sound down in pitch and across the stereo image.
    0.30 => slide.gain;
    8.86 => slide.rate;
    0 => slide.pos;
    1.0 => pan.pan;
    now + (beat * 3) => time fallEnd;
    while (now < fallEnd) {
        slide.rate() - 0.005 => slide.rate;
        pan.pan() - 0.001 => pan.pan;
        1::ms => now;
    }
    now + (beat * 4) => fallEnd;
    while (now < fallEnd) {
        Std.fabs(slide.gain()) - 0.0010 => slide.gain;
        pan.pan() + 0.01 => pan.pan;
        5::ms => now;
    }
}