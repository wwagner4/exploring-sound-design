<<< "Assignment_3_technodrumming" >>>;

Gain master => dac;
SndBuf kick => master;
SndBuf hihat => master;
SndBuf snare => master;
TriOsc s => Pan2 p => master; // connect sound network

.6 => master.gain;

// load soundfiles into sndbuf

me.dir() + "audio/kick_01.wav" => kick.read;
me.dir() + "audio/hihat_01.wav" => hihat.read;
me.dir() + "audio/snare_01.wav" => snare.read;

kick.samples() => kick.pos;
hihat.samples() => hihat.pos;
snare.samples() => snare.pos => int numSamples;

// initialize counter
0 => int counter;

[50,52,53,55,57,59,60,62] @=> int genji[]; // midi array

[.5,.5,1,1,1,1] @=> float octave[]; // step down an octave one third of the time
[-1,1] @=> int hardPan[]; // hard left or right speaker

<<< genji.cap() >>>; // amount of dorian notes

now + 30::second => time later; // run for 30 seconds
while(now < later){

// loop up
for( 0 => int i; i < genji.cap(); i++){
  <<< i, genji[i] >>>; // print index and value
  Std.mtof(genji[i]*octave[Math.random2(0,octave.cap()-1)]) => s.freq; // midi to freq
  hardPan[Math.random2(0,hardPan.cap()-1)] => p.pan;
  counter % 8 => int beat;
  
  if((beat==0)||(beat==4)){
    0=>kick.pos;
  }

  if((beat==2)||(beat==6)){
    0=>snare.pos;
  }

  0.1=>hihat.gain; 
  0=>hihat.pos;

  <<< "counter: ", counter, "Beat: ", beat >>>;
  counter++; // counter + 1 => counter
  .25::second => now; // adv time
}

// loop down
for( (genji.cap()-2) => int j; j >= 0; j--){
  <<< j, genji[j] >>>; // print index and value
  Std.mtof(genji[j]*octave[Math.random2(0,octave.cap()-1)]) => s.freq; // midi to freq
  hardPan[Math.random2(0,hardPan.cap()-1)] => p.pan; // randomness
  counter % 8 => int beat;
  
  if((beat==0)||(beat==4)){
    0=>kick.pos;
  }

  if((beat==2)||(beat==6)){
    0=>snare.pos;
    if(beat==2){
      numSamples => snare.pos;
      -1.0=>snare.rate;
    } // reverse

    
  }

  0.1=>hihat.gain; 
  0=>hihat.pos;

  <<< "counter: ", counter, "Beat: ", beat >>>;
  counter++; // counter + 1 => counter
 
  .25::second => now; // adv time
}


}
