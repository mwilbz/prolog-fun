:- module(kenken, [kenkenSub/3, kenkenDiv/3]).

:- use_module(library(clpz)).

:- use_module(latin).

kenkenSub(Val1, Val2, Target) :- Target #= Val1 - Val2; Target #= Val2 - Val1.
kenkenDiv(Val1, Val2, Target) :- Val1 #= Val2 * Target; Val2 #= Val1 * Target.

kenkenProblem1(Rows) :-
    Rows = [[Sq11, Sq12, Sq13, Sq14], [Sq21, Sq22, Sq23, Sq24], [Sq31, Sq32, Sq33, Sq34], [Sq41, Sq42, Sq43, Sq44]],
    latinSquare(Rows, 4),
    24 #= Sq11 * Sq12 * Sq22,
    kenkenSub(Sq21, Sq31, 2),
    Sq41 #= 2,
    7 #= Sq13 + Sq14 + Sq24,
    Sq23 #= 3,
    kenkenDiv(Sq33, Sq34, 2),
    9 #= Sq32 + Sq42 + Sq43 + Sq44.

kenkenProblem2(Rows) :-
    Rows = [[Sq11, Sq12, Sq13, Sq14], [Sq21, Sq22, Sq23, Sq24], [Sq31, Sq32, Sq33, Sq34], [Sq41, Sq42, Sq43, Sq44]],
    latinSquare(Rows, 4),
    kenkenDiv(Sq11, Sq12, 2),
    4 #= Sq21 + Sq22,
    7 #= Sq31 + Sq32 + Sq41,
    kenkenSub(Sq42, Sq43, 2),
    Sq33 #= 4,
    5 #= Sq34 + Sq44,
    6 #= Sq13 * Sq23,
    kenkenSub(Sq14, Sq24, 3).

