//Assignment_1_Just_Buzzing
//  Sound Network
SinOsc s => dac;
SqrOsc t => dac;
TriOsc q => dac;

// playing  t, s q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.1 => q.gain;

100 => t.freq;
  300 => s.freq;
  50 => q.freq;
0.6::second => now;

// changing s frequency
0.5 => t.gain;
0.5 => s.gain;
0.5 => q.gain;

100 => t.freq;
  200 => s.freq;

0.6::second => now;

// // looping a series of notes using for
0.5 => t.gain;
0.8 => s.gain;
0.2 => q.gain;

for ( 0 => int i; i < 5; i++ )
{    
   i*3 => t.freq;
   i*3 => s.freq;
  
0.005::second => now;

//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

100 => t.freq;
200 => s.freq;
0.3::second => now;

// changing frequencies
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;

2000 => t.freq;
1300 => s.freq;

0.1::second => now;

// now frequencies remain the same
// only play q
0 => t.gain;
0 => s.gain;
0.5 => q.gain;


0.1::second => now;

// playing s,t and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;


// only play q
0 => t.gain;
0 => s.gain;
0.9 => q.gain;


0.1::second => now;


//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

1::second => now;


//again

// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;

// only play q
0 => t.gain;
0 => s.gain;
0.5 => q.gain;


0.1::second => now;
// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;


// only play q
0 => t.gain;
0 => s.gain;
0.9 => q.gain;


0.1::second => now;


// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;

// only play q
0 => t.gain;
0 => s.gain;
0.5 => q.gain;


0.1::second => now;
// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;

//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

0.3::second => now;

}

// using while
0 => t.gain;
0.8 => s.gain;
0.1 => q.gain;

1000 => int i;

while ( i < 1005 )
 { 
  i => q.freq;
    0.2::second => now;
    i++;
}

//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

0.3::second => now;


// playing t and s
0.5 => t.gain;
0.8 => s.gain;
0 => q.gain;

6000 => t.freq;
  200 => s.freq;

0.6::second => now;

// playing t and s
0.5 => t.gain;
0.5 => s.gain;
0.5 => q.gain;

100 => t.freq;
  300 => s.freq;

0.6::second => now;




// repeating the loop
0.5 => t.gain;
0.8 => s.gain;
0.2 => q.gain;

for ( 0 => int i; i < 5; i++ )
{    
   i*3 => t.freq;
   i*3 => s.freq;
  
0.005::second => now;

//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

100 => t.freq;
200 => s.freq;
0.3::second => now;

// changing frequencies
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;

2000 => t.freq;
1300 => s.freq;

0.1::second => now;

// now frequencies remain the same
// only play q
0 => t.gain;
0 => s.gain;
0.5 => q.gain;


0.1::second => now;

// playing s,t and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;


// only play q
0 => t.gain;
0 => s.gain;
0.9 => q.gain;


0.1::second => now;


//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

1::second => now;


//again

// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;

// only play q
0 => t.gain;
0 => s.gain;
0.5 => q.gain;


0.1::second => now;
// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;


// only play q
0 => t.gain;
0 => s.gain;
0.9 => q.gain;


0.1::second => now;


// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;

// only play q
0 => t.gain;
0 => s.gain;
0.5 => q.gain;


0.1::second => now;
// playing t,s and q at the same time
0.5 => t.gain;
0.8 => s.gain;
0.5 => q.gain;


0.1::second => now;

//Break
0 => t.gain;
0 => s.gain;
0 => q.gain;

0.3::second => now;

}

