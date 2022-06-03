% recursion to calculate sum of integers from 1 to N.
sumN(0,0).
sumN(N,Sum) :- N>0, M is N-1, sumN(M,Temp), Sum is Temp+N.

%factorial
factorial(0,1).
factorial(N,Nfac) :- N>0, M is N-1, factorial(M, Mfac), Nfac is N * Mfac.