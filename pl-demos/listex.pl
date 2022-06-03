second([_,Second|_],Result) :- Result = Second.

fifth([_,_,_,_, Five|_], Five).

cons(First,List,[First|List]).