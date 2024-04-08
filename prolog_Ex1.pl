shuffle([],[],[]).
shuffle([],L,L).
shuffle(L,[],L).
shuffle([H1|T1],[H3|T3],[H1|T2]) :- shuffle(T1,[H3|T3],T2).
shuffle([H1|T1],[H3|T3],[H3|T4]) :- shuffle([H1|T1],T3,T4).

