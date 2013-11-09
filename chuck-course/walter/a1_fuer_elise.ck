<<< "Assignment01_Fur Elise" >>>;

//first asignment
//title: Hello chucK, Make Sound - 30 seconds composition.
//Taken from: Fur Elise (Ludwin Van Beethoven)

//metronome
SqrOsc downbeat => dac;

//set the tempo
130.0 => float bpm;

// tempo
60.0 / bpm => float tempo;
0.2 => float spacing;
tempo - spacing => float tempofinal;
//setting on and off for upbeats and downbeats
0.0 =>  float off;
0.2 => float on;

//setting frequencies for upbeats and downbeats
440 => int frequp;
220 => int freqdown;

//metronome sound off
0.0 => downbeat.gain;


//notes from c2 to b2
65.41 => float c2;
69.30 => float db2;
73.42 => float d2;
77.78 => float eb2;
82.41 => float e2;
87.31 => float f2;
92.50 => float gb2;
98.00 => float g2;
103.83 => float ab2;
110.00 => float a2;
116.54 => float bb2;
123.47 => float b2;

//notes from c3 to b3
130.81 => float c3;
138.59 => float db3;
146.83 => float d3;
155.56 => float eb3;
164.81 => float e3;
174.61 => float f3;
185.00 => float gb3;
196.00 => float g3;
207.65 => float ab3;
220.00 => float a3;
233.08 => float bb3;
246.94 => float b3;

//notes from c4 to b4
261.63 => float c4;
277.18 => float db4;
293.66 => float d4;
311.13 => float eb4;
329.63 => float e4;
349.23 => float f4;
369.99=> float gb4;
392.00 => float g4;
415.30 => float ab4;
440.00 => float a4;
466.16 => float bb4;
493.88 => float b4;

//notes from c5 to b5
523.25 => float c5;
554.37 => float db5;
587.33 => float d5;
622.25 => float eb5;
659.26 => float e5;
698.46 => float f5;
739.99=> float gb5;
783.99 => float g5;
830.61 => float ab5;
880.00 => float a5;
932.33 => float bb5;
987.77 => float b5;

//sound network for notes
SinOsc note1 => dac;
SinOsc note2 => dac;
SinOsc note3 => dac;



//setting the note values
0.001 => float spacingnotes;
(tempo * 4.0) - spacingnotes=> float whole; 
(tempo * 2.0) - spacingnotes => float half;
tempo - spacingnotes => float quarter;
(tempo / 2.0) - spacingnotes => float eighth;
(tempo / 4.0) - spacingnotes=> float sixteeth;
eighth + sixteeth => float eighthdot;
quarter + eighth => float quarterdot;

//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
       eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//D#5 eighth

eb5 => note1.freq; // eb5 = d#5
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//D#5 eighth

eb5 => note1.freq; // eb5 = d#5
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
 
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;



for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//d5 eighth

d5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;



for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 quarter + a2 eighth

a4 => note1.freq;
a2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i - 0.3 => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//a3 eighth

a3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//c4 eighth

c4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 eighth

a4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 quarter + e2 eighth

b4 => note1.freq;
e2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//ab3 eighth

ab3 => note1.freq; // g#3 = ab3
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//ab4 eighth

ab4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 quarter + a2 eighth

c5 => note1.freq;
a2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i - 0.2 => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}


//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a3 eighth

a3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//D#5 eighth

eb5 => note1.freq; // eb5 = d#5
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//D#5 eighth

eb5 => note1.freq; // eb5 = d#5
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//d5 eighth

d5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 quarter + a2 eighth

a4 => note1.freq;
a2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i - 0.3 => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//a3 eighth

a3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//c4 eighth

c4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 eighth

a4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 quarter + e2 eighth

b4 => note1.freq;
e2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//ab3 eighth

ab3 => note1.freq; // g#3 = ab3
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;



for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
 
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 quarter + a2 eighth + e3 eight

a4 => note1.freq;
a2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now; 
        e3 => note2.freq;
        eighth::second => now;  
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//a3 eighth

a3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//d5 eighth

d5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//e5 quarter + c3 eighth + g3 eight

e5 => note1.freq;
c3 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now; 
        g3 => note2.freq;
        eighth::second => now;  
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//c4 eighth

c4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;

    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//g4 eighth

g4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//f5 eighth

f5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//d5 quarter + b2 eighth + g3 eight

d5 => note1.freq;
b2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;

    // note value
    if (0.5 < i ){
        eighth::second => now; 
        g3 => note2.freq;
        eighth::second => now;  
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}


//b3 eighth

b3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//f4 eighth

f4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//d5 eighth

d5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//c5 quarter + a2 eighth + e3 eight

c5 => note1.freq;
a2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now; 
        e3 => note2.freq;
        eighth::second => now;  
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}


//a3 eighth

a3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//d5 eighth

d5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 quarter + e2 eighth + b2 eighth

b4 => note1.freq;
e2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now; 
        b2 => note2.freq;
        eighth::second => now;  
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}


//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//D#5 eighth

eb5 => note1.freq; // eb5 = d#5
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//D#5 eighth

eb5 => note1.freq; // eb5 = d#5
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//E5 eighth

e5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//d5 eighth

d5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 quarter + a2 eighth

a4 => note1.freq;
a2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i - 0.3 => note2.gain;
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//a3 eighth

a3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//c4 eighth

c4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
 
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
  
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 eighth

a4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
 
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//b4 quarter + e2 eighth

b4 => note1.freq;
e2 => note2.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    0.001::second => now;
 
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            0.00001::second => now;
        }
        
    }  
}

//e3 eighth

e3 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
 
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//ab3 eighth

ab3 => note1.freq; // g#3 = ab3
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
    
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}

//e4 eighth

e4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;

    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//c5 eighth

c5 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
 
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//b4 eighth

b4 => note1.freq;
0.0 => note2.gain;
0.0 => note3.gain;

for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    
    0.001::second => now;
   
    
    // note value
    if (0.5 < i ){
        eighth::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            0.00001::second => now;
        }
        
    }  
}


//a4 half + c4 half + a2 half

a4 => note1.freq;
c4 => note2.freq;
a2 => note3.freq;


for ( 0.01 => float i; i < 0.51; i + 0.01=> i )
{
    //fade in
    i => note1.gain;
    i => note2.gain;
    i => note3.gain;
    0.001::second => now;

    
    // note value
    if (0.5 < i ){
        half::second => now;    
    }
    
    //fade out
    if (i>0.5)
    {
        for (0.5 => float j; j > 0.0001; j - 0.0001 => j)
        {
            j => note1.gain;
            j => note2.gain;
            j => note3.gain;
            0.00001::second => now;
        }
        
    }  
}

