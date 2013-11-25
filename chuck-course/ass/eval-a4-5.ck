<<<"assignmentWeek4Drums+sinOsc">>>;

Gain master => dac;
SndBuf kick => master;
SndBuf kick2 =>master;
SndBuf hh =>pan2 p=> master;
SndBuf snare => pan2 p2=> master;
SinOsc chord[3];
SinOsc s => ADSR e => dac;
0 =>int flag;
.3 => e.gain;


me.dir() + "/audio/kick_02.wav" => kick.read;
me.dir() + "/audio/kick_01.wav" => kick2.read;
me.dir() + "/audio/hihat_03.wav" => hh.read;
me.dir() + "/audio/snare_02.wav" => snare.read;

kick.samples() => kick.pos;
kick2.samples() => kick2.pos;
snare.samples() => snare.pos;
hh.samples() => hh.pos;

//different patterns
[1,0,0,0,1,0,0,0] @=> int kick_ptrn[];
[1,0,0,0,1,1,1,1] @=> int kick_ptrn2[];
[0,0,0,0,0,0,1,0] @=> int hh_ptrn[];
[0,0,0,0,0,1,1,1] @=> int hh_ptrn2[];
[1,0,1,0,1,0,1,0] @=> int snare_ptrn[];
[1,0,0,1,1,0,1,0] @=> int sin_ptrn[];
[1,1,1,1,1,1,1,0] @=> int kick_ptrn3[];
[0,0,0,1,0,1,1,0] @=> int hh_ptrn3[];
[1,0,0,0,1,0,0,0] @=> int sin_ptrn2[];
[1,0,0,0,1,0,0,0] @=> int snare_ptrn2[];
[0,0,0,0,1,0,0,0] @=> int sin_ptrn3[];
[51,53,55,56,58,60,61,63] @=> int EBmode[];




while (flag == 0){
       drumRoll (100);
       section(kick_ptrn, snare_ptrn, hh_ptrn, sin_ptrn, 0.25);
       section(kick_ptrn2, snare_ptrn, hh_ptrn, sin_ptrn, 0.25);
       section(kick_ptrn, snare_ptrn, hh_ptrn,sin_ptrn, 0.25);
       section(kick_ptrn2, snare_ptrn, hh_ptrn2,sin_ptrn, 0.25);
       section(kick_ptrn, snare_ptrn, hh_ptrn2, sin_ptrn, 0.25);
       section(kick_ptrn2, snare_ptrn2, hh_ptrn3, sin_ptrn, 0.25);
       section(kick_ptrn2, snare_ptrn, hh_ptrn2,sin_ptrn, 0.25);
       section(kick_ptrn, snare_ptrn, hh_ptrn2, sin_ptrn, 0.25);
       section(kick_ptrn2, snare_ptrn2, hh_ptrn3, sin_ptrn, 0.25);
       section(kick_ptrn, snare_ptrn2, hh_ptrn3,sin_ptrn, 0.25);
       section(kick_ptrn, snare_ptrn2, hh_ptrn,sin_ptrn2, 0.25);
       section(kick_ptrn, snare_ptrn2, hh_ptrn,sin_ptrn3, 0.25);
       -1 => flag;
       }

//drumRoll function
fun int drumRoll (float index){
    //fade in drum roll
    (100-index)/100 => float gain;
     gain => kick2.gain;
    
    if (index >= 5 ){
      0 => kick2.pos;
      index::ms => now; 
      return drumRoll(index-1);  
    }
    
    else if(index ==4){
        return 0;
    }
}



//sequencer
fun void section (int kickArray[], int snareArray[], int hhArray[],int sinArray[], float beattime){
    
    for(0 => int i; i < kickArray.cap(); i++){
        
        if (kickArray[i] == 1 ){
            0 => kick.pos;   
            <<<i>>>;
        }   
        
        if(snareArray[i] == 1){
            -0.5 => p2.pan;
            .7 => snare.rate;
            0.6 => snare.gain;
            0=>snare.pos;
        }
        
        if(hhArray[i] == 1){
            0.5 => p.pan;
            0.5 => hh.gain;
            0=>hh.pos;
        }
        
        if(sin_ptrn[i] == 1){
         ADSRsin();
          e.keyOn();
   //    600::ms => now;
        }
        
        beattime::second => now;
        e.keyOff();
   
    }
}

//function to reset the ADSR (attack, decay, sustain, release) values of the osc.
fun void ADSRsin(){
   
       e.set(Math.random2(4,12)::ms, Math.random2(4,12)::ms,  Math.random2f(.2,4.0), Math.random2(120, 600)::ms );
       (EBmode[Math.random2(0,EBmode.cap()-1)])-12 => (Std.mtof) => s.freq;
      
}


