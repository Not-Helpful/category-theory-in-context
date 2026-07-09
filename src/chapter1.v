Require Import Stdlib.Vectors.Vector.
From Stdlib Require Import Init.Prelude.
Require Import Stdlib.Numbers.NatInt.NZAdd.
Require Import Arith.

Check Vector.t.

Fixpoint append
  {A : Type} {n m : nat}
  (a : t A n) (b : t A m) : t A (n + m).
Proof.
