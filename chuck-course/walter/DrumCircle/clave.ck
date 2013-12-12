// clave.ck
// Assignment 7: latin classes
// clave rhythm played with a bass kick using global BPM conducting

// make a conductor for our tempo
BPM tempo;

SndBuf kick => Pan2 pan => dac;
me.dir(-1) + "/audio/kick_02.wav" => kick.read;
0.7 => kick.gain;

while (true) {
    
    // 2 son clave
    tempo.quarterNote => now;
    
	0 => pan.pan;
    0 => kick.pos;
    tempo.quarterNote => now;
    
    0 => kick.pos;
    tempo.quarterNote => now;
    
    tempo.quarterNote => now;

    // 3 son clave
	-0.8 => pan.pan;
    0 => kick.pos;
    tempo.eighthNote*3 => now;
    
	0.8 => pan.pan;
    0 => kick.pos;
    tempo.eighthNote*3 => now;
    
	-0.8 => pan.pan;
    0 => kick.pos;
    tempo.quarterNote => now;
    
}
