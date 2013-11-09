
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

[
dir + "/audio/" + "stereo_fx_01.wav",
dir + "/audio/" + "stereo_fx_02.wav",
dir + "/audio/" + "stereo_fx_03.wav",
dir + "/audio/" + "stereo_fx_04.wav",
dir + "/audio/" + "stereo_fx_05.wav"
] @=> string sfiles[];

SndBuf b => dac;

for (0 => int i; i < files.cap(); i++) {
  files[i] => string f;
  <<< "file:", f >>>;
  f => b.read;
  1000::ms => now;
} 
