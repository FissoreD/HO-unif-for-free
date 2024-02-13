sig src.

accum_sig common.

kind src_tm type.
type src_app list src_tm -> src_tm.
type src_lam (src_tm -> src_tm) -> src_tm.
type src_uv  nat -> src_tm.
type src_c nat -> src_tm.

type src_assigned? nat -> list (option src_tm) -> src_tm -> o.
type src_assign nat -> list (option src_tm) -> src_tm -> list (option src_tm) -> o.
type src_equal list (option src_tm) -> src_tm -> src_tm -> o.
type forall2_src_equal list (option src_tm) -> list src_tm -> list src_tm -> o.
type src_beta src_tm -> list src_tm -> src_tm -> o.

 