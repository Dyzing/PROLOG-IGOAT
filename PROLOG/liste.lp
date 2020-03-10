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
	

%td2


conc([],L_,L_).
conc([X|L],L_,[X|LL_]):-
	conc(L,L_,LL_).




partage([],[],[]).
partage([X],[X],[]).
partage([X,Y|LL_],[X|L],[Y|L_]) :-
	partage(LL_,L,L_).



%inferieur
inf_st(X,Y):- X<Y.

place(X,[],[X]).
place(X,[Y|T],[X,Y|T]) :- %X<Y
	inf_st(X,Y).
place(X,[X|T],[X,X|T]).	%X=Y
place(X,[Y|T],[Y|TX]) :-	%X>Y
	inf_st(Y,X),place(X,T,TX).
	
	
	
dpeda(_P,[],[],[],[]).
dpeda(P,[X|L],[X|PPP],EP,PGP) :-
	inf_st(X,P),dpeda(P,L,PPP,EP,PGP).
dpeda(P,[P|L],PPP,[P|EP],PGP) :-
	dpeda(P,L,PPP,EP,PGP).
dpeda(P,[X|L],PPP,EP,[X|PGP]) :-
	inf_st(P,X),dpeda(P,L,PPP,EP,PGP).
	
	
	

%fusion([],[],[]).
fusion([],L,L).
fusion(L,[],L) :- 
	L=[_|_].
fusion([X|T],[Y|T_],[X|YTT_]) :-
	inf_st(X,Y), fusion(T,[Y|T_],YTT_).
fusion([X|T],[X|T_],[X,X|TT_]) :-
	fusion(T,T_,TT_).
fusion([X|T],[Y|T_],[Y|XTT_]) :-
	inf_st(Y,X), fusion([X|T],T_,XTT_).
	
	
	

