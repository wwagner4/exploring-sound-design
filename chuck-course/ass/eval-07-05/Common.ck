// ###############################
// Author : 1234
// Date: 05/12/2013
// File: Common.ck
// Description: stories the common properties
// Project : Assignment 7
<<< "Common.ck" >>>;

// global Common property class
public class Common
{
    // global time variables
    static time preIntro, intro, verse_1;
    static time endTime;
    // global MIDI notes variables
    // Bb Aeolian MIDI notes
    [46,48,49,51,53,54,56,58] @=> static int scale[];
    ["Bb","C","Db","Eb","F","Gb","Ab","Bb"] @=> static string noteName[]; // Note name array
}

