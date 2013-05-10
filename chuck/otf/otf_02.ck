//----------------------------|
// on-the-fly synchronization
// adapted from Perry's ChucK Drummin' + Ge's sine poops
//
// authors: Perry Cook (prc@cs.princeton.edu)
//          Ge Wang (gewang@cs.princeton.edu)
// --------------------|          
// add one by one into VM (in pretty much any order):
// 
// terminal-1%> chuck --loop
// ---
// terminal-2%> chuck + otf_01.ck
// (anytime later)
// terminal-2%> chuck + otf_02.ck
// (etc...)
//--------------------------------------|

5::second => dur patchDur;
if (me.args() > 0) {
   Std.atoi(me.arg(0))::second => patchDur; 
}


// this synchronizes to period
.5::second => dur T;
T - (now % T) => now;

// construct the patch
SndBuf buf => Gain g => dac;
// read in the file
me.sourceDir() + "/data/hihat.wav" => buf.read;
// set the gain
.25 => g.gain;

// time loop
now => time startTime;
while( now < startTime + patchDur )
{
    // randomize the gain a bit
    Math.random2f(.4,.9) => buf.gain;

    // note: Math.randomf() returns value between 0 and 1
    if( Math.randomf() > 0.875 )
    {
        // set play position to beginning
        0 => buf.pos;
        // advance time
        .5::T => now;
    }
    else
    {
        0 => buf.pos;
        .25::T => now;
        0 => buf.pos;
        .25::T => now;
    }
}
