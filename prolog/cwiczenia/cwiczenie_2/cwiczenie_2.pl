% Student exercise profile
:- set_prolog_flag(occurs_check, error).		% dissallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).	% limit term space (8Mb)
:- set_prolog_stack(local, limit(2 000 000)).	% limit environment space

% My program

%
% Fakty
%

% Simpson family tree
% https://www.eslprintables.com/vocabulary_worksheets/family/the_simpsons_family/simpson_family_tree_940195/

/* Fakty dotyczące osób */
osoba(abraham).
osoba(mona).
osoba(clancy).
osoba(jacqueline).
osoba(homer).
osoba(herb).
osoba(marge).
osoba(patty).
osoba(selma).
osoba(bart).
osoba(lisa).
osoba(maggie).
osoba(ling).

/* Fakty dotyczące płci */
mezczyzna(abraham).
mezczyzna(clancy).
mezczyzna(herb).
mezczyzna(homer).
mezczyzna(bart).

/* Fakty dotyczące relacji rodzinnych */
rodzic(homer, bart).
rodzic(homer, lisa).
rodzic(homer, maggie).
rodzic(marge, bart).
rodzic(marge, lisa).
rodzic(marge, maggie).
rodzic(abraham, herb).
rodzic(abraham, homer).
rodzic(mona, herb).
rodzic(mona, homer).
rodzic(jacqueline, marge).
rodzic(jacqueline, patty).
rodzic(jacqueline, selma).
rodzic(clancy, marge).
rodzic(clancy, patty).
rodzic(clancy, selma).
rodzic(selma, ling).

%
% Reguły
%

kobieta(X) :-
    osoba(X),
    \+ mezczyzna(X).

ojciec(X,Y) :-
    mezczyzna(X),
    rodzic(X,Y).

matka(X,Y) :-
    kobieta(X),
    rodzic(X,Y).

corka(X,Y) :-
    kobieta(X),
    rodzic(Y,X).

brat_rodzony(X,Y) :-
    mezczyzna(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    X \= Y.

brat_przyrodni(X,Y) :-
    mezczyzna(X),
    rodzic(Z,X),
    rodzic(Z,Y),
    rodzic(W,X),
    rodzic(W,Y),
    Z = W,
    X = Y.

kuzyn(X,Y) :-
    rodzic(Z,X),
    rodzic(W,Y),
    brat_rodzony(Z,W).

dziadek_od_strony_ojca(X,Y) :-
    mezczyzna(X),
    rodzic(X,Z),
    ojciec(Z,Y).

dziadek_od_strony_matki(X,Y) :-
    mezczyzna(X),
    rodzic(X,Z),
    matka(Z,Y).

dziadek(X,Y) :-
    dziadek_od_strony_ojca(X,Y);
    dziadek_od_strony_matki(X,Y).

babcia(X,Y) :-
    kobieta(X),
    rodzic(X,Z),
    rodzic(Z,Y).

wnuczka(X,Y) :-
    kobieta(X),
    rodzic(Y,Z),
    rodzic(Z,X).

przodek_do2pokolenia_wstecz(X,Y) :-
    rodzic(X,Y).
przodek_do2pokolenia_wstecz(X,Y) :-
    rodzic(X,Z),
    przodek_do2pokolenia_wstecz(Z,Y).

przodek_do3pokolenia_wstecz(X,Y) :-
    rodzic(X,Y).
przodek_do3pokolenia_wstecz(X,Y) :-
    rodzic(X,Z),
    przodek_do3pokolenia_wstecz(Z,Y).
przodek_do3pokolenia_wstecz(X,Y) :-
    rodzic(X,Z),
    przodek_do2pokolenia_wstecz(Z,Y).

/** <examples> My example queries go here:
?- kobieta(marge).
?- true
?- kobieta(homer).
?- false
?- ojciec(homer, lisa).
?- true
?- ojciec(jacqueline, marge).
?- false
?- matka(marge, lisa).
?- true
?- matka(homer, bart).
?- false
?- corka(lisa, homer).
?- true
?- corka(abraham, herb).
?- false
?- brat_rodzony(bart, lisa).
?- true
?- brat_rodzony(bart, maggie).
?- true
?- brat_przyrodni(bart, maggie).
?- false
?- brat_przyrodni(selma, patty).
?- false
?- kuzyn(bart, selma).
?- false
?- kuzyn(bart, patty).
?- false
?- dziadek_od_strony_ojca(abraham, maggie).
?- true
?- dziadek_od_strony_ojca(jacqueline, bart).
?- false
?- dziadek_od_strony_matki(abraham, maggie).
?- false
?- dziadek_od_strony_matki(jacqueline, bart).
?- false
?- dziadek(abraham, maggie).
?- true
?- dziadek(jacqueline, bart).
?- false
?- babcia(jacqueline, maggie).
?- true
?- babcia(abraham, selma).
?- false
?- wnuczka(maggie, jacqueline).
?- true
?- wnuczka(selma, abraham).
?- false
?- przodek_do2pokolenia_wstecz(abraham, herb).
?- true
?- przodek_do2pokolenia_wstecz(lisa, maggie).
?- false
?- przodek_do3pokolenia_wstecz(abraham, lisa).
?- true
?- przodek_do3pokolenia_wstecz(bart, herb).
?- false
*/
