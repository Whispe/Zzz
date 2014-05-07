# Direct rewrite of the ECLiPSe version.

var a1;
var a2;
var a3;
var a4;
var b1;
var b2;
var b3;
var b4;
var c1;
var c2;
var c3;
var c4;

subto supply_a: a1 + a2 + a3 + a4 <= 500;
subto supply_b: b1 + b2 + b3 + b4 <= 300;
subto supply_c: c1 + c2 + c3 + c4 <= 400;

subto demand_1: a1 + b1 + c1 == 200;
subto demand_2: a2 + b2 + c2 == 400;
subto demand_3: a3 + b3 + c3 == 300;
subto demand_4: a4 + b4 + c4 == 100;

minimize cost: 10*a1 + 8*a2 + 5*a3 + 9*a4 +
                7*b1 + 5*b2 + 5*b3 + 3*b4 + 
	       11*c1 + 10*c2 + 8*c3 + 7*c4;