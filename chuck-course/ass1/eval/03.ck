<<< "Assignment_1_Waveform_Waltz" >>>;

//Oscillators (Melodic voices)
SinOsc s => dac;
TriOsc t => dac;

//Oscillators (Chords)
SawOsc w1 => dac;
SawOsc w2 => dac;
SawOsc w3 => dac;

//VARIABLE: Set frequencies
97.999 => float G2;
103.83 => float Ab2;
116.54 => float Bb2;
130.81 => float C3;
138.59 => float Db3;
155.56 => float Eb3;
164.81 => float E3;
174.61 => float F3;
196 => float G3;
207.65 => float Ab3;
233.08 => float Bb3;
261.63 => float C4;
277.18 => float Db4;
293.66 => float D4;
311.13 => float Eb4;
392 => float G4;
415.3 => float Ab4;

//VARIABLE: Set Durations
.625 => float q; //(quarter-note)
1.25 => float h; //(half-note)

//Initial volume levels
0 => t.gain;
0 => w1.gain;
0 => w2.gain;
0 => w3.gain;

//Opening melody (with fade-in on each note)

for(0 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Ab4 => s.freq;
    0.00625::second => now;
}

for(0.003 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    G4 => s.freq;
    0.0125::second => now;
}

for(0 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Eb4 => s.freq;
    0.00625::second => now;
}

for(0.003 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Db4 => s.freq;
    0.0125::second => now;
}

for(0 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Bb3 => s.freq;
    0.00625::second => now;
}

for(0.003 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    C4 => s.freq;
    0.0125::second => now;
}

for(0 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Bb3 => s.freq;
    0.00625::second => now;
}

for(0.003 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Db4 => s.freq;
    0.0125::second => now;
}

//Melody develops with chordal accompaniment
for(0 => float fls; fls < 0.3; fls+.003 => fls)
{
    fls => s.gain;
    Ab4 => s.freq;
    0.00625::second => now;
}

//Volume of Saw Oscillators updated

0.025 => w1.gain;
0.0175 => w2.gain;
0.0125 => w3.gain;

// If/Else statement
1 => int chance;

if(chance == 1)
{
    Ab2 => w1.freq;
    C3 => w2.freq;
    Eb3 => w3.freq;
}
else
{
    G2 => w1.freq;
    Bb2 => w2.freq;
    Db3 => w3.freq;
}

G4 => s.freq;
h::second => now;

Db4 => s.freq;
q::second => now;

Bb3 => s.freq;
G2 => w1.freq;
Bb2 => w2.freq;
Db3 => w3.freq;
h::second => now;

C4 => s.freq;
q::second => now;

Bb3 => s.freq;
Ab2 => w1.freq;
C3 => w2.freq;
Eb3 => w3.freq;
h::second => now;

Ab3 => s.freq;
q::second => now;

Bb3 => s.freq;
G2 => w1.freq;
Bb2 => w2.freq;
Db3 => w3.freq;
h::second => now;

//New Melody over chords
Bb3 => s.freq;
q::second => now;

Ab3 => s.freq;
Ab2 => w1.freq;
C3 => w2.freq;
Eb3 => w3.freq;
h::second => now;

Bb3 => s.freq;
q::second => now;

G3 => s.freq;
G2 => w1.freq;
Bb2 => w2.freq;
Db3 => w3.freq;
h::second => now;

Ab3 => s.freq;
q::second => now;

F3 => s.freq;
Ab2 => w1.freq;
C3 => w2.freq;
Eb3 => w3.freq;
h::second => now;

E3 => s.freq;
q::second => now;

Eb3 => s.freq;
G2 => w1.freq;
Bb2 => w2.freq;
Db3 => w3.freq;
h::second => now;

//Volume of TriOsc updated, harmony added to melody
.2 => t.gain;
Bb3 => s.freq;
Db4 => t.freq;
q::second => now;

Ab3 => s.freq;
C4 => t.freq;
Ab2 => w1.freq;
C3 => w2.freq;
Eb3 => w3.freq;
h::second => now;

Bb3 => s.freq;
Eb4 => t.freq;
q::second => now;

G3 => s.freq;
Db4 => t.freq;
G2 => w1.freq;
Bb2 => w2.freq;
Db3 => w3.freq;
h::second => now;

Ab3 => s.freq;
D4 => t.freq;
q::second => now;

F3 => s.freq;
Eb4 => t.freq;
Ab2 => w1.freq;
C3 => w2.freq;
Eb3 => w3.freq;
h::second => now;

E3 => s.freq;
D4 => t.freq;
q::second => now;

Eb3 => s.freq;
Db4 => t.freq;
G2 => w1.freq;
Bb2 => w2.freq;
Db3 => w3.freq;
h::second => now;

//End