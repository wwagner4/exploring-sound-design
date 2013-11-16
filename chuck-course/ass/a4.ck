// Assignmet 4 Function Junction

[51, 53, 55, 56, 58, 60, 61, 63] @=> int scale[];

Gain master => dac;
0.1 => master.gain;
TriOsc oscs[3];
for (0 => int i; i < oscs.cap(); i++) {
	oscs[i] => master;
}

0 => int i;
while(true) {
	scale[i % scale.cap()] => int note;
	<<< "n=", note >>>;
    Std.mtof(note) => oscs[0].freq;
    Std.mtof(note + 4) => oscs[1].freq;
    Std.mtof(note + 7) => oscs[2].freq;
	100::ms => now;
	i++;
}