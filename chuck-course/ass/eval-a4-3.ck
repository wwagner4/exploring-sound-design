//Assignment_4_Functioning-pong
//16.11.2013

//sound chain

.1 => dac.gain;

//drums
SndBuf kick01 => dac;
SndBuf snare01 => Pan2 snare01pan => dac;
SndBuf hihat01 => Pan2 hihat01pan => dac;
SndBuf hihat02 => Pan2 hihat02pan => dac;
SndBuf click01 => Pan2 click01pan => dac;
SndBuf clap01 => Pan2 clap01pan => dac;
SndBuf cowbell01 => Pan2 cowbell01pan => dac;

//three oscillators in stereo
SqrOsc sqr01 => Pan2 sqr01pan => dac;
SqrOsc sqr02 => Pan2 sqr02pan => dac;
SqrOsc sqr03 => Pan2 sqr03pan => dac;

//setting gain of oscillators
.035 => sqr01.gain;
.035 => sqr02.gain;
.035 => sqr03.gain;

//settin panning for Oscillators
0 => sqr01pan.pan;
-1 => sqr02pan.pan;
1 => sqr03pan.pan;

//load the sound files for the drums
me.dir() + "/audio/kick_05.wav" => kick01.read;
me.dir() + "/audio/snare_01.wav" => snare01.read;
me.dir() + "/audio/hihat_02.wav" => hihat01.read;
me.dir() + "/audio/hihat_01.wav" => hihat02.read;
me.dir() + "/audio/click_01.wav" => click01.read;
me.dir() + "/audio/clap_01.wav" => clap01.read;
me.dir() + "/audio/cowbell_01.wav" => cowbell01.read;

//set playheads to end to avoid play at beginning
kick01.samples() => kick01.pos;
snare01.samples() => snare01.pos;
hihat01.samples() => hihat01.pos;
hihat02.samples() => hihat02.pos;
click01.samples() => click01.pos;
clap01.samples() => clap01.pos;
cowbell01.samples() => cowbell01.pos;

//setting fixed rates
1.35 => kick01.rate;
1.55 => snare01.rate;
1.35 => hihat01.rate;
1.35 => hihat02.rate;

//setting volumes
.5 => kick01.gain;
.9 => snare01.gain;
.3 => hihat01.gain;
.2 => hihat02.gain;
.6 => click01.gain;
.5 => clap01.gain;
.15 => cowbell01.gain;

//setting positions
.2 => snare01pan.pan;
.6 => hihat01pan.pan;
-.8 => hihat02pan.pan;
.8 => click01pan.pan;
-.4 => clap01pan.pan;
-.4 => cowbell01pan.pan;

//drum patterns as logical variables
//kick patterns
[0,0,0,0,0,0,0,0] @=> int kick01_ptrn00[];
[1,0,0,0,1,0,0,0] @=> int kick01_ptrn01[];
[1,1,0,0,1,0,0,0] @=> int kick01_ptrn02[];
[1,0,0,1,1,0,0,0] @=> int kick01_ptrn03[];
[1,0,0,0,1,0,1,1] @=> int kick01_ptrn04[];

//snare patterns
[0,0,0,0,0,0,0,0] @=> int snare01_ptrn00[];
[0,0,1,0,0,0,1,0] @=> int snare01_ptrn01[];
[0,0,1,0,0,0,1,1] @=> int snare01_ptrn02[];
[0,1,1,0,0,1,1,1] @=> int snare01_ptrn03[];

//hihat01 patterns
[0,0,0,0,0,0,0,0] @=> int hihat01_ptrn00[];
[0,1,0,1,0,1,0,1] @=> int hihat01_ptrn01[];
[0,1,1,1,0,1,0,1] @=> int hihat01_ptrn02[];

//hihat02 patterns
[0,0,0,0,0,0,0,0] @=> int hihat02_ptrn00[];
[1,1,1,1,1,1,1,1] @=> int hihat02_ptrn01[];
[1,1,0,1,1,1,1,0] @=> int hihat02_ptrn02[];

//clik01 patterns
[0,0,0,0,0,0,0,0] @=> int click01_ptrn00[];
[0,0,1,1,0,0,1,0] @=> int click01_ptrn01[];
[1,0,1,1,1,0,1,0] @=> int click01_ptrn02[];

//clap01 patterns
[0,0,0,0,0,0,0,0] @=> int clap01_ptrn00[];
[0,0,0,0,0,0,1,0] @=> int clap01_ptrn01[];
[0,0,0,0,0,0,1,1] @=> int clap01_ptrn02[];

//cowbell01 patterns
[0,0,0,0,0,0,0,0] @=> int cowbell01_ptrn00[];
[1,1,0,1,0,0,0,0] @=> int cowbell01_ptrn01[];
[1,0,1,1,0,1,0,0] @=> int cowbell01_ptrn02[];

//global array of notes to play
[51, 53, 55, 56, 58, 60, 61, 63] @=> int notes[];

//patterns for oscillators
[notes[0], notes[7], notes[1], notes[6], notes[2], notes[5], notes[3], notes[4]] @=> int osc_ptrn01[];

//function to play pattern arrays
fun void section(int kick01A[], int snare01A[], int hihat01A[], int hihat02A[], int click01A[], int clap01A[], int cowbell01A[], int sqr01A[], float beattime)
{
    for (0 => int i; i < kick01A.cap(); i++)
    {
        if (kick01A[i])
        {
            0 => kick01.pos;
        }
        if (snare01A[i])
        {
            0 => snare01.pos;
        }
        if (hihat01A[i])
        {
            0 => hihat01.pos;
        }
        if (hihat02A[i])
        {
            0 => hihat02.pos;
        }
        if (click01A[i])
        {
            0 => click01.pos;
            Math.random2f(1.25,1.45) => click01.rate; //small variation in click01 rate
        }
        if (clap01A[i])
        {
            0 => clap01.pos;
            Math.random2f(1.15,1.25) => clap01.rate; //variation in clap01 rate
        }
        if (cowbell01A[i])
        {
            0 => cowbell01.pos;
            Math.random2f(1.15,1.25) => cowbell01.rate; //variation in clap01 rate
        }
        if (sqr01A[i])
        {
            Std.mtof(osc_ptrn01[i]) => sqr01.freq;
            octave(osc_ptrn01[i]) => sqr02.freq;
            fifth(osc_ptrn01[i]) => sqr03.freq;
        }
        
        beattime::second/2.5 => now;
    }
}

//functions for octave and fifth
fun float octave( float originalFreq )
{
    return 2.0*originalFreq;
}

fun float fifth( float originalFreq )
{
    return 1.5*originalFreq;
}

//function for printing text
fun void printer(string text)
{
    <<< text >>>;
}


//MAIN PROGRAM
for (0 => int i; i < notes.cap()/4; i++)
    {        
        section(kick01_ptrn00, snare01_ptrn00, hihat01_ptrn00, hihat02_ptrn00, click01_ptrn01, clap01_ptrn01, cowbell01_ptrn00, osc_ptrn01, 0.6);
        section(kick01_ptrn00, snare01_ptrn00, hihat01_ptrn00, hihat02_ptrn00, click01_ptrn02, clap01_ptrn01, cowbell01_ptrn00, osc_ptrn01, 0.6);
        section(kick01_ptrn00, snare01_ptrn00, hihat01_ptrn01, hihat02_ptrn01, click01_ptrn01, clap01_ptrn01, cowbell01_ptrn01, osc_ptrn01, 0.6);
        section(kick01_ptrn00, snare01_ptrn00, hihat01_ptrn02, hihat02_ptrn02, click01_ptrn02, clap01_ptrn02, cowbell01_ptrn02, osc_ptrn01, 0.6);
        section(kick01_ptrn01, snare01_ptrn01, hihat01_ptrn01, hihat02_ptrn01, click01_ptrn01, clap01_ptrn01, cowbell01_ptrn01, osc_ptrn01, 0.6);
        section(kick01_ptrn02, snare01_ptrn02, hihat01_ptrn02, hihat02_ptrn02, click01_ptrn02, clap01_ptrn01, cowbell01_ptrn01, osc_ptrn01, 0.6);
        section(kick01_ptrn03, snare01_ptrn01, hihat01_ptrn01, hihat02_ptrn01, click01_ptrn01, clap01_ptrn01, cowbell01_ptrn01, osc_ptrn01, 0.6);
        section(kick01_ptrn04, snare01_ptrn03, hihat01_ptrn02, hihat02_ptrn02, click01_ptrn02, clap01_ptrn02, cowbell01_ptrn02, osc_ptrn01, 0.6);
        printer("Cha cha cha!");
    }
    
 //...got lost, got sleepy, ran out of time.