sommet(_S,[]).
sommet(_S,[_F|_SUCC]).

graphe([sommet(_S,[_F|_SUCC]) |_]).


mon_graphe(graphe([sommet(a,[b,c]),sommet(b,[d,e]),sommet(c,[d,e]), sommet(e,[]), sommet(d, [])])).

%1
graphe_vide(graphe([])).


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
			
			

%4
predecesseurs(E,graphe(L),Pred) :-
	sommets(graphe(L),S),member(E,S),
	predecesseurs_rec(E,L,Pred).

predecesseurs_rec(_,[],[]).
predecesseurs_rec(E,[sommet(E_,Succ)|L],[E_|Pred]) :-
	member(E,Succ), predecesseurs_rec(E,L,Pred).
	
predecesseurs_rec(E,[sommet(_,Succ)|L],Pred) :-
	\+member(E,Succ), predecesseurs_rec(E,L,Pred).
	
	

%5
ote_sommet(E,graphe(L),graphe(L_)) :-
	sommets(graphe(L),S), member(E,S),
	ote_sommet_rec(E,L,L_).

ote_sommet_rec(_,[],[]).
ote_sommet_rec(E,[sommet(E,_)|L],L_) :-
		ote_sommet_rec(E,L,L_).
		
ote_sommet_rec(E,[sommet(E_,Succ)|L],[sommet(E_,Succ)|L_]) :-
	E\=E_, \+member(E,Succ), ote_sommet_rec(E,L,L_).

ote_sommet_rec(E,[sommet(E_,Succ)|L],[sommet(E_,Succ_)|L_]) :-
		E\=E_, member(E,Succ), ote(E,Succ,Succ_), ote_sommet_rec(E,L,L_).
	


ote(E,[E|L],L).
ote(E,[E_|L],[E_|L_]) :-
	ote(E,L,L_).












%EXO 2 Tri topologique







tri_topologique(G,[]) :- graphe_vide(G).
tri_topologique(G,[X|L]) :-
	predecesseurs(X,G,[]),
	ote_sommet(X,G,G_),
	tri_topologique(G_,L).








%EXO 3 Liste de sommets et liste d’arcs



arc(X,X).
arc(X,Y).

graphe(















