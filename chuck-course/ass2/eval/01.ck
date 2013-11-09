// Assignment_2_Walking_Melody

// start a sinewave oscilator & set gain
SinOsc sine => JCRev rev => dac;
0.1 => rev.mix;
0.1 => sine.gain;

[50, 52, 53, 55, 57, 59, 60, 62] @=> int scale[]; // d dorian scale
[-2, -1, 1, 2] @=> int step[]; // allowed steps

0 => int ix;
50 => int note;

now => time start_time;
// walking index
while (now - start_time < 30::second)
{
    <<<scale[ix]>>>; 
  
if (ix > 1 && ix < (scale.cap() - 1))
{
    ix + step[Math.random2(0,3)] => ix;
};
if (ix == 1)
{
    ix + step[Math.random2(1,3)] => ix;
};
if (ix == 0)
{
    ix + step[Math.random2(2,3)] => ix;
};
if (ix == (scale.cap() - 1))
{
    ix + step[Math.random2(0,2)] => ix;
};
if (ix == (scale.cap() - 0))
{
    ix + step[Math.random2(0,1)] => ix;
};
    Std.mtof(scale[ix]) => sine.freq;
    
// advance time
if( Math.randomf() > -.6 ) .5::second => now;
else 1.0::second => now;
}