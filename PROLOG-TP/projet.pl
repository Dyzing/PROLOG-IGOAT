sommet(_S,[]).
sommet(_S,[_F|_SUCC]).

graphe([sommet(_S,[_F|_SUCC]) |_]).

mon_graphe(graphe([sommet(a,[b,c]),sommet(b,[d,e]),sommet(c,[d,e]), sommet(e,[a,e]), sommet(d, [])])).

%1
graphe_vide([]).


%2
sommets(graphe(L),ES) :-
	sommets_rec(L,ES).

sommets_rec([],[]).
sommets_rec([sommet(E,_SUCC)|L],[E|ES]) :-
	sommets_rec(L,ES).

	
%3
successeurs(E,graphe(L),SUCC) :-
		 successeurs_rec(E,L,SUCC).

successeurs_rec(E,[sommet(E,SUCC)|_],SUCC).
successeurs_rec(E,[sommet(E_,_)|L],SUCC) :- 
			E\=E_,successeurs_rec(E,L,SUCC).



%chemin

chemin(U,V,graphe(L),C) :-
	chemin_rec(U,V,L,C).

chemin_rec(_,_,[],[]).
chemin_rec(_,_,[],_).
chemin_rec(U,V,[sommet(U,[V|_])|_],[U,V]).
chemin_rec(U,V,[sommet(X,[S|_UCC])|L],[X,S|L_]):-
	chemin_rec(U,V,L,L_).