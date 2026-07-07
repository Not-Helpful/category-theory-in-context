Require Import Stdlib.Vectors.Vector.
From Stdlib Require Import Init.Prelude.

Check Vector.t.


Fixpoint append
  {A : Type} {n m : nat}
  (a : t A n) (b : t A m) : t A (n + m) :=
  match b with
  | (Vector.nil _) => a
  | (Vector.cons _ b_elem m b) => _
  end.
