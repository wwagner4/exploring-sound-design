<<< "Assignment_2_ArrayWhereAreYou.ck" >>>;

// unit generators, set to pan
SinOsc s => Pan2 p1 => dac;
TriOsc t => Pan2 p2 => dac;
SqrOsc q => Pan2 p3 => dac;
SawOsc w => Pan2 p4 => dac;

// our D scale
[50, 52, 53, 55, 57, 59, 60, 62] @=> int dScale[];
// 1/8, 1/4, 1/2 notes
[0.125, 0.25, 0.5] @=> float notes[];  

// melody
[1, 5, 6, 4, 6, 5, 3] @=> int riffPitch[];
[2, 1, 1, 1, 1, 0, 0] @=> int riffNotes[];

[6, 4, 3, 2, 3, 5, 1] @=> int riffPitch2[];
[2, 1, 1, 1, 1, 0, 2] @=> int riffNotes2[];


// time
now + 30::second => time endTime;
.25::second => dur quarter;

now / second => float startTime;
while( now < endTime )
{
    // melody with panning
    0.3 => s.gain; 0.2 => t.gain; 0 => q.gain => w.gain;
    for(0 => int h; h < 3; h++)
    {
        Math.random2f(-1,1) => p1.pan;
        Math.random2f(-1,1) => p2.pan;
        
        for(0 => int i; i < riffPitch.cap(); i++)
        {
            Std.mtof(dScale[-1+riffPitch[i]]) => s.freq;
            Std.mtof(12+dScale[-1+riffPitch[i]]) => t.freq;
            notes[riffNotes[i]]::second => dur noteLength;
            if(now+noteLength < endTime) 
            {
                noteLength => now;
            }
        }
    }
    
    // a little random fun
    0.3 => s.gain; 0.2 => t.gain; 0.03 => q.gain; 0.03 => w.gain;
    <<< "random section" >>>;
    for(0 => int i; i <= 15; i++)
    {    
        Std.mtof(dScale[Math.random2(0,dScale.cap()-1)]) => s.freq;
        Std.mtof(dScale[Math.random2(0,dScale.cap()-1)]) => t.freq;
        Std.mtof(dScale[Math.random2(0,dScale.cap()-1)]) => q.freq;
        Std.mtof(dScale[Math.random2(0,dScale.cap()-1)]) => w.freq;

        notes[Math.random2(0,2)]::second => dur noteLength;
        
        if(now+noteLength < endTime) 
        {
            noteLength => now;
        }
    }

    // cos control panning
    0.3 => s.gain; 0.2 => t.gain; 0 => q.gain => w.gain;
    for(0 => int i; i <= 360; i+15 => i)
    {
        Std.mtof(dScale[Math.random2(0,dScale.cap()-1)]) => s.freq;
        Std.mtof(dScale[Math.random2(0,dScale.cap()-1)]) => t.freq;
        
//        <<< "cos: degree ",i," radian", Math.cos(i * (pi / 180)) >>>;
        Math.cos(i*(pi / 180)) => p1.pan;
        Math.sin(i*(pi / 180)) => p2.pan;

        notes[0]::second => dur noteLength;
        if(now+noteLength < endTime) 
        {
            noteLength => now;
        }
    }
    
    
   
    (endTime-now) => dur remainderTime;
    if(remainderTime <= 10::second)
    {
        -0.5 => p1.pan; 0.5 => p2.pan;
        0.2 => s.gain; 0.2 => t.gain; 0 => q.gain => w.gain;
        for(0 => int i; i < riffPitch.cap(); i++)
        {
            Std.mtof(dScale[-1+riffPitch2[i]]) => s.freq;
            Std.mtof(-12+dScale[-1+riffPitch2[i]]) => t.freq;
            notes[riffNotes2[i]]::second => dur noteLength;
            if(now+noteLength < endTime) 
            {
                noteLength => now;
            }
        }
    }
    
    if(remainderTime <= 1::second)
    {
        remainderTime => now;
    }
    
    <<< "now ",(now / second) - startTime >>>;
}

<<< "thanks for listening to melody" >>>;