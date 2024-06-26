module tgt.

unif (uv N Args) T S S1 :- assigned? N S F, beta-abs F Args T1, unif T1 T S S1.
unif T (uv N Args) S S1 :- assigned? N S F, beta-abs F Args T1, unif T T1 S S1.
unif (uv N A) (uv N A) S S :- pattern-fragment A.
unif (uv N Args1) (uv M Args2) S S3 :- pattern-fragment Args1, pattern-fragment Args2, 
  new S W S1, prunexx W Args1 Args2 Ass, assign N S1 Ass S2, assign M S2 Ass S3.
unif (uv N Args) T S S1 :- % not (T = uv _ _),
  not_occ N S T, pattern-fragment Args, bind Args T T1, assign N S T1 S1.
unif T (uv N Args) S S1 :- % not (T = uv _ _),
  not_occ N S T, pattern-fragment Args, bind Args T T1, assign N S T1 S1.
unif (app L1) (app L2) S S1 :- fold2_unif L1 L2 S S1.
unif (lam F1) (lam F2) S S1 :- pi x\ (pi S\ unif x x S S) => unif (F1 x) (F2 x) S S1.
unif (c X) (c X) S S.

fold2_unif nil nil S S.
fold2_unif (X :: XS) (Y :: YS) S0 S1 :- unif X Y S0 S, fold2_unif XS YS S S1.

beta-abs (abs Bo) (H :: L) R :- beta-abs (Bo H) L R.
beta-abs (val A)  nil A.
beta-abs (val (app A))  L (app X) :- append A L X.
beta-abs (val (uv N A)) L (uv N X) :- append A L X.
beta-abs (val (c H))    L (app (c H :: L)).

not_occ_aux N S (uv M _) :- % not(assigned? M S _), 
  assign M S _ _, diff N M.
not_occ_aux N S (uv M Args) :- assigned? M S F, beta-abs F Args T, not_occ_aux N S T.
not_occ_aux N S (app L) :- forall1_not_occ_aux N S L.
not_occ_aux N S (lam F) :- pi x\ not_occ_aux N S x => not_occ_aux N S (F x).
 
forall1_not_occ_aux N S (X :: XS) :- not_occ_aux N S X, forall1_not_occ_aux N S XS.
forall1_not_occ_aux N S nil.

not_occ N S (uv N _).
not_occ N S (uv M Args) :- assigned? M S F, beta-abs F Args T, not_occ N S T.
not_occ N S (c _).
not_occ N S (app L) :- not_occ_aux N S (app L).
not_occ N S (lam L) :- not_occ_aux N S (lam L).

new nil z (none :: nil).
new (X :: XS) (s N) (X :: YS) :- new XS N YS.
 
bind nil T (val T') :- copy T T'.
bind (X :: TL) T (abs T') :- pi x\ copy X x => bind TL T (T' x).

copy (app L) (app L') :- forall2_copy L L'.
copy (lam T) (lam T') :- pi x\ copy x x => copy (T x) (T' x).
copy (uv N L) (uv N L') :- forall2_copy L L'.
copy (c C) (c C).

forall2_copy nil nil.
forall2_copy (X :: XS) (Y :: YS) :- copy X Y, forall2_copy XS YS.


prunexx N A1 A2 T :-
  prune-aux N A1 A2 nil T _.
prune-aux N nil nil ACC (val (uv N Args)) tt :- rev ACC Args.
prune-aux N (X :: XS) (X :: YS) ACC (abs F) O :- pi x\ prune-aux N XS YS (x :: ACC) (F x) O.
prune-aux N (_ :: XS) (_ :: YS) ACC (abs F) _ :- pi x\ prune-aux N XS YS ACC (F x) tt.


assigned? z (some Y :: _) Y.
assigned? (s N) (_ :: L) X :- assigned? N L X.
 
assign z (none :: L) Y (some Y :: L).
assign (s N) (X :: L) Y (X :: L1) :- assign N L Y L1.

equal S (uv N Args) T1 :- assigned? N S F, beta-abs F Args T, equal S T T1.
equal S T1 (uv N Args) :- assigned? N S F, beta-abs F Args T, equal S T1 T.
equal S (app L1) (app L2) :- forall2_equal S L1 L2.
equal S (lam F1) (lam F2) :- pi x\ equal S x x => equal S (F1 x) (F2 x).
equal _ (c X) (c X).
equal _ (uv N A) (uv N A).

forall2_equal S nil nil.
forall2_equal S (X :: XS) (Y :: YS) :- equal S X Y, forall2_equal S XS YS.

