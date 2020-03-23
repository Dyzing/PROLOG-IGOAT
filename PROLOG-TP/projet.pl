sommet(_S,[]).
sommet(_S,[_F|_SUCC]).

graphe([sommet(_S,[_F|_SUCC]) |_]).

mon_graphe(graphe([sommet(a,[b]),sommet(b,[e,c,f]),sommet(c,[d,g]),sommet(d,[c,h]),sommet(e,[a,f]),sommet(f,[g]),sommet(g,[f]),sommet(h,[d,g])])).

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
chemin_rec(_U,V,[sommet(V,_)],[V|[]]).
chemin_rec(U,V,[sommet(U,[SUCC])|SUITE],[U,S|L_]):-
	successeurs(U,graphe(_L),SUCC), member(S,SUCC), chemin_rec(S,V,SUITE,L_).