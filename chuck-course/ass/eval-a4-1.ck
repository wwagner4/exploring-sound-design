//assignment_4_zarbi
// november 17th 2013

// defining Sound chain
SndBuf kick => dac;
SndBuf snare => dac;
SndBuf stereo => pan2 panstereo => dac;
0.5 => stereo.gain;
SinOsc voice1=>dac;
0=>voice1.gain;

0.6::second => dur quarter;// defining quarter duration

[55,58,60,63,65,67,70,72] @=> int penta[];

//load sound files into SndBuffers
me.dir() + "/audio/kick_02.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => snare.read;
me.dir() + "/audio/stereo_fx_05.wav" => stereo.read;

//set all playheads to end  so no sound is made
kick.samples() => kick.pos;
snare.samples() => snare.pos;
stereo.samples() => stereo.pos;
// defining rythm patterns for function rythm
[1,0,0,0,0,1,0,0,0,0,0,0] @=> int kick_patern[];
[1,0,1,0,1,0,1,0,1,0,1,0] @=> int kick_patern2[];
[0,0,0,0,1,0,0,0,0,1,0,0] @=> int snare_patern[];
[0,1,0,1,0,1,0,1,0,1,0,1] @=> int snare_patern2[];

//defining function rythm
fun void rythm(int kickA[],int snareA[],float beatime)
{
    for (0=> int i; i<kickA.cap();i++)
        
        {
            if(kickA[i])
            {
                0=> kick.pos;
                
            }
            if(snareA[i])
            {
                0=> snare.pos;
            }
            
            beatime::second =>now;
        }
    }
    // defining function decrate (dividing a number by 2 at each iteration)
    fun float decrate(float initialrate)
    {
        
        return (initialrate*0.5);
    }
    
    
    //main program
    //parameters for rythm (ternary rythm with subdi)
    // initialize counter variable
    0=> int counter;
    //intro loop duration = 20*duration of one loop of function rythm = 3 seconds 
    for (0=> counter; counter <20; counter++)
    {
        rythm(kick_patern,snare_patern, 0.0125);//each performing of function last 0,0125*12 ie 0,15 second
    }
    // second section loop
    
    for (20=> counter; counter < 150; counter++)//we are in 16th, with a mesure of 3 quarter per mesure
    {
        //initializing beat variable and seting parameter for 12 beats per mesure
        counter % 12 => int beat3;
        math.random2(0,7) => int Melo;
        0.25 => voice1.gain;
        <<<"counte", counter, "beat3", beat3>>>; //print counter and beat
        
        //bass drum on 0 and 2 and voice
        if (( beat3==0) || (beat3==5))
        {
            0=> kick.pos; 
            
        }
        // snare drum on 1 and 4 and voice
        if ((beat3==4) || (beat3==8))
        {
            0 => snare.pos;
            
        }
        // playing a melody with some randomness on each quarter
        if ((beat3==0) || (beat3==4)|| (beat3==8))
        {
            
            std.mtof(penta[7-Melo])=> voice1.freq;
        }
        else
        {
            0 => voice1.gain;
        }
        
        quarter/4 =>now;//each beat lasting a 16th
        
        math.random2f(0,8) => stereo.rate;//moving randomly the rate of stereo with each beat
        0=> stereo.pos;   
        
    }
    
    //end section loop using 2 functions rythm with another variable and decrate
    for (150=> counter; counter <153; counter++)
    {
        0.5 => stereo.gain;
        0=> voice1.gain;
        decrate(stereo.rate()) => stereo.rate;
        0=>stereo.pos;
        rythm(kick_patern2,snare_patern2, 0.2083);
        
    }
    