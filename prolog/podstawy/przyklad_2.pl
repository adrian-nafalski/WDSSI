% Student exercise profile
:- set_prolog_flag(occurs_check, error).		% dissallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).	% limit term space (8Mb)
:- set_prolog_stack(local, limit(2 000 000)).	% limit environment space

% Your program goes here
lubi(jan, pawel).
lubi(pawel, krzysztof).
lubi(pawel, jan).
lubi(jan, bartek).
lubi(bartek, jan).

przyjazn(X, Y) :-
    lubi(X, Y),
    lubi(Y, X).

niby_przyjazn(X, Y) :-
    lubi(X, Y);
    lubi(Y, X).

/** <examples> Your example queries go here, e.g.
?- member(X, [cat, mouse]).
?- lubi(jan, pawel)
?- niby_przyjazn(pawel, krzysztof)
*/
