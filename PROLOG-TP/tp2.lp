%question1

homme("Francois I").
homme("Henry II").
homme("Francois II").
homme("Charles IX").
homme("Henry III").
homme("Charles Emmanuel I").
homme("Victor-Amedee").

homme("Laink").
homme("Terracid").

femme("Madeleine").
femme("Margot").
femme("Marguerite").
femme("Elisabeth").

parent("Francois I","Henry II").
parent("Francois I","Madeleine").
parent("Francois I","Marguerite").

parent("Henry II","Francois II").
parent("Henry II","Charles IX").
parent("Henry II","Henry III").
parent("Henry II","Margot").

parent("Charles IX","Elisabeth").

parent("Marguerite","Charles Emmanuel").

parent("Charles Emmanuel","Victor-Amedee").

parent("Elisabeth","Laink").

parent("Victor-Amedee","Terracid").


%question2

pere(X,Y) :- parent(X,Y),
		homme(X).

mere(X,Y) :- parent(X,Y),
		femme(X).
%pere(X,"Henry II").

%question3

fille(X,Y) :- parent(Y,X),

		femme(X).
		
%question4
		
gdparent(X,Y) :- parent(X,Z),
		parent(Z,Y).
		
gdpere(X,Y) :- gdparent(X,Y),
		homme(X).
		
gdmere(X,Y) :- gdparent(X,Y),
		femme(X).	
		
%question5		

ancetre(X,Y) :- parent(X,Y).
ancetre(X,Y) :-
	parent(X,Z),
	ancetre(Z,Y).	
	
%ancetre(X,"Margot").
%ancetre(X,"Victor-Amedee").

%question6

frere(X,Y) :-
	parent(Z,Y),
	parent(Z,X),
	homme(X),
	Y\=X. %\+(Y=X)

soeur(X,Y) :-
	parent(Z,Y),
	parent(Z,X),
	femme(X),
	Y\=X. %\+(Y=X)
	
oncle(X,Y) :- parent(Z,Y),
		frere(X,Z).
		
tante(X,Y) :- parent(Z,Y),
		soeur(X,Z).
		
cousin_1(X,Y) :- gdparent(Z,X),
		gdparent(Z,Y),
		parent(W,X),
		\+parent(W,Y),
		Y\=X.

cousin_2(X,Y) :- cousin_1(X,Y).
cousin_2(X,Y) :- 
		parent(A,X),
		parent(B,Y),
		A\=B,
		cousin_2(A,B).		
		
		
