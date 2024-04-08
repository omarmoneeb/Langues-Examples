item(sushi,12,3).
item(pasta,18,5).
item(water,4,7).
item(burger,10,4).
item(shrimp,20,2).

order_again(yes).

check(X,Y,R):- X =< Y, R is X.
check(X,Y,R):- X > Y, R is Y, write('sorry we only have this amount: '),write(R), nl.

sum(Acc,Price,Total):- Total is Price + Acc.
menu(Order,Quantity,Price,Acc,Total):-
	item(Order,Price1,Amount),
	check(Quantity,Amount,R),
	Price is R * Price1,
	sum(Acc,Price,Total).
	

order(Again,Acc):- order_again(Again),
	write('Welcome to our humble resturant, what would you like to order? '),nl,
	write('burger, $10. '),nl,
	write('sushi, $12. '),nl,
	write('shrimp, $20. '),nl,
	write('pasta, $18. '),nl,
	write('water, $4. '),nl,
	read(Order),nl,
	write('How many would you like to have? '),nl,
	read(Quantity),nl,
	menu(Order,Quantity,_,Acc,Total),
	write('Would you like to order again?'),nl,
	write('Answer with yes or no plese.'),nl,
	read(Answer),
	order(Answer,Total).
order(_,Acc) :- write('Here is the total for your order: '),write(Acc).

start :-
	Acc=0,
	write('Welcome to our humble resturant,would you like to order? '),nl,
	write('Answer with yes or no plese.'),nl,
	read(Answer),
	order(Answer,Acc).
