// snare.ck
// randomly pick 2 snares. 1 for each speaker
notes not;// class mynotes.ck
2 => int snMax;
SndBuf snre2 => dac.left;
SndBuf snare => dac.right;
0.3 => snare.gain => snre2.gain;

not.pick_one() => int hm;// for hat
not.pick_one() => int mh;// for ht2
" " => string choice;
" " => string choice2;

// random choice
if( hm >= snMax){ "03" => choice;}
if( hm == 0){ "01" => choice;}
if( hm == 1){ "02" => choice;}
if( mh >= snMax){ "03" => choice2;}
if( mh == 0){ "01" => choice2;}
if( mh == 1){ "02" => choice2;}

me.dir(-1)+"/audio/snare_" + choice + ".wav" => snare.read;
me.dir(-1)+"/audio/snare_" + choice2 + ".wav" => snre2.read;

1.0 => snare.gain => snre2.gain;
snare.samples() => snare.pos;
snre2.samples() => snre2.pos;

// uses BPM class
BPM tempo;

while ( true )  {
    tempo.quarterNote => dur quarter;

    quarter => now;
    0 => snare.pos;
    0 => snre2.pos;
    2.0*quarter => now;
    0 => snare.pos;
    0 => snre2.pos;
    quarter/4.0 => now;
    0 => snare.pos;
    0 => snre2.pos;
    3.0*quarter/4.0 => now;
}    
    
