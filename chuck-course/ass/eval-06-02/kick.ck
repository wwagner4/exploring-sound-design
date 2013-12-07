//KickDrum
SndBuf kick => dac;
0.6=>kick.gain;

//reference for timing
0.625::second => dur fourth;
fourth * 2 => dur half;
fourth * 4 => dur whole;
fourth / 2 => dur eighth;
fourth / 4 => dur sixteenth;
fourth / 8 => dur thirty2nd;

//load soundfile
me.dir(-1)+"/audio/kick_02.wav" => kick.read;

while(true){
    playKick();
}

fun void playKick(){
 Math.random2f(0.6,0.9) => kick.gain;
    Math.random2f(0.9,1.2) => kick.rate;
   // (Math.random2(1,2)*0.4)::second=> now;
    0=>kick.pos;
    fourth=>now;   
}