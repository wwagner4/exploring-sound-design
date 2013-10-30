// Some_FM_dudeling

SawOsc s => dac;
0.1 => s.gain;
0.05 => float diff;
// Run this loop for 30 seconds
now => time start1;
while (now < start1 + 30::second) {
  Math.random2(100, 400) => float baseFreq;
  0 => int i;
  100 => int min;
  2000 => int max;
  // Run this loop for 0.1 to 1 seconds
  Math.random2(100, 1000)::ms => dur d;
  now => time start;
  while (now < start + d) {
    Math.sin(i) => float x;
    // Set the frequence of the osc
    baseFreq + 30 * x => float f;
    f => s.freq;
    i++;
    0.05::second  => now;
  }
}

