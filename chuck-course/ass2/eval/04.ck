// Assignment_2_Math2Music1.ck

<<< "Assignment_2_Math2Music1.ck" >>>;
<<< "---------------------------" >>>;
/*
30 second composition demonstrating:
- Use of Arrays.
- Include Panning.
- Use of random numbers in generating composition.
- Use of Std library.
- Using D Dorian scale and octaves above and below.
- Quarter notes.
*/

// number of oscillators to use, nOsc:
// (changing number of oscillators also requires changing the arrays
// defined below which specify their usage and behavior)
5 => int nOsc;

// create array of oscillators:
TriOsc s[nOsc];

// create array of Panning objects:
Pan2 p[nOsc];

// array to hold randomly selected notes:
int randomNote[nOsc];

// Define length, in seconds, of this composition:
30 => float lengthOfComposition;

// Duration of each note (in seconds):
0.25 => float duration;

// Simultaneously create and initialize arrays:
// note the use of "at chuck": "@=>"
//
// where the arrays are:
// - A: midi notes to be used in this composition
// - octaveMultiplier: multipliers for creating other octaves from A
// - pan: values in range [-1, +1] to be used for each oscillator
// - volume: values in range [0, 1] to be used as volumes (gains) for each oscillator
// - inTime: times in seconds for each oscillator to come in (turn on)
// - outTime: times in seconds for each oscillator to go out (turn off)
[50,52,53,55,57,59,60,62] @=> int A[];
[ 1.0,  0.5,  1.0,  2.0,  2.0] @=> float octaveMultiplier[];
[  0.,  -.5,   .5,  1.0, -1.0] @=> float pan[];
[  .4,   .5,   .4,   .3,   .3] @=> float volume[];
[ 0.0,  2.5,  5.0,  7.5, 10.0] @=> float inTime[];
[30.0, 25.0, 23.0, 21.0, 19.0] @=> float outTime[];

// convert midi notes to frequencies and store in F:
float F[A.cap()];
for (0 => int i; i < A.cap(); ++i)
    Std.mtof(A[i]) => F[i];

// set up patches and initialize gain and pan values:
for (0 => int i; i < nOsc; ++i)
{
    s[i] => p[i] => dac;
    0 => s[i].gain;
    pan[i] => p[i].pan;
}

// top and bottom are range indices used for random note selection:
0 => int bottom;
A.cap() - 1 => int top;

// we'll track time from start of composition with elapsedTime:
dur elapsedTime;

// getting ready to start, save now in startTime
now => time startTime;

// compute time to end composition:
startTime + lengthOfComposition::second => time endTime;

// main loop for playing composition:
while (now <= endTime)
{
    // compute elapsed time from start of composition:
    now - startTime => elapsedTime;

    // for each oscillator, 
    // - randomly select note
    // - compute frequency while applying octave multiplier
    // - turn each oscillator on or off depending on in and out times
    for (0 => int i; i < nOsc; ++i)
    {
        // select note
        Math.random2(bottom, top) => randomNote[i];

        // compute frequency while applying octave multiplier
        F[randomNote[i]] * octaveMultiplier[i] => s[i].freq;

        // turn on if in time range [inTime[i], outTime[i]]
        if (elapsedTime >= inTime[i]::second && elapsedTime < outTime[i]::second)
        {
            volume[i] => s[i].gain;
            // diagnostics to console:
            <<< i, F[randomNote[i]], " * ", octaveMultiplier[i], " = ", F[randomNote[i]] * octaveMultiplier[i] >>>;
        }
        else
        {
            0 => s[i].gain;
            // diagnostics to console:
            <<< i, "off" >>>;
        }
    }
    // diagnostics to console:
    <<< "*** ", elapsedTime/1::second >>>;
    duration::second => now;
}
<<< "end of composition" >>>;

