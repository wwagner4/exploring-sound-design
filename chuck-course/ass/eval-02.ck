<<< "Assignment 3" >>>;
<<< "Drum'n'Bass in code" >>>;


// IMPORTANT HOWTO:
// copy/save .ck to directory where the audio folder (called "audio") is located
// !!! as shown in the videos !!! 
// if not, sound wont play back correctly !!!


<<< "IMPORTANT HOWTO:" >>>;
<<< "copy/save .ck to directory where the audio folder (called 'audio') is located" >>>;
<<< "!!! as shown in the videos !!!" >>>;
<<< "if not, sound wont play back correctly !!!" >>>;

// sound network

// load some sampled into an array (as requiered)

string fx_samples[3];
me.dir() + "/audio/stereo_fx_01.wav" => fx_samples[0];
me.dir() + "/audio/stereo_fx_02.wav" => fx_samples[1];
me.dir() + "/audio/stereo_fx_03.wav" => fx_samples[2];
SndBuf snare1 => dac;
SndBuf snare2 => dac;
SndBuf kick => dac;
SndBuf hh1 => dac;
SndBuf hh2 => dac;
SndBuf hh3 => NRev r2 => dac;
SndBuf clap => dac;
SndBuf fx => dac;
SndBuf fx2 => Pan2 p2 => dac;
SndBuf fx3 => dac;
SndBuf fx4 => dac;
-0.8 => p2.pan;



fx_samples[2] => fx.read;
fx_samples[2] => fx2.read;
fx_samples[2] => fx3.read;

// now load some sampled to variables

me.dir()  + "/audio/kick_02.wav" => kick.read;
me.dir()  + "/audio/hihat_01.wav" => hh1.read;
me.dir()  + "/audio/hihat_02.wav" => hh2.read;
me.dir()  + "/audio/hihat_03.wav" => hh3.read;
me.dir()  + "/audio/snare_03.wav" => snare1.read;
me.dir()  + "/audio/snare_01.wav" => snare2.read;
me.dir()  + "/audio/clap_01.wav" => clap.read;


// mute most of the samples at the beging

kick.samples() => kick.pos;
hh1.samples() => hh1.pos;
snare1.samples() => snare1.pos;
snare2.samples() => snare2.pos;
clap.samples() => snare1.pos;
fx2.samples() => fx2.pos;
fx3.samples() => fx3.pos;

// set rate and gain

1.0 => fx.rate;
.3 => hh1.gain;
.6 => hh2.gain;
.4 => hh3.gain;
.3 => clap.gain;
.6 => snare2.gain;
.8 => kick.gain;
.7 => fx.gain;
.7 => fx3.gain;
.7 => fx2.gain;
2.0 => fx2.rate;
2.1 => hh1.rate;
0 => int counter;
0 => int counterhh;
0 => int spcounter;

[ 0,0,0,0,0,1,0,0] @=>  int special[];

// oscilators 

SinOsc s => dac;
SinOsc s2 =>  NRev r4 => Pan2 p4 => dac;
0.0 => s2.gain;
0.3 => r4.gain;
0.3 => r2.gain;
0.0=> s.gain;
// D dorian

50 => int d;
52 => int e;
53 => int f;
55 => int g;
57 => int a;
59 => int b;
60 => int c;
62 => int d2;
[d,e,f,g,a,b,c, d2] @=> int song[];


Std.mtof(d2/2) => float Hz;
Hz => s.freq;

0 => int songcount;


//
// start with intro!!
//


while(songcount<64)
{
    counter % 8 => int beat;
    counter % 4 => int beat2;

    
 if (songcount%32==0)
    {
        0 => hh2.pos;
        0 => hh3.pos;
    }
    
   if (songcount == 32)
    {
        0 => fx3.pos;
    }
    if (( beat == 2) || (beat == 6))
    {
       
        //0 => snare2.pos;
       
    }
    
    if (songcount>24 && songcount<32)
    {
        if(beat%2==0 || beat %5==0)
        {
          0 => clap.pos;  
        }
        
    }

   if (songcount>56)
    {
        
        if(beat%2==0)
        {
          0 => clap.pos;  
        }
    }
    
    // a "funky" hi hat
    
    if (beat2 == 2 || beat %5==0)
    {
        if ( beat %5==0)
        {
            .1 => hh1.gain;
        }
        else
        {
           .3 => hh1.gain; 
        }
        0 => hh1.pos;
    }
    
    counter++;
    counterhh++;
    spcounter++;
    if(spcounter == 8)
    {
        0=> spcounter;
    }
    125::ms => now;

    songcount++;
}
0=>songcount;
kick.samples() => kick.pos;
-1.0 => kick.rate;
0.2 => s2.gain;

// do some "bridging" to the main part witht
// a reversed kick (requiered)

while(songcount<64)
{
    if(songcount%32==0)
    {
        0 => hh2.pos;
        0 => hh3.pos;
    }
   if (songcount % 2 ==0)
   {
            Std.mtof(song[(songcount)%8]+songcount%3*3) => float Hz2;
          
            
            Hz2*3 => s2.freq;
   }
    counter % 8 => int beat;
    counter % 4 => int beat2;
   if (songcount == 16)
    {
        0 => fx.pos;
    }
    if (beat %4 == 0)
    {
      kick.samples() => kick.pos; 
    }

        if ( beat %5==0)
        {
            .1 => hh1.gain;
        }
        else
        {
           .3 => hh1.gain; 
        }
    
    counter++;
    counterhh++;
    spcounter++;
    if(spcounter == 8)
    {
        0=> spcounter;
    }
    125::ms => now;
    
    songcount++;
}
0.0 => s2.gain;
1.0 => kick.rate;
0=>songcount;
0 => fx.pos;
0 => fx2.pos;
0.1=> s.gain;
   

    fx_samples[0] => fx4.read;
    2 => fx4.rate;
    0.6 => fx4.gain;

// start the main part

while(songcount<96)
{
    
    if (songcount%16 == 0)
    {
        0 => fx2.pos;
    }
    if (songcount%64 == 0)
    {
         0 => hh3.pos;
    }
        if (songcount%32== 0)
    {
        0 => fx.pos;
        0 => fx4.pos;
       
    }
    counter % 8 => int beat;
    counter % 4 => int beat2;
    if (( beat == 0) || (beat == 5))
    {
        0 => kick.pos;
    }
    if (( beat == 2) || (beat == 6))
    {
        0 => snare1.pos;
        0 => snare2.pos;
       
    }

    if ((beat == 3))
    {
        
        0 => clap.pos;
    }
    if (beat2 == 2)
    {
                if ( beat %5==0)
        {
            .1 => hh1.gain;
        }
        else
        {
           .3 => hh1.gain; 
        }
        0 => hh1.pos;
    }
    
    counter++;
    counterhh++;
    spcounter++;
    if(spcounter == 8)
    {
        0=> spcounter;
    }
    125::ms => now;
    
    songcount++;
}
0.2 => s2.gain;
0 => fx.pos;
0 => fx2.pos;
0=>songcount;

// ending part!!!
//

while(songcount<64)
{
    if(songcount%32==0)
    {
       
        0 => hh3.pos;
    }
   if (songcount % 2 ==0)
   {
       Std.mtof(song[(songcount)%8]+songcount%3*3) => float Hz2;
 
       Hz2*3 => s2.freq;
   }
    counter % 8 => int beat;
    counter % 4 => int beat2;
   if (songcount == 16)
    {
        0 => fx.pos;
    }
    if (beat %4 == 0)
    {
      kick.samples() => kick.pos; 
    }

    if (beat2 == 2)
    {
        0 => hh1.pos;
    }
    
    counter++;
    counterhh++;
    spcounter++;
    if(spcounter == 8)
    {
        0=> spcounter;
    }
    125::ms => now;
    
    songcount++;
}
0 => hh3.pos;
0.0 => s2.gain;
3000::ms => now;