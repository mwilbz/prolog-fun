:- use_module(library(clpz)).
:- use_module(library(lists)).

:- use_module(latin).
:- use_module(kenken).

int_sum_list(Xs, Sum) :-
    int_sum_list(Xs, 0, Sum).

int_sum_list([], Sum0, Sum) :-
    Sum #= Sum0.
int_sum_list([X|Xs], Sum0, Sum) :-
    Sum1 #= Sum0 + X,
    int_sum_list(Xs, Sum1, Sum).

listSumsToOne(List) :- int_sum_list(List, 1).

oneTruePerRowCol(BoolGrid) :-
    append(BoolGrid, BoolGridFlat),
    ins(BoolGridFlat, 0..1),
    maplist(listSumsToOne, BoolGrid),
    transpose(BoolGrid, BoolGridTranspose),
    maplist(listSumsToOne, BoolGridTranspose).

liarRelation(DisplayedValue, ActualValue, 0) :- DisplayedValue #= ActualValue.
liarRelation(_, _, 1).

problem(DisplayedValues, ActualValues, IsLiar) :-
    DisplayedValues = [
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_]
    ],
    latinSquare(DisplayedValues, 9),
    IsLiar = [
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,_,_,_,_]
    ],
    oneTruePerRowCol(IsLiar),
    ActualValues = [
        [V11,V12,V13,V14,V15,V16,V17,V18,V19],
        [V21,V22,V23,V24,V25,V26,V27,V28,V29],
        [V31,V32,V33,V34,V35,V36,V37,V38,V39],
        [V41,V42,V43,V44,V45,V46,V47,V48,V49],
        [V51,V52,V53,V54,V55,V56,V57,V58,V59],
        [V61,V62,V63,V64,V65,V66,V67,V68,V69],
        [V71,V72,V73,V74,V75,V76,V77,V78,V79],
        [V81,V82,V83,V84,V85,V86,V87,V88,V89],
        [V91,V92,V93,V94,V95,V96,V97,V98,V99]
    ],
    append(DisplayedValues, DisplayedValuesFlat),
    append(ActualValues, ActualValuesFlat),
    append(IsLiar, IsLiarFlat),
    ins(ActualValuesFlat, 1..9),
    maplist(liarRelation, DisplayedValuesFlat, ActualValuesFlat, IsLiarFlat),
    9 #= V11 * V12,
    21 #= V13 + V23 + V24,
    15 #= V14 + V15,
    25 #= V16 + V17 + V26,
    kenkenDiv(V18, V19, 9),
    9 #= V21 * V31,
    54 #= V22 * V32 * V33,
    26 #= V25 + V34 + V35,
    12 #= V27 + V37 + V47,
    40 #= V28 * V38,
    21 #= V29 + V39 + V49,
    10 #= V36 * V46,
    6 #= V41 * V42,
    kenkenSub(V43, V44, 2),
    13 #= V45 + V55,
    17 #= V48 + V58,
    12 #= V51 + V61,
    8 #= V52 * V62,
    kenkenSub(V53, V54, 3),
    56 #= V56 * V57,
    13 #= V59 + V68 + V69,
    6 #= V63 + V73,
    kenkenDiv(V64, V74, 3),
    15 #= V65 + V75,
    kenkenSub(V66, V76, 5),
    kenkenSub(V67, V77, 5),
    5 #= V71 * V81,
    15 #= V72 + V82,
    kenkenSub(V78, V79, 1),
    4 #= V83 * V93,
    kenkenSub(V84, V94, 3),
    15 #= V85 + V95,
    kenkenSub(V86, V87, 6),
    kenkenDiv(V88, V98, 2),
    kenkenSub(V89, V99, 4),
    54 #= V91 * V92,
    16 #= V96 + V97.
