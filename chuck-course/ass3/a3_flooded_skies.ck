
// Assignment 3: flooded skies

// the song is played back with 128 bpm => 64 beats in 30 seconds
// every beat is divided in two eighth notes giving in sum 64*2=128 notes
// the song is organized in 8 blocks each lasting 8 beats (=2 pulses)

(30.0/64.0)::second => dur quarter;
.5::quarter => dur eighth;

<<< "duration of an eighth in seconds:", eighth/44100.0 >>>;
<<< "128 eighths in seconds:", 128*(eighth/44100.0) >>>;

// Unit Generators
Gain mixer => dac;
SndBuf kick => mixer;
SndBuf shortkick => mixer;
SndBuf basskick => mixer;
SndBuf snare => mixer;
SndBuf hihat => mixer;
SndBuf click => mixer;
SndBuf clap => mixer;
SinOsc tone1 => mixer;
SinOsc tone2 => mixer;

// load soundfiles
me.dir() + "/audio" => string audiodir;
audiodir + "/kick_02.wav" => kick.read;
audiodir + "/kick_03.wav" => shortkick.read;
audiodir + "/kick_04.wav" => basskick.read;
audiodir + "/snare_01.wav" => snare.read;
audiodir + "/hihat_01.wav" => hihat.read;
audiodir + "/click_02.wav" => click.read;
audiodir + "/clap_01.wav" => clap.read;

// at start set them all off
kick.samples() => kick.pos;
shortkick.samples() => shortkick.pos;
basskick.samples() => basskick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
click.samples() => click.pos;
clap.samples() => clap.pos;
0 => tone1.gain;
0 => tone2.gain;

// set the gain and some settings
0.6 => mixer.gain;
1 => kick.gain;
1 => basskick.gain;
1 => shortkick.gain;
0.4 => snare.gain;
1.5 => click.rate;
//1.6 => click3.rate;

for (0 => int noteOfSong; noteOfSong < 128; noteOfSong++) {

    noteOfSong%8 + 1 => int note;       // eighth note per pulse
    (noteOfSong%8/2) + 1 => int beat;   // beat (=quarter note) per pulse
    noteOfSong%2 + 1 => int eighthOfBeat;   // eighth of beat (1 or 2)
    noteOfSong/16 + 1 => int block;
    noteOfSong%16 + 1 => int noteOfBlock;   // eighth note per block
    <<< "noteOfSong", noteOfSong, "note", note, "beat", beat, "eighthOfBeat", eighthOfBeat, "block", block >>>;
    
    // kick (on quarters)
    if (block <= 5) {
        if (eighthOfBeat == 1) 0 => kick.pos;
    }
    if (block >= 7) {
        if (eighthOfBeat == 1) 0 => basskick.pos;
    }

    // short kick
    if (block <= 3) {
        if (note == 2) 0 => shortkick.pos;
    }
    else {
        if (note == 2 || note == 3 || note == 6) 0 => shortkick.pos;
    }
    
    // snare
    if (block <= 3 || block >= 7) {
        if (note == 7 || note == 8)
            0 => snare.pos;
    }

    // click & clap
    if (block >= 4 && block <= 6) {
        if (note == 1) 1 => click.loop;
        if (note == 3) 0 => click.loop;
            
        if (note == 6) 0 => clap.pos;
        if (note == 8) 0 => clap.pos;
    }
    
    // two-tones
    if (noteOfBlock == 1) {
        if (block >= 2 && block <= 6) {
            0.02 => tone1.gain;
            0.02 => tone2.gain;
            if (block == 2 || block == 5 || block == 6) {
                Std.mtof(57) => tone1.freq;
                Std.mtof(60) => tone2.freq;
            }
            else {
                Std.mtof(64) => tone1.freq;
                Std.mtof(67) => tone2.freq;
            }
        }
        else {
            0 => tone1.gain;
            0 => tone2.gain;
        }
    }
    
    eighth => now;
}
