# Use indexed variables (indexed by members of particular sets).
# This also allows indexed summations.

set Producer := {1 .. 3};
set Consumer := {1 to 4};
var send[Producer*Consumer];

subto supply_a: sum <c> in Consumer: send[1,c] <= 500;
subto supply_b: sum <c> in Consumer: send[2,c] <= 300;
subto supply_c: sum <c> in Consumer: send[3,c] <= 400;

subto demand_1: sum <p> in Producer: send[p,1] == 200;
subto demand_2: sum <p> in Producer: send[p,2] == 400;
subto demand_3: sum <p> in Producer: send[p,3] == 300;
subto demand_4: sum <p> in Producer: send[p,4] == 100;

minimize cost: 10*send[1,1] +  8*send[1,2] + 5*send[1,3] + 9*send[1,4] + 
	        7*send[2,1] +  5*send[2,2] + 5*send[2,3] + 3*send[2,4] + 
	       11*send[3,1] + 10*send[3,2] + 8*send[3,3] + 7*send[3,4];


