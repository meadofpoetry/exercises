Require Export Basics.

Theorem plus_n_0 : forall n : nat, n = n + 0.
Proof. intros. induction n as [| n' IHn'].
       - reflexivity.
       - simpl. rewrite <- IHn'. reflexivity. Qed.

Theorem minus_diag : forall n, minus n n = 0.
Proof. intros. induction n as [| n' IHn].
       - reflexivity.
       - simpl. rewrite -> IHn. reflexivity. Qed.

Theorem mult_0_r : forall n : nat, n * 0 = 0.
Proof. intros. induction n as [| n' IH].
       - reflexivity.
       - simpl. rewrite -> IH. reflexivity. Qed.

Theorem plus_n_Sm : forall n m : nat, S (n + m) = n + S m.
Proof. intros. induction n as [| n' IH ].
       - reflexivity.
       - simpl. rewrite -> IH. reflexivity. Qed.

Theorem plus_comm : forall n m : nat, n + m = m + n.
Proof. intros. induction n as [| n' IH].
       - simpl. rewrite <- plus_n_0. reflexivity.
       - simpl. rewrite -> IH. rewrite plus_n_Sm. reflexivity. Qed.

Theorem plus_assoc : forall n m p : nat, n + (m + p) = (n + m) + p.
Proof. intros. induction n as [| n' IH ].
       - reflexivity.
       - simpl. rewrite -> IH. reflexivity. Qed.

Fixpoint double (n:nat) :=
  match n with
  | O => O
  | S n' => S (S (double n'))
  end.

Lemma double_plus : forall n, double n = n + n.
Proof. intros. induction n as [| n' IH ].
       - reflexivity.
       - simpl. rewrite <- plus_n_Sm. rewrite <- IH. reflexivity. Qed.

Theorem evenb_S : forall n : nat, evenb (S n) = negb (evenb n).
Proof. intros. induction n as [| n' IH ].
       -  reflexivity.
       - rewrite -> IH. simpl. rewrite -> negb_involutive. reflexivity. Qed.


