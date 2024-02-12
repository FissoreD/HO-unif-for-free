module common.

forall2 _ [] [].
forall2 F [X|XS] [Y|YS] :- F X Y, forall2 F XS YS.

exists1 F [X|XS] :- F X ; exists1 F XS.

forall1 F [X|XS] :- F X, forall1 F XS.
forall1 [].

fold2 _ [] [] A A.
fold2 F [X|XS] [Y|YS] A A1 :- F X Y A A0, fold2 F XS YS A0 A1.

append [] X X.
append [X|XS] YS [X|R] :- append XS YS R.

rev [] [].
rev (X :: XS) L :- rev XS L1, append L1 (X :: nil)  L.

diff (s _) z.
diff z (s _).
diff (s X) (s Y) :- diff X Y.

 
