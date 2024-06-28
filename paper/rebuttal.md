Dear reviewers and PC members, we are happy for the accurate and positive
reviews.
We take the occasion to answer a few questions, hopefully to satisfy the
interest of the reviewers.

----------------------- REVIEW 1 ---------------------
> Line 1368: The authors mention that one reason for delaying the
> application of substitutions is to keep the term structure indexable.
> One can imagine another reason for making such a delay, especially in
> a logic programming setting, is that failure can be encountered, and
> the work done in computing complete normal forms would be wasted.  Is
> there any evidence of that justification?

According to our experience, that is specific to the use of LP in the context
of Coq, delaying substitution (esp beta reduction) was not a crucial advantage.
An early prototype of Elpi did implement an explicit substitution calculus
but we could not observe a considerable gain (enough to justify its complexity).
Our intuition is that, in Coq, long reductions are not made of beta steps,
but rather fixpoint unfolding and ML-like pattern matching (interleaved with
betas). So just delaying beta, and sharing beta-normal forms, is not enough to
increase the performance in this context.

We hope to have correctly understood the question.

> It might interest the reader to explain what features of lambda Prolog
> that are not in Prolog remain in your specification.  For example,
> your code does not reduce HOU to first-order logic/Prolog.  The
> universal quantifier in goals and the pattern fragment unification are
> critical to your encoding, right?

We absolutely need:

1. pattern unification (and pi to induce fresh nominals)
2. delaying of goals (our links)

CHR rules, or a reified main loop (scheduling of goals), is needed only to
guarantee fidelity, that amounts at failing as soon as possible.
This may or may not be needed, depending on the use case.
It surely is in ours.

----------------------- REVIEW 2 ---------------------
> "our real goal is to simulate the execution of an entire logic-program."
> I do not understand what you mean by a "real goal".
> Is this in contrast to some goals that are not "real". I do not understand what this means.

Apologies for our English, we are not native speakers.

What we meant is that our ultimate/true goal is not (only) to implement an HO
unification procedure, but rather to simulate the execution of a whole
logic-program, that is made of many calls to that unification procedure.

We will reformulate and avoid the word "real", it is maybe a false friend with
"true" (in Italian).

> "so that the code of (𝑚𝑎𝑙𝑙𝑜𝑐) below can preserve:"
> what can it preserve?

Sorry again, sloppy wording.

We should have written "so that the code of (𝑚𝑎𝑙𝑙𝑜𝑐) can preserve
Invariant 1 written below".

----------------------- REVIEW 3 ---------------------
> Usually, I think of the eta rule as a type-directed expansion (capturing
> a form of extensionality) rather than a contraction.  I wonder if the
> authors could expand on (a) on the significance of eta for the object
> language as it relates to type-class resolution, and (b) whether it might
> be possible to make encoding sufficiently aware of the object-language
> types as eta might be modeled via an expansion.

The main reason why we did focus on contraction is that it is what the user
wants to see and typically writes when declaring type class instances. Eg
"Decidable prime" and not "Decidable (fun x => prime x)".

DAVIDE CHECK THIS: ma dove è che contraiamo? si può fare (b) facilmente? Serve chiamare coq.typecheck?

> In terms of related work, I might point out the paper
> "Higher-Order Logic Programming as Constraint Logic Programming" by
> Michaylov and Pfenning from PPCP 1993 which makes similar points as
> lines 1287-1291.  The Twelf manual also describes how nonpattern constraints
> are postponed, and how other constraint domains are integrated (Chapters 5.5 and 6),
> although not at the level of generality as CHR.

We sincerely thank the reviewer for this pointer.

