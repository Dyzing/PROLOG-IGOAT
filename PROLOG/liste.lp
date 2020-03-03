liste([]).
liste([_|L]):-
	liste(L).
	

	
rang_pair([],[]).
rang_pair([_],[]).
rang_pair([_X,Y|L1],[Y|L2]):-
	rang_pair(L1,L2).
	


membre(X,[X|_]).
membre(X,[_|L]):-
	membre(X,L).




insertion(L1,X,[X|L1]).
insertion([Y|L1],X,[Y|L2]):-
	insertion(L1,X,L2).




prefixe([],_L).
prefixe([X|L],[X|LL_]):-
	prefixe(L,LL_).



suffixe(L,L).
suffixe(L_,[_|LL_]):-
	suffixe(L_,LL_).




permute([],[]).
permute([X|L],[]):-
	permute(L,P),
