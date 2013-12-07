// Assignment6_JazzHands

// piano.ck
// sound chain
Rhodey piano[4];
piano[0] => dac.left;
piano[1] => dac;
piano[2] => dac;
piano[3] => dac.right;

//2D array chord
[ [46, 48, 53, 56], [49,51,54,58] ] @=> int chordz[][];

//loop
while( true )
{
    // build first chord
    for( 0 => int i; i < 4; i++ )
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.2,0.5) => piano[i].noteOn;
       
    }
    0.625::second => now;
    // build second chord
    for( 0 => int i; i < 4; i++ )
    {
        Std.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.5,1.0) => piano[i].noteOn;
        
    }
    1.0::second => now;
    
}