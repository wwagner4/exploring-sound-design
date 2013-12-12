// score.ck
// Assignment 7: Gamelan Again

// Shameless plug: If you're in the Boston area, check out
// Gamelan Si Betty at Harvard
// SinOsc sine => dac;
 
Gamelan betty;
BPM tempo;

0 => betty.lastGong;

tempo.tempo(96.0); // tempo if considering 0.625::second the quarter note

/*
for (1 => int i; i < 7; i++) {
    if (i != 4)
    {
        betty.itof(i,1) => sine.freq;
        <<< sine.freq() >>>;
        tempo.quarterNote => now;
    }
}
betty.itof(1,2) => sine.freq;
<<< sine.freq() >>>;
tempo.quarterNote => now; 
*/


Machine.add(me.dir()+"/slenthem.ck") => int slenthemID;
7.0 * tempo.quarterNote => now;

Machine.add(me.dir()+"/bonang.ck") => int bonangID;
Machine.add(me.dir()+"/gong.ck") => int gongID;
12.0 * tempo.quarterNote => now;

96.0 => float newTempo;
while (newTempo < 136.0)
{
    newTempo + 1.4 => newTempo;
    tempo.tempo(newTempo);
    tempo.sixteenthNote => now;
    <<< "tempo = ", newTempo >>>;
}

12.0 * tempo.quarterNote => now;

while (newTempo > 70.0)
{
    newTempo - 1.0 => newTempo;
    tempo.tempo(newTempo);
    tempo.sixteenthNote => now;
    <<< "tempo = ", newTempo >>>;
}

Machine.remove(bonangID);
Machine.remove(slenthemID);

1::second => now;

1 => betty.lastGong;

6::second => now;

Machine.remove(gongID);