# REVIEW 1  

- [ ] Line 1368: The authors mention that one reason for delaying the
  application of substitutions is to keep the term structure indexable.
  One can imagine another reason for making such a delay, especially in
  a logic programming setting, is that failure can be encountered, and
  the work done in computing complete normal forms would be wasted.  Is
  there any evidence of that justification?
- [ ] It might interest the reader to explain what features of lambda Prolog
  that are not in Prolog remain in your specification.  For example,
  your code does not reduce HOU to first-order logic/Prolog.  The
  universal quantifier in goals and the pattern fragment unification are
  critical to your encoding, right?
- [ ] line 26: This is the first time I've seen the "\beta\eta"
   conversion written as "\eta\beta$.  Is there a good reason to
   switch this order from the normal?
   > Comment: We use beta-eta since we treat beta before eta in the paper
- [ ] line 70: "for the Coq's system" - rewrite
- [x] line 112: The reference for pattern unification is not [11] but
   Miller's 1991 paper in the J. of Logic and Computation. (cf 827b11dd2df213b9f446b77434fef8cb6591f00b)
- [ ] line 247: Using "subscript" as a verb is odd.  Revise that
   sentence.
- [ ] line 240: Definition 2.6 asks that a term is an eta expansion.
   Does this mean the term is an eta-redex, a term of the form 
   (lambda x. M x) where x is not free in M ?
- [ ] line 1117 "desappears"
- [ ] line 1301: "heigenvariables"
- [ ] line 1311: "mathes"
- [ ] line 1324; "since it removes all THE data from THE rule's heads"
- [ ] line 1335: "to accommodate for the one" drop "for"?
- [ ] line 1355: "reather"
- [ ] An early attempt to reduce HOU (at least, 2nd order unification) to
   the pattern fragment can be found in Miller 1991 paper "Unification
   of Simply Typed Lambda-Terms as Logic Programming", ICLP91. That
   early approach does not provide the flexibility apparent in the
   present paper.


# REVIEW 2

- [ ] The abstract is a little bit vague. It writes "more well-behaved" and 
      "problems" without any hint about what this might mean. A stronger 
      abstract would define the problem more clearly.
- [ ] "Instance forall_dec: ∀A P, Finite A → (* r3 *) ∀x:A, Decision (P x) →
      Decision (∀x:A, P x)." I think parentheses are missing around "∀x:A, 
      Decision (P x)"?
- [ ] "an Higher-Order Abstract Syntax" an => a
- [ ] "for the Coq’s system" => "for Coq's type system"
- [ ] I'm a bit surprised it is called "good unification" and not "most general 
      unification"
- [ ] "our real goal is to simulate the execution of an entire logic-program."
      I do not understand what you mean by a "real goal". Is this in contrast 
      to some goals that are not "real". I do not understand what this means.
- [ ] "so that the code of (𝑚𝑎𝑙𝑙𝑜𝑐) below can preserve" what can it preserve?
- [ ] "ensures the mapping are bijective" are => is
- [ ] In the definition of comp: "(arity z)" What is "arity z"?

# REVIEW 3

- [ ] Usually, I think of the eta rule as a type-directed expansion (capturing
    a form of extensionality) rather than a contraction.  I wonder if the
    authors could expand on (a) on the significance of eta for the object
    language as it relates to type-class resolution, and (b) whether it might
    be possible to make encoding sufficiently aware of the object-language
    types as eta might be modeled via an expansion.
- [ ] In terms of related work, I might point out the paper
    "Higher-Order Logic Programming as Constraint Logic Programming" by
    Michaylov and Pfenning from PPCP 1993 which makes similar points as
    lines 1287-1291.  The Twelf manual also describes how nonpattern constraints
    are postponed, and how other constraint domains are integrated (Chapters 5.5 and 6),
    although not at the level of generality as CHR.