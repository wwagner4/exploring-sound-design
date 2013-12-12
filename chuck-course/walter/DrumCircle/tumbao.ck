// tumbao.ck
// tumbao rhythm played on conga with global BPM conducting

// make a conductor for our tempo 
BPM tempo;

// tumbao is played on a conga and a tumba (kind of bass conga)
Conga conga;
conga.freq(200);
conga.gain(3.0);

Conga tumba;
tumba.freq(160);
tumba.gain(4.0);

// play a tumbao rhythm bar
// clave==2: B T S T B T O O	Conga
//
// clave==3: B T S     T O O	Conga
//			       O O			Tumba
fun void tumbao(int clave) {
	// 1    
	conga.bassTone();
    tempo.eighthNote => now;
    
	conga.touchTone();
    tempo.eighthNote => now;
    
	// 2
	conga.slapTone();
    tempo.eighthNote => now;
    
	if (clave == 2)
		conga.touchTone();
	else
		tumba.openTone();
	tempo.eighthNote => now;
	
	// 3
	if (clave == 2)
		conga.bassTone();
	else
		tumba.openTone();
	tempo.eighthNote => now;
    
	conga.touchTone();
    tempo.eighthNote => now;
    
	// 4
	conga.openTone();
    tempo.eighthNote => now;
    
	conga.openTone();
    tempo.eighthNote => now;
}

while (true) {
	tumbao(2);
	tumbao(3);
}
