//Author: cjd
//Date: 10/27/13

//print program name
<<<"Hello Sine">>>;

//print title
<<<"Assignment 1: Beginning">>>;

//sound network
SinOsc s => dac;
SqrOsc t => dac;

//set volume to play s only
0.9 => s.gain;
0.0 => t.gain;
//set frequency for s to Middle C using floating point
222.45 => s.freq;
//play for 1 second
1::second => now;

//set volume for s and t, t gets louder
0.9 => s.gain;
0.1 => t.gain;
//set frequency for s and t to Middle c
222.45 => s.freq;
222.45 => t.freq;
//play for 1 second
1::second => now;

//set volume for s and t, t gets louder 
0.8 => s.gain;
0.2 => t.gain;
//set frequency to Middle c
222.45 => s.freq;
222.45 => t.freq;
//play for 1 second
1::second => now;

//set volume for s and t, t gets louder 
0.9 => s.gain;
0.3 => t.gain;
//set frequency to Middle c
222.45 => s.freq;
222.45 => t.freq;
//play for 1 second
1::second => now;

//set volume to play s only
0.2 => s.gain;
0. => t.gain;
//set frequency for s 
550 => s.freq;
//play for 1 second
1::second => now;

//set volume to play s only
0.3 => s.gain;
0 => t.gain;
//set frequency for s 
330 => s.freq;
//play for 1 second
1::second => now;

//set volume for s and t
0.6 => s.gain;
0.1 => t.gain;
//set frequency for s and t
330 => s.freq;
550 => t.freq;
//play for .5 seconds
.5::second => now;

//set volume for s and t
0.8 => s.gain;
0.1 => t.gain;
//set frequency for s and t
440 => s.freq;
550 => t.freq;
//play for .5 seconds
.5::second => now;

//only play s
0.6 => s.gain;
0 => t.gain;
//set interger to loop
for( 0 => int i; i < 700; i++ )
{
    i => s.freq;
    0.002::second => now;
}

//set volume to play s only
0.8 => s.gain;
0 => t.gain;
//set frequency for s 
440 => s.freq;
//play for 1 second
1::second => now;

//set volume to 0.8
0.8 => s.gain;
//set frequency to 440
440 => s.freq;
//play for .5 second
.5::second => now;

//set volume to 0.2
0.2 => s.gain;
//set frequency to 220
220 => s.freq;
//play for .5 second
.5::second => now;

//set volume to 0.6
0.6 => s.gain;
//set frequency to 330
330 => s.freq;
//play for 1 seconds
.5::second => now;

//set volume to 0.8
0.8 => s.gain;
//set frequency to 440
440 => s.freq;
//play for 1 seconds
.5::second => now;

//set volume to play s only
0.9 => s.gain;
0.0 => t.gain;
//set frequency for s to Middle C using floating point
222.45 => s.freq;
//play for 1 second
1::second => now;

//set volume for s and t, t gets louder
0.9 => s.gain;
0.1 => t.gain;
//set frequency for s and t to Middle c
222.45 => s.freq;
222.45 => t.freq;
//play for 1 second
1::second => now;

//set volume 
0.8 => s.gain;
0.2 => t.gain;
//set frequency to Middle c
222.45 => s.freq;
222.45 => t.freq;
//play for 1 second
1::second => now;

//set volume 
0.9 => s.gain;
0.3 => t.gain;
//set frequency to Middle c
222.45 => s.freq;
222.45 => t.freq;
//play for 1 second
1::second => now;

//set volume for s and t
0.2 => s.gain;
0.1 => t.gain;
//set frequency for s and t
550 => s.freq;
550 => t.freq;
//play for 1 second
1::second => now;


//set volume for s and t
0.6 => s.gain;
0.1 => t.gain;
//set frequency for s and t
330 => s.freq;
550 => t.freq;
//play for 2 seconds
.5::second => now;

//set volume for s and t
0.8 => s.gain;
0.1 => t.gain;
//set frequency for s and t
440 => s.freq;
550 => t.freq;
//play for 4 seconds
.5::second => now;

//only play s
0.6 => s.gain;
0 => t.gain;

for( 0 => int i; i < 700; i++ )
{
    i => s.freq;
    0.002::second => now;
}

//only play s
0.6 => s.gain;
0 => t.gain;

for( 0 => int i; i < 700; i++ )
{
    i => s.freq;
    0.002::second => now;
}

//only play s
0.6 => s.gain;
0.1 => t.gain;

for( 0 => int i; i < 800; i++ )
{
    i => t.freq;
    0.0001::second => now;
}


//only play s
0. => s.gain;
0.6 => t.gain;

for( 0 => int i; i < 700; i++ )
{
    i => t.freq;
    0.001::second => now;
}

//set volume for s and t
0.6 => s.gain;
0.1 => t.gain;
//set frequency for s and t
330 => s.freq;
550 => t.freq;
//play for 2 seconds
2::second => now;

//set volume for s and t
0.8 => s.gain;
0.1 => t.gain;
//set frequency for s and t
440 => s.freq;
550 => t.freq;
//play for 4 seconds
4::second => now;




