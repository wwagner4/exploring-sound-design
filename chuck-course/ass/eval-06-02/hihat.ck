//FutureBeat__Programming_for_Musicians_&_Digital Artists
//drums.ck
SndBuf hihat =>  NRev r => dac;
0 => int count;
0.2 => r.mix;

//reference for timing
0.625::second => dur fourth;
fourth * 2 => dur half;
fourth * 4 => dur whole;
fourth / 2 => dur eighth;
fourth / 4 => dur sixteenth;
fourth / 8 => dur thirty2nd;

//load soundfile
me.dir(-1)+"/audio/hihat_02.wav" => hihat.read;

while(true){
  playHH();
}

fun void playHH(){
    Math.random2f(0.1,0.3) => hihat.gain;
    Math.random2f(.9,1.2) => hihat.rate;
    
    if(count<4){
        half=> now;
        0=>hihat.pos;
    }
    
    if(count>=4){
        0.05 => r.mix;
        eighth=> now;
        0=>hihat.pos;
    }
    
    if(count>=16){
        0.07 => r.mix;
        fourth=> now;
        0=>hihat.pos;
    }
    
    
    count++;   
}