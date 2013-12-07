// introbass.ck

Mandolin bass=> LPF bassLPF => NRev r=>  dac;

//reference for timing
0.625::second => dur fourth;
fourth * 2 => dur half;
fourth * 4 => dur whole;
fourth / 2 => dur eighth;
fourth / 4 => dur sixteenth;
fourth / 8 => dur thirty2nd;



//scaleArray
[41,43,48,50,51,53,60,63] @=> int scale[];

//set parameters
0.5 => float bodySize; //used to change character of sound over time
1 => int bool;
0 => int count;
250=>bassLPF.freq;
0.3 => r.mix;
0.2 => bass.stringDamping;
0.00 => bass.stringDetune;
bodySize => bass.bodySize;
4 => int scaleArrayPos;
0.5=>bass.gain;

while(true){
    introBass();
}

fun void introBass(){
    Math.random2(-1,1) +=> scaleArrayPos;
    if(scaleArrayPos < 0) {
       2 => scaleArrayPos;
   }
   if(scaleArrayPos >=scale.cap()) {
       scale.cap() -2 => scaleArrayPos;
       }
    Std.mtof(scale[scaleArrayPos]-12) => bass.freq;
    Math.random2f(0.1,0.5) => bass.pluckPos;
    
    if(count < 15){
    (bodySize-0.03) => bodySize;
    bodySize => bass.bodySize;
    count++;
        }
        
    //play the sound 
    1=>bass.noteOn;
    0.615::second => now;
    1=>bass.noteOff;
    0.15::second => now;
  
   }