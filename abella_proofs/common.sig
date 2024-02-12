sig common.

kind nat type.
type z nat.
type s nat -> nat.

type diff nat -> nat -> o.
 
kind option type -> type.
type some A -> option A.
type none option A.

kind bool type.
type tt bool.
type ff bool.

% type fold2 (A -> A1 -> B -> B -> o) -> list A -> list A1 -> B -> B -> o.
% type exists1 (A -> o) -> list A -> o.
% type forall1 (A -> o) -> list A -> o.
% type forall2 (A -> A -> o) -> list A -> list A -> o.
type append list A -> list A -> list A -> o.
type rev list A -> list A -> o.
