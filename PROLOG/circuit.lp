et(1,1,1).
et(1,0,0).
et(0,1,0).
et(0,0,0).
ou(0,0,0).
ou(0,1,1).
ou(1,0,1).
ou(1,1,1).
non(1,0).
non(0,1).

circuit(A,B,C,H):-
	ou(G,F,H),
	et(A,B,D),
	non(D,F),
	non(E,G),
	ou(B,C,E).
	
%commentaire

