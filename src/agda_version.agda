
-- In this document, we are following the seminar
module agda_version where

import Relation.Binary.PropositionalEquality as Eq
open Eq using (subst; _≡_; refl )


data Nat : Set where
  zero : Nat
  suc : Nat -> Nat

data Vec (𝐴 : Set) : Nat → Set where
  [] : Vec 𝐴 zero
  _::_ : {𝑛 : Nat} → 𝐴 → Vec 𝐴 𝑛 → Vec 𝐴 (suc 𝑛)

_+_ : Nat -> Nat -> Nat
zero + m = m
(suc n) + m = suc (n + m)


cong : {X Y : Set} -> (f : X -> Y) -> {x y : X} -> x ≡ y -> f x ≡ f y
cong f refl = refl

data List (X : Set) : Set where
  [] : List X
  _::_ : X -> List X -> List X


sym : {X : Set} -> {x y : X} -> x ≡ y -> y ≡ x
sym {x = x} p = subst ((λ z -> z ≡ x)) p refl

trans : {X : Set} -> {x : X} {y : X} {z : X} -> (x ≡ y) -> (y ≡ z) -> (x ≡ z)
trans {x = x} p1 p2 = subst (λ z → x ≡ z) p2 p1

data ⊥ : Set where

0not1 : zero ≡ suc(zero)  -> ⊥
0not1 = λ p -> subst P p (suc (suc (zero)))
  where
    P : Nat -> Set
    P zero = Nat
    P (suc zero)  = ⊥
    P n = Nat


