// Assignment_7_marching_flutes_retreat
// All soundfiles in one class for easy access

public class Sounds {

  [
  me.dir(-1) + "/audio/clap_01.wav", // 0
  me.dir(-1) + "/audio/click_01.wav",
  me.dir(-1) + "/audio/click_02.wav",
  me.dir(-1) + "/audio/click_03.wav",
  me.dir(-1) + "/audio/click_04.wav",
  me.dir(-1) + "/audio/click_05.wav", // 5
  me.dir(-1) + "/audio/cowbell_01.wav",
  me.dir(-1) + "/audio/hihat_01.wav",
  me.dir(-1) + "/audio/hihat_02.wav",
  me.dir(-1) + "/audio/hihat_03.wav",
  me.dir(-1) + "/audio/hihat_04.wav", // 10
  me.dir(-1) + "/audio/kick_01.wav",
  me.dir(-1) + "/audio/kick_02.wav",
  me.dir(-1) + "/audio/kick_03.wav",
  me.dir(-1) + "/audio/kick_04.wav",
  me.dir(-1) + "/audio/kick_05.wav", // 15
  me.dir(-1) + "/audio/snare_01.wav",
  me.dir(-1) + "/audio/snare_02.wav",
  me.dir(-1) + "/audio/snare_03.wav"] @=> string files[];
  
  // Sound chain
  Gain master => dac;
  
  // Holds the overall gain of an object of that class
  1.0 => float _gain;
  
  // Set the overall gain
  fun void gain(float value) {
    value => _gain;
  }
  
  // Index of the currently active buffer
  0 => int instIndex;
  
  // Initialize the buffers
  SndBuf buffers[files.cap()];
  for (0 => int i; i < files.cap(); i++) {
    buffers[i].read(files[i]);
    buffers[i].samples() => buffers[i].pos;
    buffers[i] => master;
  }

  // Play the context of the file defined by 'instIndex'
  fun void keyOn(float velocity) {
    velocity * _gain => master.gain; 
    0 => buffers[instIndex % files.cap()].pos;   
  }
    
}


/**
 * Usage of the Sounds class


Sounds snds;
0.2 => snds.gain;

0 => int t;
while (true) {
  //Math.random2(11, 15) => snds.instIndex;
  Math.random2(7, 10) => snds.instIndex;
  snds.keyOn(0.5);
  500::ms => now;
  t++;
}
*/
