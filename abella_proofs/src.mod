module src.

src_equal S (src_uv N) T1 :- src_assigned? N S T, src_equal S T T1.
src_equal S T1 (src_uv N) :- src_assigned? N S T, src_equal S T1 T.
src_equal S (src_app (src_uv N :: Args)) T1 :- src_assigned? N S F, src_beta F Args T, src_equal S T T1.
src_equal S T1 (src_app (src_uv N :: Args)) :- src_assigned? N S F, src_beta F Args T, src_equal S T1 T.
src_equal S (src_app L1) (src_app L2) :- forall2 (src_equal S) L1 L2.
src_equal S (src_lam F1) (src_lam F2) :- pi x\ src_equal S x x => src_equal S (F1 x) (F2 x).
src_equal _ (src_c X) (src_c X).
src_equal _ (src_uv N) (src_uv N).
src_equal S (src_lam F) T :- % not (T = src_lam _), 
  pi x\ src_beta T (x :: nil) (T' x), src_equal S (src_lam F) (src_lam T').
src_equal S T (src_lam F) :- % not (T = src_lam _), 
  pi x\ src_beta T (x :: nil) (T' x), src_equal S (src_lam T') (src_lam F).
src_equal S (src_app (src_lam X :: TL)) T :- src_beta (src_lam X) TL T', src_equal S T' T.
src_equal S T (src_app (src_lam X :: TL)) :- src_beta (src_lam X) TL T', src_equal S T T'.

src_beta A nil A.
src_beta (src_lam Bo) (H :: L) R :- src_beta (Bo H) L R.
src_beta (src_app A) L (src_app X) :- append A L X.
src_beta (src_uv N) L (src_app (src_uv N :: L)).
src_beta (src_c H) L (src_app (src_c H :: L)).

src_assigned? z (some Y :: _) Y.
src_assigned? (s N) (_ :: L) X :- src_assigned? N L X.

src_assign z (none :: L) Y (some Y :: L).
src_assign (s N) (X :: L) Y (X :: L1) :- src_assign N L Y L1.
