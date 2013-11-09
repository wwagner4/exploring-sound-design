
<<< "Assignment 2 - O Superman  raw version" >>>;
// 'O Superman  raw version' is based on the Laurie Anderson song
// it uses the first text parts and the ha-ha loop (beat)
 
1 => int useEnvelope;

// Oscillators
TriOsc melody => dac;
TriOsc haBeat1 => dac;
Std.mtof(59) => haBeat1.freq;
TriOsc haBeat2 => dac;
Std.mtof(60) => haBeat2.freq;

// each melody part is stored in a 2-dimensonal array: a sequence of midi,gain,duration
[[59.0, .4, 1],   // O
 [62.0, .4, 1],   // Su
 [62.0, .4, .5],  // per
 [62.0, .4, .5],  // ma
 [60.0, .4, 1]]   // n
 @=> float refrain_o_superman[][];

[[60.0, .4, 1],   // O
 [60.0, .4, 1],   // Ju
 [64.0, .4, 1]]   // dge
 @=> float refrain_o_judge[][];

[[60.0, .4, 1],   // O
 [59.0, .4, 1],   // Mom
 [57.0, .4, .5],  // and
 [55.0, .4, .5]]  // Dad
 @=> float refrain_o_mom_and_dad[][];

[[59.0, .4, 1],   // Mom
 [60.0, .4, 1],   // and
 [59.0, .4, 1]]   // Dad
 @=> float refrain_mom_and_dad_2[][];

// the melody parts are stored in the correct sequence in another array 
// to be able to loop over it
[refrain_o_superman,
 refrain_o_judge,
 refrain_o_mom_and_dad,
 refrain_mom_and_dad_2,
 [[60.0, .4, 1]]]
 @=> float melodies[][][];

// before each melody part  there are some ha-ha beats,
// the number of beats is stored in this array
[8, /*O Superman*/8, /*O Judge*/ 10, /*O Mom and Dad*/ 2, /*Mom and Dad*/ 4]
 @=> int haBeatCounts[];

now/second => float startTime;
// loop over the melodies
for (0 => int i; i < melodies.cap(); i++) {
    // start with haBeat of variable length
    <<< "beat with", haBeatCounts[i], "ha's " >>>;
    0 => melody.gain;
    for (0 => int j; j < haBeatCounts[i]; j++) {
        0.10 => float g;
        g => haBeat1.gain;
        g => haBeat2.gain;
        300::ms => now;

        0.13 => g;
        g => haBeat1.gain;
        g => haBeat2.gain;
        50::ms => now;
        
        0.16 => g;
        g => haBeat1.gain;
        g => haBeat2.gain;
        50::ms => now;
        
        0.14 => g;
        g => haBeat1.gain;
        g => haBeat2.gain;
        50::ms => now;
        
        0.12 => g;
        g => haBeat1.gain;
        g => haBeat2.gain;
        50::ms => now;
    }
    
    // go on with melody
    0 => haBeat1.gain;
    0 => haBeat2.gain;
    melodies[i] @=> float a[][];
    for (0 => int j; j < a.cap(); j++) {
        a[j][0] => float m;
        Std.mtof(m) => float f;
        a[j][1] => float g;
        a[j][2] => float d;

        f => melody.freq;
        if (useEnvelope) {
            <<< "play with freq", f, "(", m, ") and gain", g, 
                "for", d, "seconds WITH simple envelope" >>>;
            // some kind of "simple" hardcoded envelope over the current tone
            // primarily to be able to distinguish two times the same tone in a row
            g*85/100 => melody.gain;
            (d*1/20)::second => now;
            
            g*95/100 => melody.gain;
            (d*1/20)::second => now;
            
            g*104/100 => melody.gain;
            (d*1/20)::second => now;
            
            g => melody.gain;
            (d*7/20)::second => now;
            
            g*94/100 => melody.gain;
            (d*2/20)::second => now;
            
            g*88/100 => melody.gain;
            (d*2/20)::second => now;
            
            g*85/100 => melody.gain;
            (d*2/20)::second => now;
            
            g*82/100 => melody.gain;
            (d*2/20)::second => now;
            
            g*80/100 => melody.gain;
            (d*2/20)::second => now;
        }
        else {
            <<< "play with freq", f, "(", m, ") and gain", g, "for", d, "seconds WITHOUT envelope" >>>;
            g => melody.gain;
            d::second => now;
        }
    }
}
<<< "seconds played: ", now/second - startTime >>>;
