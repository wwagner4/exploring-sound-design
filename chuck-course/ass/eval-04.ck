// Assignment 3 sorry I didn't have time to work on this more!
// sound chain with use of SndBuf 
Gain master => dac; 

SndBuf kick => master; 
SndBuf hihat => master;
SndBuf snare => master; 
SndBuf clap => master; 
SndBuf stereo => master; 
SndBuf click => master; 

string click_samples[3];

me.dir() + "/audio/click_05.wav" => click_samples[0]; 
me.dir() + "/audio/click_04.wav" => click_samples[1]; 
me.dir() + "/audio/click_03.wav" => click_samples[2]; 


// set volume of master  
.6 => master.gain;

// load sound files into sndbuf 
me.dir() + "/audio/kick_01.wav" => kick.read; 
me.dir() + "/audio/hihat_03.wav" => hihat.read; 
me.dir() + "/audio/snare_01.wav" => snare.read; 
me.dir() + "/audio/clap_01.wav" => clap.read; 
me.dir() + "/audio/stereo_fx_03.wav" => stereo.read; 


// set all playheads to end so no sound is made 
kick.samples() => kick.pos; //kick.samples puts it in last position
hihat.samples() => hihat.pos; 
snare.samples() => snare.pos; 
clap.samples() => clap.pos; 
stereo.samples() => stereo.pos; 



//initialize counter variable 
0 => int counter; 

// infinite loop
while( true ) 
{
    // beat goes from 0 t0 7, 8 positions 
    counter % 8 => int beat;    
    
    // bass drum on 0 and 3. Example of an if statement 
    if (( beat == 0 ) || (beat == 3))
    {
        0 => kick.pos;
    }
    
    // snare drum on 2 and 6 
 if ((beat ==2 ) || (beat ==6)) 
 {
     0 =>snare.pos;
 }
 
if (( beat == 1 ) || ( beat == 3 ))
{
  0 => hihat.pos; 
  .2 => hihat.gain;
}

if (( beat == 6) || (beat == 7)) 
{
0 => clap.pos; 
}

if ( beat <= 4)
{
    0=> stereo.pos;
    // use of negative .rate on SndBuf for reverse stereo effect. Also example of random number generator
    Math.random2f(-1,2) => stereo.rate; 
}

 <<< "Counter: ", counter, "Beat: ", beat >>>; 
 counter++; // counter +1 => counter

250::ms => now; 

} 



