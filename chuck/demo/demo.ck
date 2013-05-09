500::ms => dur T;

2::second => dur patchDuration; 
if (me.args() > 0) {
   Std.atoi(me.arg(0))::second => patchDuration; 
}

55 => int midiNr;
if (me.args() > 1) {
   Std.atoi(me.arg(1)) => midiNr; 
}

1 => int preset;
if (me.args() > 2) {
   Std.atoi(me.arg(2)) => preset; 
}

0.3 => float bowRate;
if (me.args() > 3) {
   Std.atof(me.arg(3)) => bowRate; 
}

0.3 => float bowPressure;
if (me.args() > 4) {
   Std.atof(me.arg(4)) => bowPressure; 
}

0.3 => float strikePosition;
if (me.args() > 5) {
   Std.atof(me.arg(5)) => strikePosition; 
}



<<<"patchDuration", patchDuration, "midiNr", midiNr, "preset", preset>>>;
<<<"bowRate", bowRate, "bowPressure", bowPressure>>>;

fun void bow(dur patchDuration, int midiNr, int preset, float bowRate, 
    float bowPressure, float strikePosition) {
	BandedWG bwg => dac;
	preset => bwg.preset;
	bowRate => bwg.bowRate;
	bowPressure => bwg.bowPressure;
	strikePosition => bwg.strikePosition;
	Math.mtof(midiNr) => bwg.freq;

//	0.5 => bwg.pluck;
//  patchDuration => now;

	
	0.5 => bwg.startBowing;
  patchDuration => now;
  1.0 => bwg.stopBowing;
  2::second => now;
}



T - (now % T) => now;

bow(patchDuration, midiNr, preset, bowRate, bowPressure, strikePosition);
<<<"stopped", "">>>;
