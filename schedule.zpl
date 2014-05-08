# Basic schedule solver.

set Day := {1..7};
param base_fun_rate := 1; # Part (d).
param sleepy_work_rate := 0.75; # Part (f).

var work[Day]; # Part (b).
var sleep[Day]; # Part (b).
var play[Day]; # Part (b).
var events[Day]; # Number of hours spent on events each day.
var sleepy[Day]; # Part (f).

set E := { read "events.txt" as "<1s>" }; # The set of events by name.
param edays[E] := read "events.txt" as "<1s> 2n"; # The set of events by name and day of occurrence.
param ehours[E] := read "events.txt" as "<1s> 3n"; # The set of events by name and duration in hours.
param efunrate[E] := read "events.txt" as "<1s> 4n"; # The set of events by name and fun rate.

var attendevent[E] binary; # Whether or not we go to the event.
var attendancedurations[E]; # How long we must spend on the event.
var toteventfun; # Total amount of fun obtained from going to the events for the week.

subto calcattendancedurations: forall <e> in E: attendancedurations[e] == attendevent[e] * ehours[e];

var eventsperday[Day*E]; # Number of event hours per day.
subto spendhoursonevent: forall <e> in E: eventsperday[edays[e],e] == attendevent[e] * attendancedurations[e];
subto attendeventsbyday: forall <d> in Day: events[d] == sum <e> in E: eventsperday[d,e];
subto calctoteventfun: toteventfun == sum <e> in E: efunrate[e] * attendancedurations[e];

subto twentyfourhours: forall <d> in Day: work[d] + sleep[d] + play[d] == 24; # Part (a).
subto threedayssleepeighteen: forall <d> in Day without {6,7}: sleep[d] + sleep[d+1] + sleep[d+2] >= 18; # Part (c).

var totplayfun;
subto totalplayfun: totplayfun == sum <d> in Day: base_fun_rate * play[d];
maximize totfun: totplayfun + toteventfun;
