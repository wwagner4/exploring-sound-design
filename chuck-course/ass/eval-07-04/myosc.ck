notes ton;
BPM tempo;
SinOsc s => dac;
0 => s.gain;
tempo.thirtysecondNote => dur thirty;
for (7 => int i; i > 0; i--)
{
    0.4 => s.gain;
    Std.mtof(ton.ionhi[i]) => s.freq;
    thirty => now;
    Std.mtof(ton.ion[i]) => s.freq;
    thirty => now;
    Std.mtof(ton.ionlo[i]) => s.freq;
    thirty => now;
}
