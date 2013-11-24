// test shakers

JCRev r => dac;

Shakers shakers[5];
for (0 => int j; j < shakers.cap(); j++) {
  9 => shakers[j].preset;
  60 => shakers[j].objects;
  shakers[j] => r;
}

.01 => r.mix;

while (true) {
  100::ms => now;
  for (0 => int j; j < shakers.cap(); j++) {
    Math.random2f(100, 200) => shakers[j].freq;
    Math.random2(0, 10) => float del;
    del::ms => now;
    1.0 => shakers[j].noteOn;
  }
  100::ms => now;
  
}

