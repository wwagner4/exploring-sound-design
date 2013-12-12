// gong.ck
// Assignment 7: Gamelan Again

Gamelan betty;
BPM tempo;

SndBuf gong => dac;
TriOsc lowNote => dac;

me.dir(-1) + "/audio/hihat_04.wav" => gong.read;
.4 => gong.gain;
0.1 => gong.rate;
gong.samples() => gong.pos;

Std.mtof(21) => lowNote.freq;

0 => lowNote.gain;

fun void hitThatGong(int nope){
    0 => gong.pos;
    for (0 => int i; i < 64; i++)
    {
        1.0 - (i * 0.01) => lowNote.gain;
        tempo.thirtysecondNote => now;
    }
    0 => lowNote.gain;
}

while (1) {
    if (betty.lastGong == 0) {
        spork ~ hitThatGong(4);
        12.0*tempo.quarterNote => now;
    }
}
    