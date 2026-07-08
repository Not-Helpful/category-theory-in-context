Require Import Stdlib.Vectors.Vector.
From Stdlib Require Import Init.Prelude.
Require Import Stdlib.Numbers.NatInt.NZAdd.
Require Import Arith.

Check Vector.t.

Fixpoint append
  {A : Type} {n m : nat}
  (a : t A n) (b : t A m) : t A (n + m) :=
  match b in t _ m0 return (t A (n+m0))
  with
  | (Vector.nil _) =>
      match Nat.add_0_r n with
      | eq_refl => a
      end
  | (Vector.cons _ b_elem m0 b') => 
      Vector.cons A b_elem (n + S m0) (append a b')
  end.
