me.dir() => string dir;
<<< "dir", dir >>>;
[
dir + "/audio/" + "stereo_fx_01.wav",
dir + "/audio/" + "stereo_fx_02.wav",
dir + "/audio/" + "stereo_fx_03.wav",
dir + "/audio/" + "stereo_fx_04.wav",
dir + "/audio/" + "stereo_fx_05.wav"
] @=> string files[];

SndBuf2 b => dac;

for (0 => int i; i < files.cap(); i++) {
  files[i] => string f;
  <<< "file:", f >>>;
  f => b.read;
  for (0 => int i; i < 2; i++) {
      10000::ms => now;
      0 => b.pos;  
  }  
} 
