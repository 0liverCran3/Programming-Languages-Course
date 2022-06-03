father(a,b).
father(a,c).
father(b,d).
father(b,e).
father(c,f).

brother(X,Y) :- father(Z,X),father(Z,Y),X\==Y.

cousin(X,Y) :- father(Z,X),father(W,Y),brother(Z,W).

descendent(X,Y) :- father(Y,X).
descendent(X,Y) :- father(Z,X),descendent(Z,Y).
