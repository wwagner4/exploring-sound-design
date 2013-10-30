// Ness Morris- Assignment 2
// Fibonacci modulo

SerialIO sio;
TriOsc s=>LPF l=>Pan2 p=>dac;
TriOsc t=>LPF m=>Pan2 q=>dac;
0=>s.gain=>t.gain;
float data[3];
200=>float fund;
[1.0, 10.0/9.0, 32.0/27.0, 4.0/3.0, 3.0/2.0, 8.0/5.0, 9.0/5.0]@=>float ratios[];

openSerial(sio,"/dev/cu.usbmodem3a21");

2::second=>now;
now+25::second=>time fadeOut;

0.6=>s.gain=>t.gain;
spork~panLoop();
spork~serialLoop(160::ms);

fadeOut=>now;

p.gain()/(5000.0)=>float fadeQuantum;
while(p.gain()>0){
    p.gain(p.gain()-fadeQuantum);
    q.gain(p.gain());
    ms=>now;
}

me.exit();

fun void serialLoop(dur d){
    for(int i;1;i++){
        d+now=>time nextNote;
        sio<=Std.itoa(i)<=IO.nl();
        sio.onLine()=>now;
        parse(sio.getLine(),data);
        fund*ratios[data[1]$int%7]=>s.freq;
        s.freq()*2=>l.freq;
        fund*ratios[data[2]$int%7]*2=>t.freq;
        t.freq()*2=>m.freq;
        chout<=data[1]<=", "<=data[2]<=", "<=data[0]<=IO.nl();
        if(nextNote>now)nextNote=>now;
        46%=>i;
    }
}

fun void panLoop(){
    SinOsc lfo=>blackhole;
    0.4=>lfo.gain;
    0.8=>lfo.freq;
    while(ms=>now){
        lfo.last()=>p.pan;
        lfo.last()*-1=>q.pan;
    }
}

fun void parse(string line, float data[]){
    string stringInts[0];
    data.size(0);
    if(RegEx.match("\\[([0-9]+),([0-9]+),([0-9]+)\\]",line,stringInts)){
        for(1=>int i;i<stringInts.cap();i++)data<<Std.atoi(stringInts[i]);
    }
}

fun void openSerial(SerialIO io,string path){
    0=>int opened;
    SerialIO.list()@=>string list[];
    for(int i;i<list.cap();i++){
        if(RegEx.match(path,list[i])){
            if(io.open(i,SerialIO.B9600,SerialIO.ASCII)){
                1=>opened;
                chout<="Opened "<=path<=IO.nl();
            }
        }
    }
    if(!opened)cherr<="Couldn't open "<=path<=IO.nl();
}
