// basstry.ck
// sound chain 
Mandolin bass => NRev rev => dac; 
Shakers morc => dac;

// parameter setup
0.0 => bass.stringDamping; 
0.02 => bass.stringDetune;
0.5 => bass.bodySize;
0.3 => bass.gain;
11 => morc.preset; // sounds like morroccas
128.0 => morc.objects; // lots of sound
0.2 => rev.mix;
2.0 => morc.gain;

BPM tempo;
tempo.eighthNote => dur eight;
tempo.quarterNote => dur quarter;

fun void shake_it()
{
    while( true )
    {
        1.0 => morc.noteOn;
        quarter => now;
        1 => morc.noteOff;
        0.001::second => now;
    }
}

// uses the class mynotes
notes tone;

spork ~ shake_it();
while( true ) 
{
    Math.random2(0,7) => int g; 
    Std.mtof(tone.ionlo[g]) => bass.freq; 
    Math.random2f(0.05,0.5) => bass.pluckPos; 
    1 => bass.noteOn;
    Math.random2(0,1) => int t;
    if( t == 0){ eight => now;}
    if( t == 1 ){ quarter => now;}
    1 => bass.noteOff;
    0.001 :: second => now;
}