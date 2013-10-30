
<<< "Assignment 1 - heartbeat" >>>;
// "heartbeat" is divided into 30 seconds each having a similar structure
// each second is divided in 10 parts of equal duration (100ms)

// heartbeat unit generator
SawOsc heart => dac;
440 => heart.freq;
// factor to adapt the gain of the heartbeart, will change depending on second
1 => float heartGainFactor;

// background unit generator: vibrato
TriOsc background => dac;
0.2 => background.gain;
0 => float bgFreq;
1 => float bgFreqFactor;

// loop over seconds
<<< "seconds at start: ", now/second >>>;
for (0 => int sec; sec<30; sec++) {
    <<< "Second: ", sec >>>;
    // prepare current second of heartbeat
    if (sec < 12)
        // increasing volume
        0.6 + 0.05*sec => heartGainFactor;
    else if (sec < 23)
        // decreasing volume
        0.6 + 0.05*11 - 0.05*(sec-11) => heartGainFactor;
    else if (sec < 26)
        // heartbeat stop
        0 => heartGainFactor;
    else
        // last seconds: heartbeat go-on at constant gain
        1 => heartGainFactor;
    <<< " heartGainFactor=", heartGainFactor >>>;
    <<< " heartbean gain=", 0.5 * heartGainFactor >>>;
    // prepare current second of background vibrato
    if (sec < 10)
        // silent at the begin
        0 => bgFreq;
    else if (sec < 25)
        // 'disturbing' background in the middle: bass vibrato
        110 => bgFreq;
    else
        // silent at the end
        0 => bgFreq;
    // alternatively one second enlarge frequency, next second decrease frequency
    if (sec%2 == 0)
        1/0.98 => bgFreqFactor;
    else
        0.98 => bgFreqFactor;
    <<< " bgFreqFactor=", bgFreqFactor >>>;
    <<< " bgFreq at start=", bgFreq >>>;
    
    // play one second in ten parts
    // heartbeat: 700 ms at very low gain, 300 ms the beat
    // background: frequency change every 100 ms
    0.005 * heartGainFactor => heart.gain;
    bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    <<< " bgFreq at mid-second=", bgFreq >>>;
    100::ms => now;

    1/bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    1/bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    0.5 * heartGainFactor => heart.gain;
    1/bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    1/bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    
    1/bgFreqFactor *=> bgFreq;
    bgFreq => background.freq;
    100::ms => now;
    <<< " bgFreq at end  =", bgFreq >>>;
}
<<< "seconds at end: ", now/second >>>;
