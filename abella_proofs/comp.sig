sig comp.

accum_sig common.
accum_sig src.
accum_sig tgt.

kind link type.
type link nat -> nat -> nat -> link.

type comp src_tm -> tm -> list link -> list link -> list (option assignment) ->  list (option assignment) -> o.
type decomp list link -> list link -> list (option assignment) -> list (option src_tm) -> list (option src_tm) -> o.
