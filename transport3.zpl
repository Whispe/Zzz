# Change one of the index sets to use strings as the indices.
# It is possible to use integers, strings, or tuples.

set Producer := {"alice","bob","carol"};
set Consumer := {1 to 4};
var send[Producer*Consumer];

subto supply_a: sum <c> in Consumer: send["alice",c] <= 500;
subto supply_b: sum <c> in Consumer: send["bob",  c] <= 300;
subto supply_c: sum <c> in Consumer: send["carol",c] <= 400;

subto demand_1: sum <p> in Producer: send[p,1] == 200;
subto demand_2: sum <p> in Producer: send[p,2] == 400;
subto demand_3: sum <p> in Producer: send[p,3] == 300;
subto demand_4: sum <p> in Producer: send[p,4] == 100;

minimize cost: 10*send["alice",1] +  8*send["alice",2] + 5*send["alice",3] + 9*send["alice",4] + 
	        7*send["bob",  1] +  5*send["bob",  2] + 5*send["bob",  3] + 3*send["bob",  4] + 
	       11*send["carol",1] + 10*send["carol",2] + 8*send["carol",3] + 7*send["carol",4];


