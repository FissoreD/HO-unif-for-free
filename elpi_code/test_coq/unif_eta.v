Class C (i : nat -> nat).

Instance I : forall F, C (fun x => S (F x)). Qed.

Goal C (fun x => S 0). apply I. Show Proof. Qed.
Goal C S. apply I. Show Proof. Qed.


Class D (i : nat -> nat) (l: nat -> nat).

Instance ID : forall F, D (fun x => S (F x)) F. Qed.
Goal exists F, D F S. eexists. apply _. Show Proof. Qed.
Goal exists F, D F (fun x => x). eexists. apply _. Show Proof. Qed.



