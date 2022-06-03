ce1(one,1) :- true. /* same as ce1(one,1). */
ce1(two,2) :- true, !.

ce1(_,'something') :- true.