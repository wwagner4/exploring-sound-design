// Assignment 3

Gain g => dac;
0.5 => g.gain;

SndBuf kick => g;
0.9 => kick.gain;
me.dir() + "/audio/kick_01.wav" => kick.read;
kick.samples() => kick.pos;

SndBuf kick1 => g;
0.6 => kick1.gain;
me.dir() + "/audio/kick_05.wav" => kick1.read;
kick1.samples() => kick1.pos;

SndBuf click => g;
0.7 => click.gain;
me.dir() + "/audio/click_01.wav" => click.read;
kick.samples() => kick.pos;

SndBuf hihat => g;
0.1 => hihat.gain;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
hihat.samples() => hihat.pos;

SndBuf2 chill1 => g;
0.3 => chill1.gain;
me.dir() + "/audio/stereo_fx_03.wav" => chill1.read;
chill1.samples() => chill1.pos;

SndBuf2 chill2 => g;
0.3 => chill2.gain;
me.dir() + "/audio/stereo_fx_03.wav" => chill2.read;
chill2.samples() => chill2.pos;
0.8 => chill2.rate;

SndBuf2 chill3 => g;
0.5 => chill3.gain;
me.dir() + "/audio/stereo_fx_03.wav" => chill3.read;
chill3.samples() => chill3.pos;
1.2 => chill2.rate;

0 => int t;
now + 30::second => time end;
while(now < end) {
    <<< "t =", t >>>;	

    // ------- hihat ---------
    if (t % 2 == 0) {
        0 => hihat.pos;
    }
    
    // ------- kick ---------
    if ((t <= 80) || (t >= 100)) {
	    if (t % 4 == 0 && t >= 8 && t <= 130) {
		0 => kick.pos;
	    }
	    if (t % 2 == 0 && t >= 60 && t <= 100) {
		0 => kick.pos;
	    }
	    if (t % 8 == 1 && ((t >= 20 && t <= 60) || (t >= 90 && t <= 140))) {
		0 => kick1.pos;
	    }
     }
    
    // -------- click ------------
    if (t % 4 == 1 || 
       (t >= 10 && t <= 20) || 
       (t >= 80 && t <= 100)) {
       0 => click.pos;
    }
    
    // ------- stereo ---------
    if (t == 4 || t == 48 || t == 80) {
        0 => chill2.pos;
    }    
    if (t == 24) {
        0 => chill1.pos;
    }    
    if (t == 110) {
        0 => chill1.pos;
    }    

    // --------------------------
    200::ms => now;
    t++;
}
<<< "finished" >>>;