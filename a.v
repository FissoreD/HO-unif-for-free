Goal forall (X: Type -> Type), exists (F: Type -> Type -> Type),
  X = F nat.
Proof.
  eexists. 
  apply _.