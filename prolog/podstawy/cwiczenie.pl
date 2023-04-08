% Student exercise profile
:- set_prolog_flag(occurs_check, error).		% dissallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).	% limit term space (8Mb)
:- set_prolog_stack(local, limit(2 000 000)).	% limit environment space

% My program

% Fakty
lubi(jan, kasia).
lubi(kasia, krzysztof).
lubi(kasia, jan).
lubi(jan, bartek).
lubi(bartek, jan).

mezczyzna(jan).
mezczyzna(krzysztof).
mezczyzna(bartek).

kobieta(kasia).

% Reguły
przyjazn(X, Y) :-
    lubi(X, Y),
    lubi(Y, X).

niby_przyjazn(X, Y) :-
    lubi(X, Y);
    lubi(Y, X),
    X = Y.

nieprzyjazn(X,Y) :-
    \+ lubi(X, Y),
    \+ lubi(Y, X).

loves(X, Y) :-
    przyjazn(X, Y),
    mezczyzna(X),
    kobieta(Y).

loves(X, Y) :-
    przyjazn(Y, X),
    mezczyzna(Y),
    kobieta(X).

true_love(X, Y) :-
    loves(X, Y),
    loves(Y, X).

/** <examples> My example queries go here:
?- przyjazn(jan, kasia).
?- true
?- przyjazn(kasia, bartek).
?- false
?- niby_przyjazn(jan, kasia).
?- true
?- niby_przyjazn(kasia, bartek).
?- false
?- nieprzyjazn(jan, kasia).
?- false
?- nieprzyjazn(krzysztof, bartek).
?- true
?- loves(jan, kasia).
?- true
?- loves(jan, bartek).
?- false
?- loves(kasia, jan).
?- true
?- true_love(jan, kasia).
?- true
?- true_love(kasia, jan).
?- true
*/
