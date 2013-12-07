// bass.cK
Mandolin bass=> NRev r => Pan2 p =>dac;
0.5 => p.gain;

//reference for timing
0.625::second => dur fourth;
fourth * 2 => dur half;
fourth * 4 => dur whole;
fourth / 2 => dur eighth;
fourth / 4 => dur sixteenth;
fourth / 8 => dur thirty2nd;



//scale
[41,43,48,50,51,53,60,63] @=> int scale[];


0.1 => r.mix;
0.9 => bass.stringDamping;
0.05 => bass.stringDetune;
0.04 => bass.bodySize;
4 => int walkPos;

while(true){
playBass();
}

fun void playBass(){
     Math.random2(-1,1) +=> walkPos;
    if(walkPos < 0) 2 => walkPos;
    if(walkPos >=scale.cap()) scale.cap() -2 => walkPos;   
    Std.mtof(scale[walkPos]-12) => bass.freq;
    Math.random2f(0.05,0.5) => bass.pluckPos;
    1=>bass.noteOn;
    half=>now;
    1=>bass.noteOff;   
}