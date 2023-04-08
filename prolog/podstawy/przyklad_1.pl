% Student exercise profile
:- set_prolog_flag(occurs_check, error).		% dissallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).	% limit term space (8Mb)
:- set_prolog_stack(local, limit(2 000 000)).	% limit environment space

% Your program goes here
pogoda(lublin, lato, cieple).
pogoda(lublin, zima, umiarkowana).
pogoda(kair, lato, upalne).
pogoda(kair, zima, bardzo_ciepla).
pogoda(jakutsk, lato, umiarkowane).
pogoda(jakutsk, zima, bardzo_mrozna).

/** <examples> Your example queries go here, e.g.
?- pogoda(Miasto, _, umiarkowana).
*/
