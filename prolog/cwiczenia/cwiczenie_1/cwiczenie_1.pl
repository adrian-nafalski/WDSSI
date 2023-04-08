% Student exercise profile
:- set_prolog_flag(occurs_check, error).		% dissallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).	% limit term space (8Mb)
:- set_prolog_stack(local, limit(2 000 000)).	% limit environment space

% Zadanie 1.1
% 
% 	A - rodzeństwo
% 	B - rodzeństwo cioteczne / wujeczne / przyrodnie
% 	C - swachy / świkry (albo też brak pokrewieństwa bo to dwie obce osoby)
% 	D - pasierb
% 	E - przyrodnie rodzeństwo / półbrat / półsiostra
% 	F - brak pokrewieństwa
% 	G - rodzeństwo
% 	
% %  


% Zadanie 1.2

%
% Reguły
%

% A

rodzic(p1, p3).
rodzic(p1, p4).
rodzic(p2, p3).
rodzic(p2, p4).

% B

rodzic(p1, p2).
rodzic(p1, p3).
rodzic(p2, p4).
rodzic(p3, p5).

% C

rodzic(p1, p3).
rodzic(p2, p4).
rodzic(p3, p5).
rodzic(p4, p5).

% D

rodzic(p1, p3).
rodzic(p1, p4).
rodzic(p2, p4).

% E

rodzic(p1, p4).
rodzic(p2, p4).
rodzic(p2, p5).
rodzic(p3, p5).

% F

rodzic(p1, p3).
rodzic(p1, p4).
rodzic(p2, p5).
rodzic(p3, p5).

% G

rodzic(p1, p4).
rodzic(p1, p3).
rodzic(p2, p3).
rodzic(p2, p5).
