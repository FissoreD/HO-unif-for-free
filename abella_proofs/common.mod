module common.

% forall2 _ nil nil.
% forall2 F (X :: XS) (Y :: YS) :- F X Y, forall2 F XS YS.
% 
% exists1 F (X :: XS) :- F X.
% exists1 F (X :: XS) :- exists1 F XS.
% 
% forall1 F (X :: XS) :- F X, forall1 F XS.
% forall1 F nil.

% fold2 _ nil nil A A.
% fold2 F (X :: XS) (Y :: YS) A A1 :- F X Y A A0, fold2 F XS YS A0 A1.

append nil X X.
append (X :: XS) YS (X :: R) :- append XS YS R.

rev nil nil.
rev (X :: XS) L :- rev XS L1, append L1 (X :: nil)  L.

diff (s _) z.
diff z (s _).
diff (s X) (s Y) :- diff X Y.

 
