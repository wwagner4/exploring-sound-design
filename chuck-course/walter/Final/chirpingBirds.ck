// chirpingBirds.ck
// Assignment 8: Concert for wind, sun and three birds

// 
fun void chirpTimes(Bird bird, int times, dur delay) {
	for (0 => int ii; ii<times; ii++) {
		bird.chirp();
		if (ii < times-1)
			delay => now;
	}
}

// initialise three birds
Alice alice;
0.7 => alice.gain;

Bob bob;
0.7 => bob.gain;

Carroll carroll;
0.7 => carroll.gain;


<<< "chirping birds solo: Bob, Alice and Carroll" >>>;

chirpTimes(bob, 3, 0.6::second);
1::second => now;

chirpTimes(alice, 2, 0.2::second);
0.2::second => now;

chirpTimes(carroll, 2, 0.4::second);


<<< "Bob, Alice and Carroll together" >>>;

spork ~ bob.chirp();
0.3::second => now;

spork ~ alice.chirp();
0.7::second => now;

spork ~ alice.chirp();
0.7::second => now;

spork ~ bob.chirp();
0.4::second => now;

spork ~ carroll.chirp();
0.3::second => now;

spork ~ carroll.chirp();
0.1::second => now;

spork ~ alice.chirp();
0.7::second => now;

spork ~ chirpTimes(bob, 3, 0.6::second);
0.3::second => now;

spork ~ chirpTimes(alice, 4, 0.2::second);
0.3::second => now;

spork ~ chirpTimes(carroll, 2, 1::second);
3.5::second => now;

<<< "Alice says good-by" >>>;

spork ~ chirpTimes(alice, 2, 0.1::second);;
5::second => now;

