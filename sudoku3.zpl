# Constraints for n^2 x n^2 Sudoku puzzles.

param n := 3;
param dim := n*n;
set R := {1..dim};  # row indices
set C := {1..dim};  # col indices
set D := {1..dim};  # possible digits
set B := {1..n}*{1..n};   # block-internal indices
var x[R*C*D] binary;  # does digit D appear at coordinates (R,C)?
var notrotequal[R*C*D] binary;

# There are constraints, but nothing to maximize or minimize.

subto uniq:  forall <r,c> in R*C: (sum <d> in D: x[r,c,d]) == 1;   # exactly one digit per cell
subto row:   forall <r,d> in R*D: sum <c> in C: x[r,c,d] == 1;  # each digit appears once per row
subto col:   forall <c,d> in C*D: sum <r> in R: x[r,c,d] == 1;   # each digit appears once per column
subto block: forall <br,bc,d> in B*D: (sum<roff,coff> in B: x[(br-1)*n+roff, (bc-1)*n+coff,d]) == 1;   # each digit appears once per block

# Some of the digits are given.  Read these from file sudoku.txt and
# further constrain the solution to match these.

set Givens := { read "sudoku.txt" as "<1n,2n,3n>" comment "#" };
#subto rotsymm: forall <r,c,d> in R*C*D: x[r,c,d] == x[dim-r+1,dim-c+1,d];
subto notequal: forall <r,c,d> in R*C*D: vif x[r,c,d] != x[dim-r+1,dim-c+1,d] then notrotequal[r,c,d] == 1 end;
subto no_permute_digits: forall <c> in C: x[1,c,c] == 1;
minimize notrotequal: sum<r,c,d> in R*C*D: notrotequal[r,c,d];
