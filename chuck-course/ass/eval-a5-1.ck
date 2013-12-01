// Assignment5_shaahin.ck
// shaahin@gmail.com
// I tried to make a gloomy dark atmospheric tune with this assignment
// Enjoy!

string beats[11];
int counter;
int selectedDrum;
int step_to_stop;
Gain master;

SndBuf beat => Pan2 pbeat => NRev rbeat => master;
SndBuf fx => Pan2 pfx => NRev rfx => master;
Flute flute => Pan2 pflute => NRev rflute => master;
master => dac;

// load array of sound addresses
me.dir() + "/audio/snare_01.wav" => beats[0];
me.dir() + "/audio/snare_02.wav" => beats[1];
me.dir() + "/audio/snare_03.wav" => beats[2];
me.dir() + "/audio/kick_03.wav" => beats[3];
me.dir() + "/audio/kick_02.wav" => beats[4];
me.dir() + "/audio/kick_01.wav" => beats[5];
me.dir() + "/audio/hihat_01.wav" => beats[6];
me.dir() + "/audio/hihat_03.wav" => beats[7];
me.dir() + "/audio/stereo_fx_01.wav" => beats[8];
me.dir() + "/audio/click_05.wav" => beats[9];

[ 49, 50, 52, 54, 56, 57, 59, 61 ] @=> int melody[];
[ 1, 2, 1, 1, 1, 2, 1, 3 ] @=> int pattern[];

0.6 => master.gain;
0.15 => flute.gain;
0.5 => beat.gain;
0.1 => rbeat.mix; // reverb
0.3 => rfx.mix; // reverb
0.8 => rflute.mix; // reverb
0.7 => pfx.pan;
-0.5 => pflute.pan;

fun void beatPlayback(int reverse_chance) {   
    // error handling
    if ( reverse_chance < 2 )
        2 => reverse_chance;
    // the higher the value of reverse_chance, the lower the 
    // occurance of a reverse playback
    if ( Math.random2(0, reverse_chance) == 0 ) {
        beat.samples() => beat.pos;
        -1.0 => beat.rate;
    }
    else {
        0 => beat.pos;
        1.0 => beat.rate;
    }
}

fun void instrumentSelector (int instrument_type) {
    if ( instrument_type == 1 ) // kick
        Math.random2(3, 5) => selectedDrum;
    else if ( instrument_type == 2 ) // hihat
        Math.random2(6, 7) => selectedDrum;    
    else if ( instrument_type == 3 ) // snare
        Math.random2(0, 2) => selectedDrum;
    else // error handling
        Math.random2(0, 7) => selectedDrum;
    
    beats[ selectedDrum ] => beat.read;
}

fun void fxPlayback( int key_change_every_x_step ) {
    if (counter % key_change_every_x_step == 0)
    0.5 * Math.random2(1, 2) => fx.rate;
    beats[ 9 ] => fx.read;
}

fun void flutePlayback() {
        Std.mtof( melody [ Math.random2(0, 7) ] ) => flute.freq;
        0.8 => flute.noteOn;  
   
}

// ............
// MAIN program
// ............

now => time starttime;
while ( now - starttime < 30::second ) {
            
    instrumentSelector( pattern[ counter % 8 ] ); // drum randomizer
    beatPlayback(29); // drums playback with 1/30 chance of reverse playback
    fxPlayback(8); // background filler
    if (counter % 8 == 0) { // blow the flute!
        flutePlayback(); 
        Math.random2(2, 5) => step_to_stop;
    }
    if (counter % 8 == step_to_stop) // stop blowing the flute
        1 => flute.noteOff;
    750::ms => now;
    counter++;
}