# Basic schedule solver.

set Day := {1..7};
param base_fun_rate := 1; # Part (d).
#param events[Day] := read "events.txt" as # event name, 

var work[Day];
var sleep[Day];
var play[Day];

subto twentyfourhours: forall <d> in Day: work[d] + sleep[d] + play[d] == 24; # Part (a).
subto worktenhours: forall <d> in Day: work[d] >= 10; # Part (b).
subto sleepsevenhours: forall <d> in Day: sleep[d] >= 7; # Part (b).
subto playthreehours: forall <d> in Day: play[d] >= 3; # Part (b).
subto threedayssleepeighteen: forall <d> in Day without {6,7}: sleep[d] + sleep[d+1] + sleep[d+2] >= 18; # Part (c).
