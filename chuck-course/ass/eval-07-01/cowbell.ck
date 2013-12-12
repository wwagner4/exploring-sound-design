// tick.ck
// Not really a cowbell, this has two modalbar percussion instruments

// create a percussion 'ticker' assign it to the left channel
ModalBar ticker => NRev reverb => dac.left;
// set ticker parameters
.1 => reverb.mix;
7 => ticker.preset;
.9 => ticker.strikePosition;

// create a percussion 'tocker' assign it to the main channel
ModalBar tocker => Chorus c => PitShift ps => dac.right;
// set tocker parameters
.1 => c.modDepth;
10 => tocker.preset;
.9 => tocker.strikePosition;
0 => tocker.volume;

// make a conductor for our tempo 
// this is set and updated elsewhere
BPM tempo;

0 => int countTicks;
while (1)  {
    // update our basic beat each measure
    
    // play measure of eighths
    for (0 => int beat; beat < 16; beat++)  {
        // but only play on the last 8th
        if (beat == 15) {
            spork ~ tick();
            spork ~ tock();
        }
        if ( beat == 7) {
            spork ~ tock();
            
        }
        tempo.eighthNote => now;
    }
countTicks++;
}    
        // use ModalBar instead of hihat for drum pattern
    fun void tick()
    {
        tempo.eighthNote => dur eighth;
        tempo.quarterNote => dur quarter;
            1 => ticker.strike;
            quarter => now;
            0 => ticker.strike;
            .6 => ticker.strike;
            quarter => now;
            1 => ticker.strike;
            eighth => now;
     }
    // use ModalBar for an accent
    fun void tock()
    {
        tempo.eighthNote => dur eighth;
        tempo.quarterNote => dur quarter;
        0 => int counterr;
            1 => tocker.strike;
            eighth => now;
            0 => tocker.strike;
            .6 => tocker.strike;
            eighth => now;
            if ( counterr>8 )
            {
                0=> tocker.strike;
            }
    }
