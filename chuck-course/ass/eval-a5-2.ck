/*

Assignment_5_Song_looping_dreams

===============================================================================================================

Please remember you need to save this file in the folder where you have your audio folder (where you saved your homework)  
or you need to copy it and paste it in a file you have previously saved in the folder where you have  your audio folder
(where you saved your homework)
otherwise you won't be able to hear the beat!!!!!
It sounds way better if you use headphones!!!! :D
================================================================================================================*/

// Print title
<<< "Assignment_5_Song_looping_dreams" >>>;

// sound chain
ModalBar vib => NRev r =>  dac;
Mandolin man => NRev manr => Pan2 mp => dac;
SndBuf snare => dac;
SndBuf kick => dac;
SndBuf hihat => dac;
SndBuf2 stereo => dac;



// open sound files
me.dir() + "/audio/hihat_02.wav" => hihat.read;
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/stereo_fx_04.wav" => stereo.read;

// set playheads to end
hihat.samples() => hihat.pos;
kick.samples() => kick.pos;
snare.samples() => snare.pos;
stereo.samples() => stereo.pos;

// set volume
.1 => hihat.gain; 
.5 => kick.gain; 

// global variables
[49, 50, 52, 54, 56, 57, 59, 61] @=> int scale[];
[49, 52, 54, 59,57,52,49] @=> int melo[]; // melody pattern
[49, 52, 56, 59,57,52,49] @=> int melo1[]; // melody one note variation
[49, 52, 56, 59,57,52,49,49, 52,59,57,52,49,49,0] @=> int melo2[]; // extend melody to crate bigger loop
[0,0,0,0,0,0,0,0,0,0,7916,916,27916,27916,27916,27916,27916] @=> int hh2pat[]; // hihat pattern 
[11058,11058,11058,11058,0,11058,11058,11058,11058,1058,058,1000,11058,11058,11058,11058,11058] @=> int snrpat[]; // snare pattern
[ 0,35047,0,35047,35047,35047,35047,35047,0,0,35047,35047,0,5047,35047,35047,35047] @=> int k2pat[]; // kick pattern 
[.01,.01,.01,.01,.01,.01,.01,.01,.02,.03,.04,.05,.05,.04,.03,.02,.01] @=> float cresc[]; // crescendo pattern
[52, 49, 52, 49] @=> int echo[]; // coda

// breakbeat function
fun void breakBeat( float play )
{
    for( 0 => int k; k < 16; k++ )
    {
        // init pattern sequencer
        k % 16 => int beat;
        
        if( (beat==0)||(beat==2)||(beat==4)||(beat==6)||(beat==8)||(beat==10)||(beat==12)||(beat==14))
        { 0 => hihat.pos; }
        if((beat==0))
        { 0 => kick.pos; }
        if((beat==4)||(beat==7)||(beat==10)||(beat==13)||(beat==14)||(beat==15))
        { 0 => snare.pos; }
        play::second => now;
    }
}


//==========================================================================================================================

//MAIN PROGRAM

// play stereo effect
0=> stereo.pos;
.3 => stereo.gain; // set volume
2::second => now; // set time to play before calling funtion

// call function
breakBeat(.1);
breakBeat(.07);
breakBeat(.05);
breakBeat(.03);


// loop to play melody
for( 0 => int i; i < melo.cap(); i++ )
{
    melo[i] => vib.freq; // play with vib
    4 => vib.preset; //set preset
    1 => vib.noteOn; // play the notes
    melo[i]*15 => man.freq; // play with mandolin
    -1 => mp.pan; // pan mandolin
    1 => man.noteOn;  // play the notes
    .75::second => now; // advance time
}

// new sound chain for FM
Gain fmgain => dac;
SinOsc m => SinOsc f => Pan2 fmp => dac;
20 => m.gain; // set modulator gain
.05 =>  f.gain; // set carrier volume
2 => f.sync; // sync
6 => m.freq; // set vibrato frequency

// loop to play melody
for( 0 => int i; i < melo.cap(); i++ )
{
    melo1[i]*15 => f.freq; // play melody  with FM instrument(Theremin)
    Math.sin(now/2::second*2*pi) => fmp.pan; // pan theremin
    melo[i] => vib.freq; // play melody with vib
    4 => vib.preset; // set preset
    1 => vib.noteOn; // play notes
    .75::second => now; // advance time
}

// loop to play coda
for( 0 => int i; i < echo.cap(); i++ )
{
    echo[i]*15 => f.freq; // play coda with theremin
    .75::second => now; // advance time 
  
}

.1 => hihat.gain; // set hihat vol

// loop to play melody and  drum beat
for( 0 => int i; i < cresc.cap(); i++ )
{
    Noise noise => dac; // new sound chain
    cresc[i] => noise.gain; // set volume
    hh2pat[i] => hihat.pos; // play hihat pattern
    snrpat[i] => snare.pos; // play snare pattern
    k2pat[i] => kick.pos; // play kick pattern
    Math.random2f(-1,1) => fmp.pan; // set random values for theremin panning
    melo2[i]*15 => f.freq; // play melody with theremin
    melo2[i] => vib.freq; // play melody with vib
    4 => vib.preset; // set preset
    1 => vib.noteOn; // paly notes 
    .75::second => now; //advance time
}

