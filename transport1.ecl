% Modified slightly from version on ECLiPSe website.

%----------------------------------------------------------------------
% Example for basic use of ECLiPSe/CPLEX/XPRESS-MP interface
%
% A tiny transportation problem: 3 plants with certain capacity,
% 4 clients with certain demands, transport costs between them.
% Organise the supply such that the transport costs are minimal.
%----------------------------------------------------------------------

%:- lib(eplex_cplex).
:- lib(eplex_xpress).


% Version 1: model and data mixed

main1(Cost, Vars) :-
	Vars = [A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4];
	Vars :: 0.0..inf,			% variables

	A1 + B1 + C1 $= 200,			% demand constraints
	A2 + B2 + C2 $= 400,
	A3 + B3 + C3 $= 300,
	A4 + B4 + C4 $= 100,

	A1 + A2 + A3 + A4 $=< 500,		% supply constraints
	B1 + B2 + B3 + B4 $=< 300,
	C1 + C2 + C3 + C4 $=< 400,

	optimize(min(				% solve
	     10*A1 + 8*A2 + 5*A3 + 9*A4 +
              7*B1 + 5*B2 + 5*B3 + 3*B4 +
             11*C1 + 10*C2 + 8*C3 + 7*C4), Cost).
