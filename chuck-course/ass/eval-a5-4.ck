/*
 *
 *  Assignment 5 - You nut, Gen
 *
 * Make sure the code includes all of the following:
 *   - Use of Oscillator             Line  48
 *   - Use of SndBuf                 Line  41
 *   - Use of STK instrument         Line  31
 *   - Use of if/else statements     Line 121
 *   - Use of for loop or while      Line 119, 254
 *   - Use of variables              Line  24
 *   - Use of comments               Line   1
 *   - Std.mtof()                    Line 134
 *   - Random Number                 Line 132
 *   - Use of Arrays                 Line  34
 *   - Use of Panning                Line 135
 *   - Use of right timing           Line  89
 *   - Use of right melodic notes    Line  61
 *   - Use of hand-written functions Line 110, 116, 141, and more
 *
*/

// Set up some times
now => time start;
30 => float len;
start + len::second => time end;

// Sound chain creation
Pan2 master => dac;  // bus for all
Pan2 pianosPan => master; // bus for pianos
Rhodey topPiano => JCRev jcr => Pan2 topPan => pianosPan;
Rhodey middlePiano => NRev nr => Pan2 middlePan => pianosPan;
Rhodey bottomPiano => PRCRev prcr => Pan2 bottomPan => pianosPan;
[topPiano, middlePiano, bottomPiano] @=> Rhodey pianos[];
[topPan, middlePan, bottomPan] @=> Pan2 pianoPans[];
0.5 => topPiano.gain => middlePiano.gain => bottomPiano.gain;
0.6 => jcr.gain => nr.gain => prcr.gain;
0.2 => jcr.mix => nr.mix => prcr.mix;
0.95 => pianosPan.gain;

SndBuf percussion => master;
0.33 => float drumGain => percussion.gain;
0.04 => float hihatGain;
["kick_01", "kick_03", "kick_04", "kick_05",
"clap_01","snare_01", "snare_02", "snare_03"] @=> string Perc[];
["hihat_01", "hihat_02", "hihat_04"] @=> string Hihats[];

SinOsc sinBass => master;
TriOsc triBass => master;
0.2 => sinBass.gain => triBass.gain;
0 => sinBass.freq => triBass.freq;

//////////////////////////////////////////////////////////
// Db Phrygian notes
// Db   D   E  Gb  Ab   A   B  Db   D   E  Gb  Ab   A   B
// C#   D   E  F#  G#   A   B  C#   D   E  F#  G#   A   B
// 37, 38, 40, 42, 44, 45, 47, 49, 50, 52, 54, 56, 57, 59
//////////////////////////////////////////////////////////
// Note sequence for a piano (-1 means don't play)
[
56,-1,56,52,-1,56,52,-1,  // E
54,-1,54,50,-1,-1,-1,-1,  // Bm
57,-1,57,49,-1,57,49,-1,  // A
56,-1,-1,52,-1,-1,-1,-1   // E
] @=> int TopNotes[];

// Note sequence for a piano (-1 means don't play)
[
52,-1,52,47,-1,52,47,-1,  // E
50,-1,50,47,-1,-1,-1,-1,  // Bm
49,-1,49,45,-1,49,45,-1,  // A
52,-1,-1,47,-1,-1,-1,-1   // E
] @=> int MiddleNotes[];

// Note sequence for a piano (-1 means don't play)
[
47,-1,47,40,-1,47,40,-1,  // E
47,-1,47,35,-1,-1,-1,-1,  // Bm
45,-1,45,40,-1,45,40,-1,  // A
47,-1,-1,40,-1,-1,-1,-1   // E
] @=> int BottomNotes[];
// Two dimensional array holding all the note sequences
[TopNotes, MiddleNotes, BottomNotes] @=> int AllNotes[][];
0 => int topIndex;
1 => int middleIndex;;
2 => int bottomIndex;

// Timing variables (0.75 second quarter note)
750 => float quarter;  // (ms)
quarter / 2 => float eighth;
eighth / 2 => float sixteenth;

// Number of notes in an octave
12 => int octave;

// Variables used in random ranges to determine adjustments
// to pitch of piano notes
0 => int lowOctave;
0 => int highOctave;

// Used as a lower limit for midi notes.
23 => int veryLowNote; // 30.8677063285 Hz is low enough

// Counts the progress of the composition
0 => int totalBeats;
// Maximum number of passes through the AllNotes arrays
5 => int reps;

// Helper function that builds the path to a sample file.
fun string SamplePath(string fileBaseName)
{
    return me.dir() + "/audio/" + fileBaseName + ".wav";
}

// Choose a note and panning for this piano.  Returns the note number used.
fun int PlayPiano(int noteIndex, int whichPiano)
{
    // Turn the note on for the selected piano and off for others
    for (0 => int i; i < pianos.cap(); i++)
    {
        if ( i == whichPiano )
        {
            1 => pianos[i].noteOn;
        }
        else
        {
            1 => pianos[i].noteOff;
        }
    }

    // Randomly choose what octave to shift this note to and panning location
    Math.random2(lowOctave,highOctave)*octave => int shift;
    AllNotes[whichPiano][noteIndex] + shift => int midiNote;
    Std.mtof(midiNote) => pianos[whichPiano].freq;
    Math.random2f(-1.0,1.0) => pianoPans[whichPiano].pan;

    return midiNote;
}

// Handle all pianos for this beat.  Returns the note number used.
fun int PlayPianos(int beatIndex)
{
    -1 => int midiNote;
    // Only play a note if the array requests it
    if (TopNotes[beatIndex] > 0)
    {
        // For the first pass through the arrays, only play one piano
        if (totalBeats / TopNotes.cap() < 1)
        {
            PlayPiano(beatIndex, topIndex) => midiNote;
        }
        else
        {
            // The three pianos play separately in successive beats
            totalBeats % 3 => int mod;
            if (mod == 0)
            {
                PlayPiano(beatIndex, topIndex) => midiNote;
            }
            else if (mod == 1)
            {
                PlayPiano(beatIndex, middleIndex) => midiNote;
            }
            else if (mod == 2)
            {
                PlayPiano(beatIndex, bottomIndex) => midiNote;
            }
        }
    }
    return midiNote;
}

// Found a sound that I liked, so for one pass through the AllNotes array,
// only play two of the pianos in a different way.
fun void PlayPianoBreak(int index)
{
    // Choose the octave shift randomly, but in a special narrower range
    Math.random2(-1,1) * octave => int shift;
    AllNotes[0][index] + shift => int note;
    
    // During initial development, I miscoded this to play if note > 0.  This
    // seemed correct because the values in the AllNotes array use '-1' to
    // indicate that the note should not be played.  However, this comparison is
    // using 'note' which could be adjusted up an octave from the value at
    // AllNotes[0][index].  'note' could be MIDI note 11 (-1 + 12), which is out
    // of the intended range.  When I heard the sound (kind of a clang), I actually
    // liked the way it fit into the sound design, so when PlayPianoBreak is
    // called, this "miscoding" is intentionally used.
    if (note > 0)
    {
        // Play the pianos separately in successive beats
        if (totalBeats % 2)
        {
            1 => pianos[0].noteOn => pianos[1].noteOff;
            Std.mtof(note) => pianos[0].freq;
            Math.random2f(-1.0,1.0) => pianoPans[0].pan;
        }
        else
        {
            1 => pianos[1].noteOn => pianos[0].noteOff;
            AllNotes[1][index] + shift => int otherNote;
            Std.mtof(otherNote) => pianos[1].freq;
            Math.random2f(-1.0,1.0) => pianoPans[1].pan;
        }
    }
}

// Choose the percussion for this beat
fun void PlayPercussion(int drums)
{
    if (drums > 0)
    {
        // drums were requested.  The range for random2 is intentionally
        // greater than the length of the Perc array to make it possible
        // to randomly skip the drum for this beat (if index is out of range).
        Math.random2(0,Perc.cap()+3) => int index;
        if (index < Perc.cap())
        {
            SamplePath(Perc[index]) => percussion.read;
            0 => percussion.pos;
            drumGain => percussion.gain;
        }
    }
    else
    {
        // If drums were not requested, play a random hihat
        SamplePath(Hihats[Math.random2(0,Hihats.cap()-1)]) => percussion.read;
        0 => percussion.pos;
        hihatGain => percussion.gain;
    }
}

// Choose the bass note for this beat.  Pick a note some octave(s)
// below the passed in note.
fun void PlayBass(int midiNote)
{
    if (midiNote > 0)
    {
        // random2 helps choose to play a new bass note 4 out of 5
        // times.  If 0 is chosen by random2, no new note is played
        // so the previous note (or rest) will continue.
        if (Math.random2(0,5) != 0)
        {
            // If a note lower than the specified limit is passed in,
            // raise the note an octave.  In this program's use, the
            // passed in midiNote will never be greater than one octave
            // below the limit.
            if (midiNote < veryLowNote)
            {
                octave +=> midiNote;
            }
            else
            {
                // Keep a deep, rumbling bass. Set the midiNote down
                // an octave at a time until it is as close to the lower
                // limit as possible.
                while (midiNote - octave > veryLowNote)
                {
                    octave -=> midiNote;
                }
            }
            Std.mtof(midiNote) => sinBass.freq => triBass.freq;
        }
    }
    else
    {
        // Turn off bass if it was not requested
        0 => sinBass.freq => triBass.freq;
    }
}

// At the end, hold a single piano note and fade everything else.
fun void finish()
{
    // Added a different Rhodey to experiment with ADSR.  The documentation is
    // limited for ADSR, so I tried a few things to try to guess how it works.
    // There may be better ways to use it.
    Rhodey ultima => JCRev jcr2 => ADSR env => master;
    0.8 => ultima.gain;
    0.8 => jcr2.gain;
    0.2 => jcr2.mix;
    ( 200::ms, 100::ms, 0.7, 100::ms ) => env.set;
    0.01 => env.releaseRate;
    TopNotes[totalBeats % TopNotes.cap()] => int lastNote;
    Std.mtof(lastNote) => ultima.freq;
    1 => ultima.noteOn => topPiano.noteOff => bottomPiano.noteOff => middlePiano.noteOff;
    end - now => env.duration;
    end-100::ms => time lastCheckpoint;
    1 => env.keyOn;
    while (now < lastCheckpoint)
    {
        // Fade out the original sound producers
        pianosPan.gain() * 0.9 => pianosPan.gain;
        percussion.gain() * 0.95 => percussion.gain;
        sinBass.gain() * 0.95 => sinBass.gain => triBass.gain;
        20::ms => now;
    }
    1 => ultima.noteOff;
    1 => env.keyOff;
    end - now => now;
}

// The main while loop runs through the AllNotes arrays 'reps' number of times
// and stops just before the last note that sounds.  That will be handled in the
// finish() function.
while (totalBeats < TopNotes.cap() * reps - 5)
{
    totalBeats % TopNotes.cap() => int index;
    if ( (totalBeats / TopNotes.cap()) % 10 == 2)
    {
        // Play the special piano duet for one pass through the arrays.
        // No bass or percussion for this section.
        PlayPianoBreak(index);
    }
    else
    {
        // Otherwise, call the functions that know how to set up
        // the instruments.
        PlayPianos(index) => int midiNote; // PlayPianos() returns the note played
        PlayPercussion(midiNote);
        PlayBass(midiNote);  // bass note is some number of octaves below the piano note
    }
    
    // 0.75 second quarter notes.  Use the sixteenth note as the timing
    // element in the loop for granularity.
    (sixteenth)::ms => now;
    
    totalBeats++;
    
    // This code increases the number of octaves that the piano
    // notes might be shifted over the course of the composition.
    if (totalBeats % (TopNotes.cap() / 4 * 5) == 0)
    {
        if (lowOctave > -2)
        {
            1 -=> lowOctave;
        }
        if (highOctave < 2)
        {
            1 +=> highOctave;
        }
    }
}

finish();

<<< "Duration =", (now-start)/second >>>;
