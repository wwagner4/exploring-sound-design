// Sound Network
SndBuf kick => dac;
SndBuf hat1 => dac;
SndBuf hat2 => dac;
SndBuf snr => dac;
SndBuf2 tech => dac;


sinosc o1 => dac; // sine       
sawosc o2 => dac ; // sawtooth
sinosc o3 => Pan2 p => dac;   // o3 contains PAN effect  

0 => o1.gain => o2.gain => o3.gain;

int i,j,k;
[49, 50, 52, 54, 56, 57, 59, 61] @=> int A[];

// Reading Files
me.dir() + "/audio/kick_02.wav" => kick.read;
me.dir() + "/audio/hihat_03.wav" => hat1.read;
me.dir() + "/audio/hihat_02.wav" => hat2.read;
me.dir() + "/audio/snare_01.wav" => snr.read;
me.dir() + "/audio/stereo_fx_02.wav" => tech.read;


// Removing initial noise

kick.samples() => kick.pos;
hat1.samples() => hat1.pos;
hat2.samples() => hat2.pos;
snr.samples() => snr.pos;
tech.samples() => tech.pos;

// Begin
0=> tech.pos;
0.75::second => now;

// LOOP 1
0.6  => o3.gain;
0.05 => o2.gain;
for (0 => i; i<64; i++)
{
    if (i < 32)
    {
        -1.0 => p.pan;
        std.mtof((A[std.rand2(0,A.cap()-1)])*2)=> o3.freq; // random function used
        1.0=>p.pan;
        std.mtof((A[std.rand2(0,A.cap()-1)]))=> o2.freq;
        0.25::second => now;
    }
    else
    {
        1.0 => p.pan;
        std.mtof((A[std.rand2(0,A.cap()-1)])*2)=> o3.freq; // random function used
        -1.0=>p.pan;
        std.mtof((A[std.rand2(0,A.cap()-1)]))=> o2.freq;
        0.25::second => now;
    }
        
}

//LOOP 2

0 => o1.gain => o2.gain => o3.gain;

for ( 0 => j; j<2; j++)
{
0 => int c=> i;

0.05=> o2.gain;


while (i < 5)
{
        c % 8 => int b;
    if(b==0)
        i++;
    
               
    
    if((i==0)||(i==2))
    {
        std.mtof((A[std.rand2(0,A.cap()-1)]))=> o2.freq;
        if ((b == 0)|| (b == 4))
        {
            0 => kick.pos; 
                   
        }
        if ((b== 2) || (b==6))
        {
            0 => snr.pos;        
        }
        if (b== 5)
        {
            0 => hat1.pos;
            0.3=> hat1.gain;
        }
        //c++;
        0 => hat2.pos;
        0.2 => hat2.gain;
        0.25::second => now;
    }
    
    if((i== 1)||(i==3))
    {
        std.mtof((A[std.rand2(0,A.cap()-1)]))=> o2.freq;
        if ((b == 0)|| (b == 4 )||(b==5)||(b==3))
        {
            0 => kick.pos;        
        }
        if ((b== 2) || (b==6))
        {
            0 => snr.pos;        
        }
        if ((b== 5)||(b==1))
        {
            0 => hat1.pos;
            0.3 => hat1.gain;
        }
        
        //c++;
        0 => hat2.pos;
        0.2 => hat2.gain;
        0.375::second => now;
    }
    c++;
        
      
}
}

0 => o1.gain => o2.gain => o3.gain;

//LOOP 3
for (0 => i; i<32; i++)
{
    
    if(i%4== 0)     // multiples of 4
    {
        0.4 => o1.gain;
        0.02 => o2.gain;
        std.mtof((A[std.rand2(4,A.cap()-1)]))=> o1.freq;
        std.mtof((A[4])) => o2.freq;
        0.375::second =>now;
    
    }
    else if (i%3==0)        // multiples of 3
    {
        0 => o1.gain;
        0=> o2.gain;
        std.mtof(A[4]) => o1.freq;
        0.25::second =>now;
    }
    else if(i%5== 0)
    {
        0.4 => o1.gain;
        0.02=> o2.gain;
        std.mtof((A[std.rand2(4,A.cap()-1)]))=> o1.freq;
        0.25::second =>now;
    }
        
} 

