<<< "Assignment_4_x85321" >>>;

/* techno track with functions

Composition: First we introduce bass drum,
followed by snare & hi-hat. Then we add low
and high random effect sound. Afterwards the
hi-hat is reversed and sound effect part is
repeated. Finally we bring the beat back and
perform fadeout to complete the track.

TimeCalc: 120 beat times .25s equals 30s.

Have a great day. :)
*/

int count;

// soundchain
Gain master => dac; //master control
SndBuf kick => master;
SndBuf highhat => master;
SndBuf snare => master;
SndBuf stereo => master;

// read files
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/hihat_01.wav" => highhat .read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/stereo_fx_01.wav" => stereo.read;

//initilaize
// reset pos
kick.samples() => kick.pos;
highhat.samples() => highhat.pos;
snare.samples() => snare.pos;
stereo.samples() => stereo.pos;
.7 => float volume;
volume => master.gain;



//function sweller for stereo_fx
fun void swell (float begin, float end, float grain)
{
    //volume sweller up 
    for (begin => float j; j< end; j+grain => j)
    {
        j => stereo.gain;
        .005::second => now;
    }
    //volume sweller down 
    for (end => float j; j> begin; j-grain => j)
    {
        j => stereo.gain;
        .005::second => now;
    }     
    
}

//function half gain
fun float halfGain (float originalGain)
{
    return( originalGain *.5);
}


//function random rate
fun void randomRate (float start, float end)
{
    0 => stereo.pos;
     math.random2f(start, end) => stereo.rate;
}

//function reverse high hat
fun void revHighHat ()
{
    highhat.samples() => int x;
    x - x/16 => highhat.pos;
        -1.0 => highhat.rate;

}
// loop
while (count < 120)
{
    // bass drum
    count % 4 => int beat;
    if ((beat == 0) || (beat == 2))
    {
        0 => kick.pos;
    }
    // snaring
    if ((beat == 1) || (beat == 3))
    {
        0 => snare.pos;
    }
    // highhat
    .2 => highhat .gain;
    if (beat != 2)
    {
        0 => highhat.pos;
    }
    // effects
    .3 => stereo.rate;
    if (count > 16)
    {
      //call random rate
        randomRate (1.5, 2.5);  
    }
  
    // reversing hihat
    if (count > 114)
    {
        //call half gain function
        halfGain(master.gain()) => highhat.gain;
        //call random rate
        randomRate (1.5, 2.5);  
       revHighHat();
         0.5 => stereo.rate;
         if (beat != 2) { 
             0 => highhat.pos;
             1.0 => highhat.rate;
         }
         // reset volume
         volume => master.gain; 
         .1 -=> volume;
     } 
     //call swelling function
      swell(.3, .5, .5);
    .25::second => now;
    count++;
}


