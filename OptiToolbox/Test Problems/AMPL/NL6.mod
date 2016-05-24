set SweepWish;
param limitSup {s in SweepWish} >0;
param limitInf {s in SweepWish} >0;
param fs integer >=0;
param amplitudeLastSample;
param pi = 4 * atan(1);

var N integer  <=limitSup['N'], >=limitInf['N'];
var f1 <=limitSup['f1'], >=limitInf['f1'];
var f2 <=limitSup['f2'], >=limitInf['f2'];
var Phase integer >=1;
var Ninteger integer >=1;
var u1;
var u2;


minimize Objectif :   u1 + u2 ;

subject to ctrMax1 : u1 >= (N-1)*(f2-f1)/(fs*log(f2/f1)) - Phase;  # erreur de transitoire
subject to ctrMax2 : u1 >= -(N-1)*(f2-f1)/(fs*log(f2/f1)) + Phase;
subject to ctrMax3 : u2 >= N - Ninteger;
subject to ctrMax4 : u2 >= -N + Ninteger;


