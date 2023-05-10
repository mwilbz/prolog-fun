:- use_module(library(clpz)).

:- use_module(latin).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).

sudoku(Rows) :-
    latinSquare(Rows, 9),
    Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
    blocks(As, Bs, Cs), blocks(Ds, Es, Fs), blocks(Gs, Hs, Is).

sudokuProblem1(Rows) :-
    % set_prolog_flag(answer_write_options,[max_depth(0)]),
    Rows = [
        [2,6,8,5,9,_,1,4,_],
        [_,_,3,_,_,_,7,8,_],
        [7,5,_,4,3,8,9,6,_],
        [_,_,2,_,_,_,_,5,_],
        [_,_,_,7,5,_,_,3,6],
        [6,_,_,8,_,1,_,_,9],
        [5,1,_,_,_,_,_,9,_],
        [_,2,9,3,_,5,_,_,_],
        [_,_,_,_,1,_,_,_,8]
    ],
    sudoku(Rows).

sudokuProblem2(Rows) :-
    % set_prolog_flag(answer_write_options,[max_depth(0)]),
    Rows = [
        [_,8,_,7,_,_,_,_,_],
        [_,_,_,_,5,_,9,_,_],
        [7,_,1,_,_,2,_,6,_],
        [_,2,_,_,_,_,_,8,_],
        [_,3,_,_,_,4,_,_,_],
        [4,_,8,9,_,_,6,_,_],
        [6,_,4,_,_,7,_,1,_],
        [3,_,_,_,_,_,_,_,_],
        [_,_,_,2,_,_,_,_,7]
    ],
    sudoku(Rows).

sudokuProblem3(Rows) :-
    % set_prolog_flag(answer_write_options,[max_depth(0)]),
    Rows = [
        [5,8,9,7,_,_,_,_,_],
        [2,6,3,1,5,8,9,7,_],
        [7,4,1,3,9,2,_,6,_],
        [_,2,7,6,_,5,_,8,_],
        [_,3,6,8,2,4,7,_,_],
        [4,5,8,9,7,_,6,_,_],
        [6,9,4,5,_,7,_,1,_],
        [3,7,2,_,_,_,_,_,6],
        [8,1,5,2,_,_,_,_,7]
    ],
    sudoku(Rows).