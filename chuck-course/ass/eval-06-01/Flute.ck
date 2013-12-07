// Assignment6_JazzHands

// flute.ck
// sound chain
Flute solo => JCRev rev => dac.left;
solo => Delay d => d => rev;
SqrOsc s => dac.right;

 // randomly choose frquency from 50 to 500
    Math.random2f( 10, 30 ) => s.freq;
    0.05 => s.gain;
    // advance time by 200 millisecond
    200::ms => now;
    
    // function
    fun float halfGain( float originalGain )
    {
        return ( originalGain * .5 );
    }
    
    
    // remember that .gain() is a function that is part of SinOsc
    <<< "Full Gain: ", s.gain() >>>;
    1::second => now;
    
    // call halfGain()
    halfGain(s.gain()) => s.gain;
    <<< "Half Gain: ", s.gain() >>>;
    1::second =>  now;


// sound params
0.1 => rev.mix;
0.625::second => d.max => d.delay;
0.5 => d.gain;

// scale
[46, 48, 49, 51, 53, 54, 56, 58] @=> int scale[];

// loop
while( true )
{
    ( Math.random2(1,5) * 0.2)::second => now;
    
    //play
    if( Math.random2(0,3) > 1)
    {
        
        Math.random2(0, scale.cap() - 1) => int note;
        Math.mtof(24+scale[note]) => solo.freq;
        Math.random2f(0.3, 0.5) => solo.noteOn;
    }
    // rest
    else
    {
        1 => solo.noteOff;
    }
    
}

