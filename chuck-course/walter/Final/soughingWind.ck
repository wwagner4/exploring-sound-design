// soughingWind.ck
// Assignment 8: Concert for wind, sun and three birds

SinOsc b => Gain g => dac;
0.4 => b.gain;

SinOsc c => g;
0.4 => c.gain;

SinOsc d => g;
0.4 => d.gain;

0.05 => g.gain;

// drift a given value for a small amount away
fun float drift(float f, float maxDeviation) {
    return f * (Std.rand2f(-maxDeviation, maxDeviation) + 1.0);
}

while (true) {
    drift(177.0, 0.05) => b.freq;
    drift(181.0, 0.01) => c.freq;
    179.0 => d.freq;

    0.01::second => now;
}

