<<< "Assignment 3 : TechnoPrisoners" >>>;

// sound chain
Gain master => dac;
SndBuf kick => master;
SndBuf kick_rev => master;
SndBuf hihat => Pan2 hihat_p => dac;
SndBuf snare => master;
SndBuf clap => master;
SndBuf clicks => master;
TriOsc s => master;  // sound network

0.1 => s.gain;  // adjust volume of osc

[50, 52, 53, 55, 57, 59, 60, 62] @=> int notes[];  // instantiate array for notes

// array of strings
string click_samples[5];

// load array with file paths
me.dir() + "/audio/click_01.wav" => click_samples[0];
me.dir() + "/audio/click_02.wav" => click_samples[1];
me.dir() + "/audio/click_03.wav" => click_samples[2];
me.dir() + "/audio/click_04.wav" => click_samples[3];
me.dir() + "/audio/click_05.wav" => click_samples[4];

// load samples
me.dir() + "/audio/kick_05.wav" => kick.read;
me.dir() + "/audio/kick_02.wav" => kick_rev.read;
me.dir() + "/audio/hihat_03.wav" => hihat.read;
me.dir() + "/audio/snare_03.wav" => snare.read;
me.dir() + "/audio/clap_01.wav" => clap.read;

// set all playheads to end so no sound is made
kick.samples() => kick.pos;
kick_rev.samples() => kick_rev.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos;
clap.samples() => clap.pos;
clicks.samples() => clicks.pos;

now + 30::second => time later;  // set duration of composition

0 => int counter; // initialize counter
2 => int repeatCount;  // number of times sequence should repeat
0 => int offset;  // instantiate note offset

[1, 0, 0, 1, 0, 1, 0, 0] @=> int kick_seq[];

[1, 1, 1, 1, 1, 1, 1, 1] @=> int fill[];

while ( now < later )
{    
    // get random note from notes array and put in seq array
    [ notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ],
      notes[ Math.random2(1, notes.cap()) - 1 ]
    ] @=> int seq[];

    for ( 0 => int i; i < seq.cap(); i++)  // iterate through seq array
    {
        Std.mtof( seq[i] + offset - 12 ) => s.freq;  // convert midi note to frequency and assign it to osc
    }
    1 +=> counter;  // increment counter
    
    Math.random2( -12, 12) => offset;  // get random number for note offset


    if ( kick_seq[counter % 8] == 1 )  // iterate through kick_seq and trigger when 1
    {
        1.0 => kick.rate;
        
        if ( counter % 8 == 0 )  // check if first beat
        {
            0.7 => kick.gain;  // full accented kick
        }
        else
        {
            0.4 => kick.gain;  // normal volume kick
        }
        
        if ( counter % 8 == 5 )  // check if 3rd beat
        {
            0.6 => kick.gain;
            0.4 => kick.rate;  // lower pitch
        }
        0 => kick.pos;
    }
    
    if ( counter % 8 == 6 )  // check if 3rd beat
    {
        if ( Math.random2f(0.0, 1.0) < 0.25 )  // play 25% of the time
        {
            -0.8 => kick_rev.rate;
            0.5 => kick_rev.gain;
            kick_rev.samples() - 50 => kick_rev.pos;
        }
    }
    
    if ( Math.random2f(0.0, 1.0) < 0.75 )  // play 75% of the time
    {
        Math.random2(0, click_samples.cap() - 1) => int which;
        click_samples[which] => clicks.read;
        Math.random2f(0.1, 0.5) => clicks.gain;
        Math.random2f(0.3, 1.25) => clicks.rate;
        0 => clicks.pos;
    }
    
    if ( ( counter % 4 == 1 ) || ( counter % 4 == 3 ) )
    {
        0.1 => hihat.gain;
        Math.random2f(0.9, 1.1) => hihat.rate;
        Math.random2f(-1.0, 1.0) => hihat_p.pan;
        0 => hihat.pos;
    }
    
    if ( counter % 4 == 2 )
    {
        0.5 => clap.gain;
        0 => clap.pos;
    }
    
    .25::second => now; // advance time
    counter++; // increment counter
}