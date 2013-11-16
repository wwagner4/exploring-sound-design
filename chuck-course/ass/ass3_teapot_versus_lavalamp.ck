// Assignment 3
// Teapot versus Lavalamp

// Setup overall gain
Gain g => dac;
0.7 => g.gain;

// Open files
SndBuf kick => g;
0.5 => kick.gain;
me.dir() + "/audio/kick_01.wav" => kick.read;
kick.samples() => kick.pos;

SndBuf kick1 => g;
0.8 => kick1.gain;
me.dir() + "/audio/kick_04.wav" => kick1.read;
kick1.samples() => kick1.pos;

SndBuf kick2 => g;
0.8 => kick2.gain;
me.dir() + "/audio/kick_02.wav" => kick2.read;
kick2.samples() => kick2.pos;

SndBuf click => g;
0.2 => click.gain;
me.dir() + "/audio/click_01.wav" => click.read;
kick.samples() => kick.pos;

SndBuf click1 => g;
0.2 => click1.gain;
me.dir() + "/audio/click_03.wav" => click1.read;
kick1.samples() => kick1.pos;

SndBuf hihat => g;
0.05 => hihat.gain;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
hihat.samples() => hihat.pos;

SndBuf2 chill1 => g;
0.07 => chill1.gain;
me.dir() + "/audio/stereo_fx_03.wav" => chill1.read;
chill1.samples() => chill1.pos;

SndBuf2 chill2 => g;
0.05 => chill2.gain;
me.dir() + "/audio/stereo_fx_03.wav" => chill2.read;
chill2.samples() => chill2.pos;
0.8 => chill2.rate;

SndBuf2 chill3 => g;
0.07 => chill3.gain;
me.dir() + "/audio/stereo_fx_03.wav" => chill3.read;
chill3.samples() => chill3.pos;
1.2 => chill3.rate;


// Start the main loop
0 => int t;
now + 30::second => time end;
while(now < end) {
    <<< "t =", t >>>;	

    // ------- hihat ---------
    if (t % 2 == 0 && (t <= 80 || t > 100)) {
        0 => hihat.pos;
    }
    
    // ------- kick ---------
    if (t % 4 == 0 && ((t >= 8 && t <= 70) || t >= 100)) {
	0 => kick.pos;
    }
    if (t % 2 == 0 && ((t >= 20 && t <= 80)  || (t >= 100 && t <= 145))) {
	0 => kick.pos;
    }
    if (t % 8 == 1 && ((t >= 20 && t <= 80) || (t >= 100 && t <= 145))) {
	0 => kick1.pos;
    }
    if (t % 4 == 2 && ((t >= 20 && t <= 80) || (t >= 90 && t <= 145))) {
	0 => kick2.pos;
    }
    
    // -------- click ------------
    if (t % 4 == 1 && 
       (t >= 10 && t <= 70) || 
       (t >= 80 && t <= 120)) {
       0 => click.pos;
    }
    
    if ((t >= 15 && t <= 20) || 
       (t >= 70 && t <= 75) || 
       (t >= 80 && t <= 85) || 
       (t >= 100 && t <= 105) || 
       (t >= 110 && t <= 125) ||
       (t > 137)) {
       0 => click1.pos;
    }
    
    // ------- stereo ---------
    if (t == 16) {
        0 => chill1.pos;
    }    
    if (t == 76) {
        0 => chill2.pos;
    }    
    if (t == 104) {
        0 => chill3.pos;
    }    

    // --------------------------
    200::ms => now;
    t++;
}
<<< "", "finished" >>>;