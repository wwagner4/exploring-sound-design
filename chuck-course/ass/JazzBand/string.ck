// bass.ck
// Insert the title of your piece here

// Part of your composition goes here

NRev r => dac;
.1 => r.gain;
.01 => r.mix;

StifKarp sks[3];

for (0 => int i; i<sks.cap(); i++) {
    0.3 => sks[i].pickupPosition;
    0.9 => sks[i].sustain;
    0.5 => sks[i].stretch;
    sks[i] => r;
}



// our notes
[ 61, 61, 61, 65, 65, 65, 66, 66, 66 ] @=> int notes[];

// basic play function (add more arguments as needed)
fun void play(StifKarp m,  float note, float velocity )
{
    // start the note
    0.01 => float fdiff;
    Std.mtof( note ) + Math.random2f(-fdiff, fdiff) => m.freq;
    velocity * Math.random2f(0.6, 1.1) => m.pluck;
}

fun void playMulti(StifKarp m, int note) {
    repeat(4) {
        spork ~ play(m, note , 0.1 );
        Math.random2f(10, 20) => float delay;
        delay::ms => now;
    }
}
fun void playCord(int note) {
    spork ~ playMulti(sks[0], note );
    if (Math.random2(1, 4) == 1) spork ~ playMulti(sks[1], note + 7);
    else                         spork ~ playMulti(sks[1], note - 5);
    if (Math.random2(1, 4) == 1) spork ~ playMulti(sks[2], note + 3);
    else                         spork ~ playMulti(sks[2], note + 4);    
 } 

// infinite time-loop
while( true )
{
    for( int i; i < notes.cap(); i++ )
    {   
        playCord(notes [i] - 14);    
        10::ms => now;
        playCord(notes [i] - 15);    
        10::ms => now;
        playCord(notes [i] - 15);    
        10::ms => now;
        playCord(notes [i] - 16);    
        150::ms => now;
        playCord(notes [i] - 17);    
        100::ms => now;
        playCord(notes [i] - 18);    
        500::ms => now;
    }
}

