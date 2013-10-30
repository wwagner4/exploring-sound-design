//First Assignement_1_BearSpace, the Maximally Efficient Cognitive Machine
// Time: Approximately 31 seconds


// sound system
SqrOsc s => dac;

// Arpeggio

// D7
// Set volume to 0.3
0.3 => s.gain;
// Set frequency to 2349.32
2349.32 => s.freq;
// play for 0.3 second
.3::second => now;

// C7
//Set volume to 0.5
0.5 => s.gain;
// Set frequency to 2093.00
2093.00 => s.freq;
// play for 0.3 second
.3::second => now;

// B6
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1975.53
1975.53 => s.freq;
// play for 0.3 second
.3::second => now;

// A6
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1760
1760.00 => s.freq;
// play for 0.2 second
.2::second => now;

// G6
//Set volume to 0.5
0.5 => s.gain;
//set frequency to 1567.98
1567.98 => s.freq;
// play for 0.2 secong
.2::second => now;

// F6
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1396.91
1396.91 => s.freq;
// play for 0.2 second
.2::second => now;

// E6
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1318.51
1318.51 => s.freq;
// play for 0.2 second
.2::second => now;

// D6
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1174.66
1174.66 => s.freq;
// play for 0.2 second
.2::second => now;

// C6
//set volume to 0.5
0.5 => s.gain;
// set frequency to 2093/2
2093.00/2 => s.freq;
//play for 0.2 second
.2::second => now;

// B5
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1975.53/2
1975.53/2 => s.freq;
// play for 0.2 second
.2::second => now;

// A5
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1760/2
1760.00/2 => s.freq;
// play for 0.1 seconds
.1::second => now;

// G5
//Set volume to 0.5
0.5 => s.gain;
// set frquency to 1567.98/2
1567.98/2 => s.freq;
// play for 0.1 second
.1::second => now;

// F5
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1396.91/2
1396.91/2 => s.freq;
// play for 0.1 second
.1::second => now;

// E5
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1318.51/2
1318.51/2 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//Set volume to 0.5
0.5 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
// play for 0.1 second
.1::second => now;

// C5
//set volume to 0.5
0.5 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// B4
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1975.53/4
1975.53/4 => s.freq;
//play for 0.1 second
.1::second => now;

// A4
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// G4
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1567.98/4
1567.98/4 => s.freq;
// play for 0.1 second
.1::second => now;

// F4
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1396.91/4
1396.91/4 => s.freq;
// play for 0.1 second
.1::second => now;

// E4
//set volume to 0.5
0.5 => s.gain;
//set frequency to 1318.51/4
1318.51/4 => s.freq;
// play for 0.1 second
.1::second => now;

// D4
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1174.66/4
1174.66/4 => s.freq;
//play for 0.1 second
.1::second => now;

// C4
//set volume to 0.5
0.5 => s.gain;
// set frequency to 2093.00//8
2093.00/8 => s.freq;
// play for 0.1 second
.1::second => now;

// B3
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1975.53/8
1975.53/8 => s.freq;
//play for 0.1 second
.1::second => now;

// A3
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1760.00/8
1760.00/8 => s.freq;
// play for 0.1 second
.1::second => now;

// G3
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1567.98/8
1567.98/8 => s.freq;
// play for 0.1 second
.1::second => now;

// F3
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1396.91/8
1396.91/8 => s.freq;
// play for 0.1 second
.1::second => now;

// E3
//set volume to 0.5
0.5 => s.gain;
//set frequency to 1318.51/8
1318.51/8 => s.freq;
// play for 0.1 second
.1::second => now;

// D3
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1174.66/8
1174.66/8 => s.freq;
//play for 0.1 second
.1::second => now;

// C3
//set volume to 0.5
0.5 => s.gain;
// set frequency to 2093.00/16
2093.00/16 => s.freq;
// play for 0.1 second
.1::second => now;

// B2
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1975.53/16
1975.53/16 => s.freq;
//play for 0.1 second
.1::second => now;

// A2
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1760.00/16
1760.00/16 => s.freq;
// play for 0.1 second
.1::second => now;

// G2
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1567.98/16
1567.98/16 => s.freq;
// play for 0.1 second
.1::second => now;

// F2
//set volume to 0.5
0.5 => s.gain;
// set frequency to 1396.91/16
1396.91/16 => s.freq;
// play for 0.1 second
.1::second => now;

// E2
//set volume to 0.5
0.5 => s.gain;
//set frequency to 1318.51/16
1318.51/16 => s.freq;
// play for 0.1 second
.1::second => now;

// D2
//set volume to 0.5
0.2 => s.gain;
// set frequency to 1174.66/16
1174.66/16 => s.freq;
//play for 3 second
3::second => now;

// for loop
for ( 0 => int i; i<50; i++)
{
    <<< i >>>;
    if( i < 3)
    {
        //set volume to 0.1
0.1 => s.gain;
// set frequency to 76.4162
76.4162 => s.freq;
//play for 0.1 second
0.1::second => now;
    }
    else if( ( i > 5) && ( i < 9)){
        //set volume to 0.1
0.1 => s.gain;
// set frequency to 79.4162
79.4162 => s.freq;
//play for 0.1 second
0.1::second => now;
    }
    else if( ( i > 12) && ( i < 17)){
        //set volume to 0.1
0.1 => s.gain;
// set frequency to 82.4162
82.4162 => s.freq;
//play for 0.1 second
0.1::second => now;
    }
    else if( ( i > 21) && ( i < 28)){
        //set volume to 0.1
0.1 => s.gain;
// set frequency to 88.4162
88.4162 => s.freq;
//play for 0.1 second
0.1::second => now;
    }
    else if( i > 30){
        //set volume to 0.1
0.1 => s.gain;
// set frequency to 93.4162
93.4162 => s.freq;
//play for 0.1 second
0.1::second => now;
    }
    else{
    //set volume to 0.1
0.1 => s.gain;
// set frequency to 73.4162
73.4162 => s.freq;
//play for 0.1 second
.1::second => now;
    }
}

// initializing variable h
93 => int h;

while( h < 587.33 )
{
    h => s.freq;
    <<< h >>>;
    0.01::second => now;
    h++;
}

// D minor scale 3 times
for( 0 => int i; i<3; i++)
{
// D5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
// play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// Bb4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 466.164
466.164 => s.freq;
//play for 0.1 second
.1::second => now;

// A4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// G4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/4
1567.98/4 => s.freq;
// play for 0.1 second
.1::second => now;

// F4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1396.91/4
1396.91/4 => s.freq;
// play for 0.1 second
.1::second => now;

// E4
//set volume to 0.1
0.1 => s.gain;
//set frequency to 1318.51/4
1318.51/4 => s.freq;
// play for 0.1 second
.1::second => now;

// D4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/4
1174.66/4 => s.freq;
//play for 0.1 second
.1::second => now;

// E4
//set volume to 0.1
0.1 => s.gain;
//set frequency to 1318.51/4
1318.51/4 => s.freq;
// play for 0.1 second
.1::second => now;

// F4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1396.91/4
1396.91/4 => s.freq;
// play for 0.1 second
.1::second => now;

// G4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/4
1567.98/4 => s.freq;
// play for 0.1 second
.1::second => now;

// A4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// Bb4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 466.164
466.164 => s.freq;
//play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;
}

// F scale 2 times
for( 3 => int i; i<5; i++)
{
    // F5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1396.91/2
1396.91/2 => s.freq;
// play for 0.1 second
.1::second => now;

// E5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1318.51/2
1318.51/2 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
// play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// Bb4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 466.164
466.164 => s.freq;
//play for 0.1 second
.1::second => now;

// A4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// G4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/4
1567.98/4 => s.freq;
// play for 0.1 second
.1::second => now;

// F4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1396.91/4
1396.91/4 => s.freq;
// play for 0.1 second
.1::second => now;

// G4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/4
1567.98/4 => s.freq;
// play for 0.1 second
.1::second => now;

// A4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// Bb4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 466.164
466.164 => s.freq;
//play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
// play for 0.1 second
.1::second => now;

// E5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1318.51/2
1318.51/2 => s.freq;
// play for 0.1 second
.1::second => now;
}

// G scale 1 time
for( 5 => int i; i<6; i++)
{
   // G5
//Set volume to 0.1
0.1 => s.gain;
// set frquency to 1567.98/2
1567.98/2 => s.freq;
// play for 0.1 second
.1::second => now;
    
    // F#5
//Set volume to 0.1
0.1 => s.gain;
// set frquency to 1567.98/2
739.989 => s.freq;
// play for 0.1 second
.1::second => now;
    
    // E5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1318.51/2
1318.51/2 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
// play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// B4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1975.53/4
1975.53/4 => s.freq;
//play for 0.1 second
.1::second => now;

// A4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// G4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/4
1567.98/4 => s.freq;
// play for 0.1 second
.1::second => now;

// A4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/4
1760.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// B4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1975.53/4
1975.53/4 => s.freq;
//play for 0.1 second
.1::second => now;


// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
// play for 0.1 second
.1::second => now;

// E5
//Set volume to 0.1
0.1 => s.gain;
// set frequency to 1318.51/2
1318.51/2 => s.freq;
// play for 0.1 second
.1::second => now;

// F#5
//Set volume to 0.1
0.1 => s.gain;
// set frquency to 1567.98/2
739.989 => s.freq;
// play for 0.1 second
.1::second => now;
}

// Bb scale 2 times
for( 6 => int i; i<8; i++)
{
    
    // Bb5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 466.164*2
466.164*2 => s.freq;
//play for 0.1 second
.1::second => now;

// A5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/2
1760.00/2 => s.freq;
// play for 0.1 second
.1::second => now;

// G5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/2
1567.98/2 => s.freq;
// play for 0.1 second
.1::second => now;

// F5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1396.91/2
1396.91/2 => s.freq;
// play for 0.1 second
.1::second => now;

// Eb5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 311.127*2
311.127*2 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
//play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// Bb4
//set volume to 0.1
0.1 => s.gain;
// set frequency to 466.164
466.164 => s.freq;
//play for 0.1 second
.1::second => now;

// C5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 2093.00/4
2093.00/4 => s.freq;
// play for 0.1 second
.1::second => now;

// D5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1174.66/2
1174.66/2 => s.freq;
//play for 0.1 second
.1::second => now;

// Eb5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 311.127*2
311.127*2 => s.freq;
// play for 0.1 second
.1::second => now;

// F5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1396.91/2
1396.91/2 => s.freq;
// play for 0.1 second
.1::second => now;

// G5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1567.98/2
1567.98/2 => s.freq;
// play for 0.1 second
.1::second => now;

// A5
//set volume to 0.1
0.1 => s.gain;
// set frequency to 1760.00/2
1760.00/2 => s.freq;
// play for 0.1 second
.1::second => now;
}

//Bb5
//set volume to 3
0.1 => s.gain;
// set frequency to 466.164*2
466.164*2 => s.freq;
//play for 0.1 second
1::second => now;