// myhat.ck
// using the class notes to make a random hihat play
notes not;
SndBuf hat => dac.left;
SndBuf ht2 => dac.right;
0.3 => hat.gain => ht2.gain;
3 => int hatMax;// hihat_04 is the highest, so 0 -3
not.pick_one() => int hm;// for hat
not.pick_one() => int mh;// for ht2
" " => string choice;
" " => string choice2;

// random choice
if( hm >= hatMax){ "04" => choice;}
if( hm == 0){ "01" => choice;}
if( hm == 1){ "02" => choice;}
if( hm == 2){ "03" => choice;}
if( mh >= hatMax){ "04" => choice2;}
if( mh == 0){ "01" => choice2;}
if( mh == 1){ "02" => choice2;}
if( mh == 2){ "03" => choice2;}

// during testing found this out
me.dir(-1)+"/audio/hihat_" + choice + ".wav" => hat.read;
me.dir(-1)+"/audio/hihat_" + choice2 + ".wav" => ht2.read;

BPM tempo;

while ( true )  {
    // set duration
    tempo.eighthNote => dur eighth;
    
    // hit for 7 of 8 beats
    for (0 => int beat; beat < 8; beat++)  {
        if (beat < 7) {
            0 => hat.pos;
            0 => ht2.pos;
        }
        eighth => now;
    }
}    
    
