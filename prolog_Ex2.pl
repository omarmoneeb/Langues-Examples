sub([],_,_,_,[]).
sub(_,Min,Max,_,[]):- Min > Max.
sub([H|T],Min,Max,Index,[H|T2]):- check(Index,Min,Max),
	Nind is Index + 1,
	sub(T,Min,Max,Nind,T2).
sub([_|T],Min,Max,Index,T2) :- Nind is Index + 1, sub(T,Min,Max,Nind,T2).

sublistxy(L,S):-
	write('Write your Min number: '),nl,
	read(X),
	write('Write your Max number: '),nl,
	read(Max),
	Index is 1,
	checkX(X,Min),
	sub(L,Min,Max,Index,S),
	write('Here is your sublist: '), write(S).
start:-
	write('Write your List: '),nl,
	read(L),
	sublistxy(L,_).
odd1(N):- N >= 0, 1 is (N mod 2).
odd1(N):- N < 0, N1 is -N, odd(N1).



boundaries(N,Mn,Mx) :- N < Mx, N > Mn.

add_tobe_summed(N,Mn,Mx,_,Sum):- odd1(N),
	boundaries(N,Mn,Mx), Sum is N.
add_tobe_summed(_,_,_,_,0).

sum_odd([],_,_,Sum,Sum,_).
sum_odd([H|T], Low, Hi, Acc, Sum, AlreadyAdded) :-
	 add_tobe_summed(H, Low, Hi, AlreadyAdded, PartSum),
	Acc1 is Acc + PartSum,
	sum_odd(T, Low, Hi, Acc1, Sum, [H|AlreadyAdded]).

sum(List,Low,Hi,Sum):- sum_odd(List,Low,Hi,0,Sum,[]).


start :-
	List=[1,2,3,4,5,6,7,8,9,2,23,21,6,7,8,2,3,4,12,2,31,32,33,2,4],
	write('What is your Low number: '), nl,
	read(Low),	
	write('What is your High number: '), nl,
	read(Hi),
	sum(List,Low,Hi,Sum),
	write('The Sum of the odd numbers within the rande is: '), write(Sum), nl.
