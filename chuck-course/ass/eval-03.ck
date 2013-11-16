<<<"technogalore3.1">>>;
now/second => float st;
//The piece is 32 seconds long, but I needed the extra 2 seconds to finish the loop.
//I wasn't sure if that's already "drastically" longer, I hope not :)
//The time signature .125::second was used to be able to get some more detail in the track,
//it's basically just a little more "granular" as someone on the forums called it, but it
//stays true to the .25::second requirement. 
//Thanks for listening :) 

//GENERAL SETTINGS
30::second + now => time later;
0=>int counter;

//SOUND NETWORK
Gain masterLeft  => dac.left;
Gain masterRight => dac.right;

SndBuf kick  => Pan2 kickPan;
SndBuf snare => Pan2 snarePan;
SndBuf hihat => Pan2 hihatPan;
SndBuf click => Pan2 clickPan;
SinOsc si => Pan2 siPan;
SinOsc sii => Pan2 siiPan;

kickPan.left   => masterLeft;
snarePan.left  => masterLeft;
hihatPan.left  => masterLeft;
clickPan.left  => masterLeft;
siPan.left => masterLeft;
siiPan.left => masterLeft;

kickPan.right  => masterRight;
snarePan.right => masterRight;
hihatPan.right => masterRight;
clickPan.right => masterRight;
siPan.right => masterRight;
siiPan.right => masterRight;

.4 => masterLeft.gain => masterRight.gain;



//arrays for si.freq
[60] @=> int A[];
[52,64] @=> int B[];
[50, 52, 53, 55, 57, 59, 60, 62, 64, 65, 67] @=> int C[];


//loading samples
//snare //array of strings //load array with file paths
string snare_samples [2];
me.dir() + "/audio/snare_03.wav" => snare_samples[0];
me.dir() + "/audio/snare_02.wav" => snare_samples[1];

//click //array of strings //load array with file paths
string click_samples [3];
me.dir() + "/audio/click_01.wav" => click_samples[0];
me.dir() + "/audio/click_02.wav" => click_samples[1];
me.dir() + "/audio/click_05.wav" => click_samples[2];

//click //array of strings //load array with file paths
string hihat_samples [3];
me.dir() + "/audio/hihat_01.wav" => hihat_samples[0];
me.dir() + "/audio/hihat_02.wav" => hihat_samples[1];
me.dir() + "/audio/hihat_03.wav" => hihat_samples[2];

//single samples
me.dir()+ "/audio/kick_04.wav" => kick.read;

//all playheads to end, no sound
kick.samples () => kick.pos;
hihat.samples () => hihat.pos;
snare.samples () => snare.pos;
click.samples () => click.pos;



//MAIN LOOP
while (now < later)
{ 
    //muting snare for the first half & kick one bar before second half
    if (counter < 128)
    {
        0 => snare.gain;
    }
    else
    {
        .6 => snare.gain;  
    }
    if (counter>95 && counter <128)
    {
        0=>kick.gain;
    }
    else
    {
        .6=>kick.gain;
    }
    
    //beat loop
    for (0 => int i; i<32; i++)
    {
        counter % 32 => int beat;
        {
            //kick drum
            if ((beat == 0 ) || (beat == 4 ) || (beat == 8)|| (beat == 12)|| (beat == 16)|| (beat == 20)|| (beat == 24)|| (beat == 28))
            {
                1340 => kick.pos;
                1.2 => kick.rate;
            }
            //hats //reverse hats
            if ((beat == 1) || (beat ==3) || (beat == 5) ||(beat == 9) ||(beat == 11) || (beat == 13)|| (beat == 15)|| (beat == 17)|| (beat == 27)|| (beat == 28))
            {
                0 => hihat.pos;
                0.2 => hihat.gain;
                Math.random2(0, hihat_samples.cap()-1) => int which; //0,1 or 2
                hihat_samples [which] => hihat.read; //read in the samples
                Math.random2f (.8,1.2) => hihat.rate;
                Math.random2f (-.7,.7) => hihatPan.pan;
            }
            if ((beat == 7) || (beat == 21))
            {
                10000 => hihat.pos;
                -1.1  => hihat.rate;
                0 => hihatPan.pan;
            }
            
            //click
            if ((beat == 2) || (beat ==4) || (beat == 6) || (beat == 14)|| (beat == 28)|| (beat == 29)|| (beat == 30)|| (beat == 31))
            {
                0 => click.pos;
                Math.random2(0, click_samples.cap()-1) => int which;
                click_samples [which] => snare.read; //read in the samples
                Math.random2f (.4,.55) => click.gain;
                Math.random2f (.8,1.2) => click.rate;
                Math.random2f (-1,1) => clickPan.pan;
            }
            
            //snare 
            if ((beat == 1)||(beat ==4 ) || (beat ==12)|| (beat ==20)|| (beat == 28)|| (beat == 30)|| (beat == 31))
            {
                0 => snare.pos;
                Math.random2(0, snare_samples.cap()-1) => int which; 
                snare_samples [which] => snare.read; //read in the samples
                Math.random2f (.8,1.2) => snare.rate;  
            }
            
            
            //setting si.freq
            if (beat<6)
            {
                for (0=>int a; a<A.cap(); a++)
                {
                    Std.mtof(A[a]) => si.freq; 
                    1::samp => now;
                }   
                
            }
            if (beat>5 && beat <25)
            {
                for (0=>int b; b<B.cap(); b++)
                {
                    Std.mtof(B[b]) => si.freq; 
                    1::samp => now;
                }
                
            }
            
            if ((beat >24))
            {
                for (0=>int c; c<C.cap(); c++)
                {
                    Std.mtof(C[c]) => si.freq; 
                    5::samp => now;
                }
            }
            
            //setting sii.freq
            if (i<4 && i>12)
            {
                Std.mtof(53)=>sii.freq;  
            }
            if ((i>3 && i<14) | (i>46 && i<52))
            {
                Std.mtof(52)=>sii.freq;
            }  
            
            if ((i>13 && i<24) || (i>51))
            {
                Std.mtof(55)=>sii.freq;
            } 
            if (i>23 && i<32)
            {
                Std.mtof(57)=>sii.freq;
            } 
            
            
            counter ++; //counter +1 
            
            .125::second=> now;
        }
    }
}
<<<"Time Elapsed:", now/second - st, "seconds. I'M SORRY!" >>>;
