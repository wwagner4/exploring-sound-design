  /* ******************************************
                Author: Rafal Pieterczyk
                Datum:  02/12/2013
                Note:   Assignment_6_perc
            ******************************************* */


            <<< " perc" >>>;

        //sound network
        SndBuf snare =>  dac;
        SndBuf kick => dac;
        SndBuf hh => NRev revs => dac;
        
        // files
        me.dir(-1) + "/audio/snare_01.wav" => snare.read;
        me.dir(-1) + "/audio/kick_01.wav" => kick.read;
        me.dir(-1) + "/audio/hihat_02.wav" => hh.read;
        
       
        
        //parameters
        0.05 => revs.mix;
        .4 => kick.gain;
        .4 => snare.gain;
        .25 => hh.gain;   
        
         0 => int count;
         
         .625 => float timebase;// base timing
         

        
        while(true)
{
    //counter definition
    count % 8 => int beat;
    //kick
    if ((beat == 0) || (beat == 4))
    {
        0 => kick.pos;
    }
    // snare on 2 and 6
     if ((beat ==2) || (beat == 6))
    {
        0 => snare.pos;
       1.2 => snare.rate;
    }
    
    // hihat posiion
    
    0 => hh.pos;
    .4 => hh.gain;
    1.0 => hh.rate;
    
     count++;
    
    (timebase::second )/2 => now; 
}