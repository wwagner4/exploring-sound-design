//moog
Moog moog => dac;

//reference for timing
0.625::second => dur fourth;
fourth * 2 => dur half;
fourth * 4 => dur whole;
fourth / 2 => dur eighth;
fourth / 4 => dur sixteenth;
fourth / 8 => dur thirty2nd;

// scale
[46, 48, 49, 51, 56, 58] @=> int scale[];

while( true )
{
  playMoog();   
  }
  
  fun void playMoog(){
  //set parameters
    Math.random2f( 0, 1 ) => moog.filterQ;
    Math.random2f( 0, 1 ) => moog.filterSweepRate;
    Math.random2f( 4, 8 ) => moog.lfoSpeed;
    Math.random2f( 0, .1 ) => moog.lfoDepth;
    Math.random2f( 0.3, .51 ) => moog.volume;
    
    // set freq
    scale[Math.random2(0,scale.cap()-1)]+12 => int note;
    note => Std.mtof => moog.freq;
    
    //set volume
    .6 => moog.noteOn;
    
    Math.random2(1,2) => int multiple;
    Math.random2(1,2) * multiple=>  multiple;
    // advance time
    eighth*multiple => now;
}