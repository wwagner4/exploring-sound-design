// sound chain
TriOsc s => Pan2 p => dac;

// D Dorian scale
[50, 52, 53, 55, 57, 59, 60, 62] @=> int D[];

// volume
0.5 => float volume;

<<< "Start: ", now / second >>>;

// set volume
volume => s.gain;

// to high
for ( 0 => int i; i < D.cap(); i++ )
{
	// calculate pan : left -> right
	((1.0 * i) / (D.cap() - 1)) * 2 - 1 => float pan;
	pan => p.pan;
	
	// sound
	Std.mtof(D[i]) => s.freq;
	0.25::second => now;
}

// to low
for ( D.cap()-1 => int i; i >= 0 ; i-- )
{
	// calculate pan : right -> left
	((1.0 * i) / (D.cap() - 1)) * 2 - 1 => float pan;
	pan => p.pan;
	
	// sound
	Std.mtof(D[i]) => s.freq;
	0.25::second => now;
}

0.0 => p.pan;

// to high
for ( 0 => int d; d < D.cap()-2; d++)
{
	// play 2 times
	for ( 0 => int i; i < 2; i++ )
	{
		// sound
		Std.mtof(D[d]) => s.freq;
		0.25::second => now;
		
		Std.mtof(D[d+2]) => s.freq;
		0.25::second => now;
	}
}

// to low
for ( D.cap()-1 => int d; d > 1; d--)
{
	// play 2 times
	for ( 0 => int i; i < 2; i++ )
	{
		// sound
		Std.mtof(D[d]) => s.freq;
		0.25::second => now;
		
		Std.mtof(D[d-2]) => s.freq;
		0.25::second => now;
	}
}

// to high
for ( 0 => int d; d < D.cap()-4; d++)
{
	// play 2 times
	for ( 0 => int i; i < 2; i++ )
	{
		Std.mtof(D[d]) => s.freq;
		0.25::second => now;
		
		Std.mtof(D[d+2]) => s.freq;
		0.25::second => now;
		
		Std.mtof(D[d+4]) => s.freq;
		0.25::second => now;
	}
}

// to low
for ( D.cap()-1 => int d; d > 3; d--)
{
	// play 2 times
	for ( 0 => int i; i < 2; i++ )
	{
		Std.mtof(D[d]) => s.freq;
		0.25::second => now;
		
		Std.mtof(D[d-2]) => s.freq;
		0.25::second => now;

		Std.mtof(D[d-4]) => s.freq;
		0.25::second => now;
	}
}

TriOsc t => dac;

// ending
for ( 0 => int i; i < 4; i++ )
{
	volume => s.gain;
	volume => t.gain;
	
	Std.mtof(D[i]) => s.freq;
	Std.mtof(D[i+3]) => t.freq;
	0.25::second => now;
	
	0.0 => s.gain;
	0.0 => t.gain;
	0.25::second => now;
}

<<< "End: ", now / second >>>;