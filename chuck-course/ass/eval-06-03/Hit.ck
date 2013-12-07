//
// Assignment_6_Annoying_Parade: Hit.ck
//
// Supplies a kick/crash combination.

// Time calculation constants.
625::ms => dur beat;

// Setup for the sound chain and voice/effect parameters.
SndBuf kick => dac;
SndBuf crash => dac;
me.dir(-1) + "/audio/kick_03.wav" => kick.read;
me.dir(-1) + "/audio/hihat_04.wav" => crash.read;

// Just play it once.
0.50 => kick.gain;
0.80 => kick.rate;
0.50 => crash.gain;
0.92 => crash.rate;
0 => kick.pos;
0 => crash.pos;
beat * 2 => now;
