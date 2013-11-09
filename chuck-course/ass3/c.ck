SndBuf kick => dac;
SndBuf hihat => dac;

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/hihat_04.wav" => hihat.read;

kick.samples() => kick.pos;
hihat.samples() => hihat.pos;

0 => int t;
while(true) {
    if (t % 4 == 0) {
        0 => kick.pos;
    }
    if (t % 1 == 0) {
        0 => hihat.pos;
    }
    400::ms => now;
    t++;
}