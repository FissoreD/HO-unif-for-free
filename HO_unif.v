From elpi Require Import tc.
From elpi Require Import elpi.

Inductive sig (A : Type) (P : A -> Prop) : Type.

Class Decision (P : Prop) := decide : {P} + {not P}.
Class RelDecision {A B: Type} (R : A -> B -> Prop).
Class ProofIrrel (A : Type) : Prop := proof_irrel (x y : A) : x = y.
Elpi Accumulate tc.db lp:{{
  :after "0"
  under-ho-twins-call K _ _ _ C :- !, K C.
  :after "0"
  ho-preprocess T T [] :- !.
  tc-HO_unif.tc-ProofIrrel (app [X1, Y]) _ :- coq.error "Fail on" X1.
}}.

Instance decide_rel: forall (A B : Type) (R : A -> B -> Prop),
  RelDecision R -> forall (x : A) (y : B), Decision (R x y). Admitted.
Instance True_pi : ProofIrrel True. Admitted.
Instance sig_eq_dec: forall (A : Type) (P : A -> Prop),
  (forall x, ProofIrrel (P x)) -> RelDecision (@eq A) ->
  RelDecision (@eq (sig A P)). Admitted.

Elpi Print TC.Solver.

Instance H11 : RelDecision (@eq nat). Qed.

Goal forall (a b: nat), Decision (eq a b).
  intros.
  apply decide_rel.
  apply _.
Qed.

Goal exists P, RelDecision (@eq (sig nat P)).
  intros.
  eexists.
  eapply sig_eq_dec.
  intros.
  Elpi Trace Browser.
  (* apply _. *)
  apply True_pi.
  apply _.
Qed.
