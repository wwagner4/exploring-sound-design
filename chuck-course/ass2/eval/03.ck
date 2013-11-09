//Title: Assignment_2_Randomandonandon
<<<"Assignment 2 - Randomandonandon">>>;

//declare oscillators, feed into Pan and DAC.
SinOsc sin => Pan2 panLeft => dac;
TriOsc tri => Pan2 panRight => dac;
SawOsc saw => Pan2 panLeftFront => dac;
SqrOsc sqr => Pan2 panRightFront => dac;
Noise noise => Pan2 panNoise => dac;

//set Panning positions
-1.0 => panLeft.pan;
1.0 => panRight.pan;
-0.25 => panLeftFront.pan;
0.25 => panRightFront.pan;
0 => panNoise.pan;

//declare array holding D Dorian note integers
[50, 52, 53, 55, 57, 59, 60, 62] @=> int dorianArr[];

// A general purpose int
0 => int counter; 

//set seed used for random numbers
Math.srandom(30);

//Find time 30 seconds from now to measure song length
now + 30::second => time songLength;

//print out time remaining
<<< "time remaining: ", (songLength-now)/second >>>;

//loop creates 120 repetitions of 0.25 seconds (total 30 seconds)
for ( 0 => int i; i < 120; i++ )
{
    if(i<28)
    {
        //set volumes (sin and tri are random volume)
        Math.random2f(0,0.2) => sin.gain;
        Math.random2f(0,0.2) => tri.gain;
        0 => saw.gain;
        0 => sqr.gain;
        
        //play note in array position determined by 'counter'
        Std.mtof(dorianArr[counter]) => sin.freq;
        Std.mtof(dorianArr[counter]) => tri.freq;
        
        //increment counter
        counter++;
        
        //reset counter when it is above number of values in array
        if (counter==8)
        {
            0 => counter;
        }
        
    }
    
    if(i<32 && i>27) // if i is less than 32 AND greater than 27
    {
        //set volumes
        0.2 => sin.gain;
        0.2 => tri.gain;
        .05 => saw.gain;
        .05 => sqr.gain;
        
        //play note in array position determined by 'counter'
        Std.mtof(dorianArr[counter]) => sin.freq;
        Std.mtof(dorianArr[counter]) => tri.freq;
        Std.mtof(dorianArr[counter]) => saw.freq;
        Std.mtof(dorianArr[counter]) => sqr.freq;
        
        //decrement counter
        counter--; 
    }
    
    if((i<60 && i>30) || (i>90 && i<116))// if i is less than 60 AND greater than 30
                                         // OR if i is greater than 90 AND less than 116
    {
        //generate four random integers between 50-62
        Math.random2(50,62) => int rand1;
        Math.random2(50,62) => int rand2;
        Math.random2(50,62) => int rand3;
        Math.random2(50,62) => int rand4;
        for ( 0 => int j; j < dorianArr.cap(); j++ )
        {
            //play notes in array position determined by rand being equal to a value in array
            //(this is just another way of finding a note in the scale other than using the counter method)
            if (rand1 == dorianArr[j])
            {
                Std.mtof(dorianArr[j]) => sin.freq;
            }
            if (rand2 == dorianArr[j])
            {
                Std.mtof(dorianArr[j]) => tri.freq;
            }
            if (rand3 == dorianArr[j])
            {
                Std.mtof(dorianArr[j]) => saw.freq;
            }
            if (rand4 == dorianArr[j])
            {
                Std.mtof(dorianArr[j]) => sqr.freq;
            }
            
            //A different way of generating random values in the scale of D Dorian.
            // random number between 0-7(dorianArr.cap-1) +24 which is 2 octaves up.
            Std.mtof( 24 + dorianArr[Std.rand2(0,dorianArr.cap()-1)] ) => sqr.freq;
            
            //set volumes
            Math.random2f(0,0.2) => sin.gain;
            Math.random2f(0,0.2) => tri.gain;
            Math.random2f(0,0.1) => saw.gain;
            Math.random2f(0,0.05) => sqr.gain;
        }
    }
    
    

    if(i<90 && i>58) // if i is less than 90 and greater than 58
    {
        
        if (i%2==0) // true if 'i' is an even number
        {
            //generate random int between 0-7
            Math.random2(0,7) => int rand1;
            
            //play note in array position determined by rand1
            Std.mtof(dorianArr[rand1]) => sin.freq;
            Std.mtof(dorianArr[rand1]) => tri.freq;
            
            //set random gain
            Math.random2f(0,0.2) => sin.gain;
            Math.random2f(0,0.2) => tri.gain;
            
        }
        if (i%4==0) // true on every 4th pulse
        {
            //generate random int between 0-7
            Math.random2(0,7) => int rand1;
            
            //play note in array position determined by rand1
            Std.mtof(dorianArr[rand1]) => saw.freq;
            Std.mtof(dorianArr[rand1]) => sqr.freq;
            
            //set random gain
            Math.random2f(0,0.05) => saw.gain;
            Math.random2f(0,0.05) => sqr.gain;
            
        }
        else
        {
            //set all volumes off
            0 => sin.gain;
            0 => tri.gain;
            0 => saw.gain;
            0 => sqr.gain;
        }        
    }
    
    //last 4 notes
    if (i>116)
    {
        if(counter < 5)
        {
            7 => counter;
        }
        Std.mtof(dorianArr[counter]) => sin.freq;
        Std.mtof(dorianArr[counter]) => tri.freq;
        Std.mtof(dorianArr[counter]) => saw.freq;
        Std.mtof(dorianArr[counter]) => sqr.freq;
        .03 => noise.gain;
        Math.random2f(-1,1) => panNoise.pan;
        counter--; 
    }
    
    //Make a noise generator sound alternately on and off on each pulse
    if (i%2==0 && (i>32 && i<116)) // true if 'i' is an even number
                                   // (only when i is between 33-115)
    {
        .03 => noise.gain;
        
        //set a random pan position for each noise played
        Math.random2f(-1,1) => panNoise.pan;
    }
    else
    {
        0 => noise.gain;
    }
    
    //set pulse of song to 0.25 (quarter beats)
    //each note is determined in the code and time advances here
    0.25::second => now;
}
    
//print out time remaining
<<< "time remaining: ", (songLength-now)/second >>>;
