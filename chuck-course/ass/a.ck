
me.dir() => string dir;
<<< "dir", dir >>>;
[
dir + "/audio/" + "clap_01.wav",
dir + "/audio/" + "click_01.wav",
dir + "/audio/" + "click_02.wav",
dir + "/audio/" + "click_03.wav",
dir + "/audio/" + "click_04.wav",
dir + "/audio/" + "click_05.wav",
dir + "/audio/" + "cowbell_01.wav",
dir + "/audio/" + "hihat_01.wav",
dir + "/audio/" + "hihat_02.wav",
dir + "/audio/" + "hihat_03.wav",
dir + "/audio/" + "hihat_04.wav",
dir + "/audio/" + "kick_01.wav",
dir + "/audio/" + "kick_02.wav",
dir + "/audio/" + "kick_03.wav",
dir + "/audio/" + "kick_04.wav",
dir + "/audio/" + "kick_05.wav",
dir + "/audio/" + "snare_01.wav",
dir + "/audio/" + "snare_02.wav",
dir + "/audio/" + "snare_03.wav"
] @=> string files[];

SndBuf b => dac;

for (0 => int i; i < files.cap(); i++) {
  files[i] => string f;
  <<< "file:", f >>>;
  f => b.read;
  for (0 => int i; i < 5; i++) {
      1500::ms => now;
      0 => b.pos;  
  }  
} 
