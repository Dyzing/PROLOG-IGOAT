liste([]).
liste([_X|L]):-
	liste(L).
	
	
prefixe([],_L).
prefixe([X|L1],[X|L2]):-
	prefixe(L1,L2).
	
	
dernier(X,[X|[]],[]).	
dernier(X, [Y|L],[Y|_L_]):-
	dernier(X,L,_L_).
	
	
rang_pair([],[]).
rang_pair([X|[Y|L]],[Y]):-
	rang_pair(L,L_).
