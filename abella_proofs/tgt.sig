sig tgt.

accum_sig common.

kind tm type.
type app list tm -> tm.
type lam (tm -> tm) -> tm.
type uv  nat -> list tm -> tm.
type c nat -> tm.

kind assignment type.
type abs (tm -> assignment) -> assignment.
type val tm -> assignment.

type unif tm -> tm -> list (option assignment) -> list (option assignment) ->  o.
type fold2_unif list tm -> list tm -> list (option assignment) -> list (option assignment) ->  o.
type equal list (option assignment) -> tm -> tm -> o.
type forall2_equal list (option assignment) -> list tm -> list tm -> o.
type beta-abs assignment -> list tm -> tm -> o.
type bind list tm -> tm -> assignment -> o.
type copy tm -> tm -> o.
type forall2_copy list tm -> list tm -> o.
type new list (option assignment) -> nat -> list (option assignment) -> o.
type pattern-fragment list tm -> o.
type not_occ  nat -> list (option assignment) -> tm -> o.
type forall1_not_occ_aux  nat -> list (option assignment) -> list tm -> o.
type not_occ_aux nat -> list (option assignment) -> tm -> o.
type prunexx nat -> list tm -> list tm -> assignment -> o.
type prune-aux nat -> list tm -> list tm -> list tm -> assignment -> bool -> o.

type assigned? nat -> list (option assignment) -> assignment -> o.
type assign nat -> list (option assignment) -> assignment -> list (option assignment) -> o.
