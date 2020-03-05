%question1

vin1(100,"Chablis",1974,12).
vin1(110,"Mercurey",1978,13).
vin1(120,"Macon",1977,12).

vin2(100,"Chablis",1974,12).
vin2(200,"Sancerre",1979,11).
vin2(210,"Pouilly",1980,12).
vin2(230,"Pouilly",1981,12).

viticulteurs("Nicolas","Pouilly","Bourgogne").
viticulteurs("Martin","Bordeaux","Bordelais").


%question2

%vin2(A,"Pouilly",B,C).
%vin2(A,B,C,12).


%question3

vin3(N,C,M,D):-
	vin1(N,C,M,D),
	vin2(N,C,M,D).
%La virgule : conjonction = intersection



%question4

%vin4(N,C,M,D):- vin1(N,C,M,D). %version1
%vin4(N,C,M,D):- vin2(N,C,M,D).

vin4(N,C,M,D):- vin1(N,C,M,D);
		vin2(N,C,M,D),
		\+vin3(N,M,C,D). %version2
%Le point virgule : disjonction = union
%vin4(A,B,C,12).


%question5

%\+(vin2(A,B,1978,D)).



%question6

vin5(N,M,C,D):- 
	vin1(N,M,C,D),
	\+vin2(N,M,C,D).
	

%question7

vignoble(N,M,C,D,P,V,R):-
	vin5(N,M,C,D),
	viticulteurs(P,V,R).
	
%question8
	
vin6(C,M) :- 
	vin5(_N,C,M,_D).
	

%question9


vin7(N,C,M,D) :- vin4(N,C, M ,D),
		M>1975, M<1980.
		

%question10

vin8(N,C,M,D,P,V,R) :- 
		vin4(N,C,M,D),
		viticulteurs(P,V,R),
		C=V.		

%question11

vin9(macon, 1977, 12).
vin9(macon, 1979, 14).
vin9(macon, 1980, 12).
vin9(saumur, 1977,  12).
vin9(saumur, 1979,  14).
vin9(chablis, 1977,  12).

% ... ou bien 
% vin9('Macon', 1977, 12).
% vin9('Macon', 1979, 14).
% vin9('Macon', 1980, 12).
% vin9('Saumur', 1977,  12).
% vin9('Saumur', 1979,  14).
% vin9('Chablis', 1977,  12).

type(1977,12).
type(1979,14).

pv9(C) :- vin9(C,_,_).
cru(C) :- 
	pv9(C),
	\+reste(C,_,_).
reste(C,_M,_D) :- pv9xtype(C,M,D),\+vin9(C,M,D).
pv9xtype(C,M,D) :- pv9(C),type(M,D).
			
