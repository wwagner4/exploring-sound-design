// howlingWind.ck
// Assignment 8: Concert for wind, sun and three birds

//Gain master => dac;
//0.2 => master.gain;

fun void howl(dur riseDur, float fromFreq, float toFreq, dur holdDur, dur fallDur, float pan) {
	
	// UGens and static parameters
	Noise n => BiQuad f => Pan2 p => dac;
	0.99 => f.prad;		// biquad pole radius
	1 => f.eqzs;		// set equal zeros
	0.1 => p.gain;
	pan => p.pan;

	// initialisations
	toFreq - fromFreq => float addFreqRange;

	0.05 => float fromGain;
	0.15 => float toGain;
	toGain - fromGain => float addGainRange;

	1 => int stepCnt;
	riseDur/100.0 => dur step;
	now => time start;

	// rise
	while (stepCnt <= 100) {
		// increment filter resonant frequency and gain
		// scale to radiants: 0..1 => 0..PI/2
		(stepCnt/100.0) * (Math.PI/2) => float y;
		// use 'sin' function to rise the frequency quicker at the beginning
		Math.sin(y) => float riseRatio;
		fromFreq + addFreqRange*riseRatio => f.pfreq;
		fromGain + addGainRange*riseRatio => f.gain;

		// advance time
		step => now;

		//if (stepCnt%25 == 0) <<< "pfreq", f.pfreq(), "gain", f.gain() >>>;
		stepCnt++;
	}

	// hold
	holdDur => now;

	// fall
	fallDur/100.0 => step;
	1 => stepCnt;

	while (stepCnt <= 100) {
		// decrement gain (but don't touch filter resonant frequency)
		stepCnt/100.0 => float fallRatio;
		toGain * (1-fallRatio) => f.gain;

		// advance time
		step => now;

		//if (stepCnt%25 == 0) <<< "pfreq", f.pfreq(), "gain", f.gain() >>>;
		stepCnt++;
	}

	// unchuck Ugens
	p =< dac;
	
	//<<< "howled for", (now-start)/ms, "ms" >>>;
}

<<< "tempest 0s" >>>;
spork ~ howl(1::second, 200, 700, 1::second, 3::second, 0);

0.5::second => now;
spork ~ howl(0.5::second, 1000, 5000, 0.2::second, 0.7::second, 1);

0.5::second => now;
spork ~ howl(0.5::second, 500, 1000, 0.5::second, 2::second, 0);

1.5::second => now;
spork ~ howl(0.5::second, 800, 2000, 0.2::second, 0.7::second, -1);

0.5::second => now;
spork ~ howl(1::second, 200, 700, 1::second, 3::second, 0);

<<< "tempest 3s" >>>;

0.5::second => now;
spork ~ howl(0.5::second, 2000, 6000, 0.2::second, 0.7::second, 0.5);

0.5::second => now;
spork ~ howl(0.5::second, 500, 1000, 0.5::second, 2::second, 0);

1::second => now;
spork ~ howl(1::second, 200, 700, 1::second, 3::second, 0);

0.5::second => now;
spork ~ howl(0.5::second, 500, 1000, 0.5::second, 2::second, 0);

0.5::second => now;
spork ~ howl(0.5::second, 1000, 5000, 0.2::second, 0.7::second, 1);

<<< "tempest 6s" >>>;

0.5::second => now;
spork ~ howl(0.5::second, 500, 1000, 0.5::second, 2::second, 0);

0.5::second => now;
spork ~ howl(0.5::second, 2000, 7000, 0.2::second, 0.7::second, -0.5);

0.5::second => now;
spork ~ howl(1::second, 200, 700, 1::second, 3::second, 0);

1.0::second => now;
spork ~ howl(0.5::second, 500, 1000, 0.5::second, 2::second, 0);

0.5::second => now;
spork ~ howl(0.5::second, 1000, 5000, 0.2::second, 0.7::second, -0.5);

<<< "tempest 9s" >>>;

0.5::second => now;
spork ~ howl(1::second, 100, 500, 1::second, 3::second, 0);

0.5::second => now;
spork ~ howl(1::second, 200, 700, 1::second, 3::second, 0.3);

0.5::second => now;
spork ~ howl(0.5::second, 500, 1000, 0.5::second, 2::second, -0.3);

0.5::second => now;
spork ~ howl(1::second, 100, 500, 1::second, 3::second, 0);

0.5::second => now;
spork ~ howl(1::second, 200, 700, 1::second, 4::second, 0.3);

0.5::second => now;
spork ~ howl(1::second, 100, 500, 1::second, 5::second, 0);

<<< "tempest 12s" >>>;

0.5::second => now;
spork ~ howl(1::second, 100, 500, 1::second, 5::second, -0.3);

1::second => now;
spork ~ howl(1::second, 200, 700, 1::second, 6::second, 0);

1.5::second => now;
<<< "tempest 15s ... degrades" >>>;

3::second => now;
<<< "tempest 18s ... slowly comes to an end" >>>;

5::second => now;

