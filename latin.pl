:- module(latin, [latinSquare/2]).

:- use_module(library(lists)).
:- use_module(library(clpz)).

latinSquare(Rows, Size) :-
    append(Rows, Values),
    length(Rows, Size),
    maplist(same_length(Rows), Rows),
    Values ins 1..Size,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns).
