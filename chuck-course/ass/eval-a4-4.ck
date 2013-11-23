//Assignment #4 - Techno Functionality

// Set master volume control and chuck to dac
Gain master => dac;

// Create sound chain for each sound sample and chuck to Master gain

SndBuf kick=> master;
SndBuf snare=> master;
SndBuf hihat=> master;
SndBuf cowbell=> master;
SndBuf clap=> master;
SndBuf click=> master;

//Create sound chain for snare2 for drumroll and chuck to Gain snare2
SndBuf snare2 => dac;

//Load sound file for snare2 into Sndbuf
me.dir()+"/audio/snare_02.wav"=> snare2.read;
// Set playhead to the end so no sound plays at first
snare2.samples() => snare2.pos;

// Set up SinOsc for Arpeggio Notes with a Pan2 command to control panning later
SinOsc Notes=> Pan2 p => dac;

// Set up TriOsc for Chords

TriOsc chord[3];
//Control volume of chord
Gain t =>dac;
0=> t.gain; 

//Set up function to play chord - root, third and fifth

fun void playChord (int root, float length)
{
    Std.mtof(root) => chord[0].freq;
    Std.mtof(root+4) => chord[1].freq;
    Std.mtof(root+7) => chord[2].freq;
    length::ms=> now;
}

// Set master gain to 0 to start
0=> master.gain;

//Load sound files into SndBuf

me.dir()+"/audio/kick_01.wav"=> kick.read;
me.dir()+"/audio/snare_01.wav"=> snare.read;
me.dir()+"/audio/hihat_02.wav"=> hihat.read;
me.dir()+"/audio/click_01.wav"=> click.read;
me.dir()+"/audio/clap_01.wav"=> clap.read;
me.dir()+"/audio/cowbell_01.wav"=> cowbell.read;

// Set all playheads to the end so no sound plays at first

kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;
click.samples() => click.pos;
clap.samples() => clap.pos;
cowbell.samples() => cowbell.pos; 

// Declare arrays to control when the kick, snare and hihat play for variation 1 in Section1

[0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1]@=> int kickHits1[];
[0,1,0,0,0,1,0,0,1,0,0,0,1,0,1,1]@=> int snareHits1[];
[0,0,1,0,0,0,1,0,0,1,0,0,0,1,0,0]@=> int hihatHits1[];

// Declare arrays to control when the kick, snare and hihat play for variation 2 in Section1

[1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1]@=> int kickHits2[];
[0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0]@=> int snareHits2[];
[0,0,1,1,0,0,1,1,0,0,0,1,1,0,0,1]@=> int hihatHits2[];

// Declare arrays to control when the cowbell, clap and click play for Section2

[1,0,0,1,1,0,0,1,0,1,0,0,1,0,0,1]@=> int cowbellHits2[];
[0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0]@=> int clapHits2[];
[0,0,1,1,0,0,1,1,0,0,0,1,1,0,0,1]@=> int clickHits2[];

//Set up variables for Arpeggio

24 => int x;
12 => int y;

//Declare array for Notes Arpeggio

[(51-x), (55-x), (58-x), (63-x), (55-y), (58-y), (63-y), 55, 58, 63, (55+y), (58+y), (63+y), (55+x), (58+x), (63+x)]@=> int A [];

//Set up function to play different sections

fun void section1(int kickArray[], int snareArray[], int hihatArray[], float beattime)
//Set up the for loop to control section 1
{ 
    for (0 => int i;i< kickArray.cap(); i++)
    {
        if (kickArray[i] ==1)
          
        {
            0=> kick.pos;
        }
        
        if (snareArray[i] ==1)
        {
            0=> snare.pos;
        }
        
        if (hihatArray[i] ==1)
        {
            0=> hihat.pos;
        }
        
        beattime::second => now;
                
    } 
}
fun void section2(int cowbellArray[], int clapArray[], int clickArray[], float beattime)
//Set up the for loop to control section 2
{ 
    for (0 => int i;i< cowbellArray.cap(); i++)
    {
        if (cowbellArray[i] ==1)
            
            {
                0=> cowbell.pos;
            }
            
            if (clapArray[i] ==1)
            {
                0=> clap.pos;
            }
            
            if (clickArray[i] ==1)
            {
                0=> click.pos;
            }
            
            beattime::second => now;
            
        } 
    }
   
   // Create function for drum roll 
    fun int drumRoll (int index)
    { 
        if(index >=1)
        { 
            0 => snare2.pos;
            index::ms => now;
            return drumRoll (index-1);
        }
        else if (index== 0)
        {
            return 0;
        }
    } 
   
// Main Program 
//Create the for loop to play the Arpeggio Notes

for (0 => int i; i< A.cap(); i++)
{
    Std.mtof (A[i] )=> Notes.freq;
    .3=> Notes.gain;
    .3::second =>now;
    // Set random panning for the notes
    Math.random2f(-1.0,1.0)=> p.pan;
    <<< i,A[i]  >>>;   
} 

//Turn off volume for Notes and turn on volume for snare2
0=> Notes.gain;
1.0 => snare2.gain;
//Call function for drum roll
drumRoll (60);
// Turn off volume for snare 2 and turn on volume for master gain
0=> snare2.gain;
.8 => master.gain;
//Set time parameter and while loop for first play of section1 and section 2
now+8.7::second => time end;
while (now<end)
{
    section1(kickHits1, snareHits1, hihatHits1, .15);
    <<< " section1" >>>;
    section2(cowbellHits2, clapHits2, clickHits2, .15);
    <<< " section2" >>>;
    section1(kickHits2, snareHits2, hihatHits2, .15); 
    <<< " section1" >>>;
}
//Turn off volume for master gain
0=> master.gain;
// Create a for loop to play chords and adjust volume
for (0 => int i; i< chord.cap (); i++)
{
chord[i] => t;
.6/chord.cap() => t.gain; 

}
//Create while loop to play chords
now+1.8::second => time later;
while (now<later)
{
    playChord (51,250);
    
    playChord (63, 350);
    <<< "Playing Chords" >>>; 
}
//Turn off volume for chords and set volume for master gain
0=> t.gain; 
.8=> master.gain;
//Create while loop for second play of section2 and section1
now+4.8::second => time later2;
while (now<later2)
{
    section2(cowbellHits2, clapHits2, clickHits2, .15); 
    <<< " section2" >>>;
    section1(kickHits1, snareHits2, hihatHits2, .15);
    <<< " section1" >>>;
    section2(cowbellHits2, clapHits2, clickHits2, .15); 
    <<< " section2" >>>;
}

    
  
    

    



