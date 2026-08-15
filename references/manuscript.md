# Manuscripts, grants, response letters, and cover letters

The manuscript sub-surface of the external surface. A manuscript is the one place in the repo
where prose *is* the deliverable, so the edits are higher-value and the mistakes are higher-cost.
Everything here assumes the rails in SKILL.md are already in force — especially that a manuscript
edit is a proposal the author reviews, never a silent rewrite.

For the other external surfaces — slide decks, posters, talk scripts, speaker notes, and blog or
press prose — see [presentations.md](presentations.md).

## Contents

- [The two buckets](#the-two-buckets)
- [What must never change](#what-must-never-change)
- [LLM register in academic prose](#llm-register-in-academic-prose)
- [Structural tells](#structural-tells)
- [Claim strength](#claim-strength)
- [Section-by-section](#section-by-section)
- [Response letters](#response-letters)
- [Cover letters](#cover-letters)
- [Grant proposals](#grant-proposals)
- [Word limits](#word-limits)
- [LaTeX mechanics](#latex-mechanics)
- [Delivering the edit](#delivering-the-edit)

---

## The two buckets

Sort every proposed manuscript edit into one of two buckets and keep them separate in the diff and
the report. This split is the whole safety design: it lets the author accept a hundred register
fixes at a glance while giving genuine attention to the handful of edits that touch the argument.

**Bucket A — register only.** The proposition is bit-for-bit identical; only the wording changed.
Deleting "It is important to note that", collapsing "performs a calculation of" to "computes",
cutting a paragraph-closing sentence that restates the paragraph-opening sentence. Apply these.

**Bucket B — meaning-adjacent.** Anything that could change what a reader concludes: claim
strength, hedge removal, sentence merges that create a new causal implication, reordering that
changes emphasis, cutting a clause that qualified a result, anything inside or adjacent to a
number or citation. Do not apply these. Propose each one with the original, the proposal, and one
line on what changes.

When you cannot tell which bucket an edit belongs in, it is Bucket B. The cost of over-flagging is
the author reading one extra line; the cost of under-flagging is a claim in a published paper that
the data do not support.

---

## What must never change

Not "be careful with" — never, in any bucket, without the author explicitly asking:

- **Numbers and statistics.** Effect sizes, CIs, p-values, N, df, percentages, model
  coefficients, dates. Not their values, not their rounding, not their direction.
- **Citations.** No added, removed, reattributed, or relocated `\cite`. Moving a citation from
  one clause to another changes who is claimed to have shown what. Citation *verification* — is
  this a real paper, does it say this — is a different job and not this skill's.
- **Direct quotations**, including reviewer text quoted in a response letter and participant
  quotes in qualitative work. Edit around them, never inside.
- **Math**, `equation`/`align`/`\(…\)` environments, and symbol definitions.
- **Limitations, exploratory labels, and preregistration statements.** Trimming a limitations
  paragraph for concision is the single most damaging edit available here. Shorten the prose only
  if every named limitation survives by name.
- **Journal-mandated boilerplate**: ethics approval, consent, funding, conflicts of interest,
  data and code availability, CRediT author contributions, registration statements. These are
  often required verbatim and are legally or institutionally load-bearing.
- **Author names, affiliations, ORCIDs, acknowledgements.**
- **The line-break convention.** If the source uses one sentence per line, keep it — reflowing
  destroys the author's git diff and their co-authors' review workflow. Match whatever is there.

---

## LLM register in academic prose

The vocabulary that marks a paragraph as machine-drafted. Each is a signal, not a verdict: check
whether the word is doing work in this sentence before cutting. For the sentence-architecture
family — binary contrasts, false agency, vague declaratives, and the rest — see
[structures.md](structures.md).

**Vogue verbs and nouns** — delve, underscore, showcase, leverage, utilize, facilitate,
encompass, garner; realm, landscape, tapestry, myriad, avenue, cornerstone, paradigm (outside its
Kuhnian sense).

**Inflated adjectives** — pivotal, crucial, vital, paramount, intricate, multifaceted, holistic,
nuanced, comprehensive, robust *as decoration*, profound, remarkable, unprecedented.

**Set phrases** — "shed light on", "pave the way for", "a testament to", "at the forefront of",
"in the ever-evolving landscape of", "navigate the complexities of", "plays a crucial role in",
"serves as a foundation for", "opens new avenues".

**Throat-clearing openers** — "It is important to note that", "It should be emphasized that",
"In today's world", "In recent years, there has been growing interest in", "It is widely
recognized that" (usually with no citation attached, which is the real problem).

**The fix is not synonym substitution.** "Plays a crucial role in" → "is important for" is still
empty. Ask what the sentence asserts. If it asserts a mechanism, name the mechanism. If it
asserts nothing, the sentence goes.

> **Leaked:** "Sleep quality plays a crucial role in shaping a myriad of cognitive outcomes,
> underscoring the pivotal importance of this multifaceted construct."
>
> **Fixed:** "Sleep quality predicts next-day working-memory span and sustained attention
> (Lim & Dinges, 2010)."

**Domain-term false positives.** These share words with the list and must survive: *robust*
(estimator, standard errors), *significant* (statistical), *power*, *bias*, *validation*,
*sensitivity*, *specificity*, *confounding*, *saturation*, *paradigm* (experimental paradigm),
*novel* (as in novel-object task). Read the sentence, not the token.

---

## Structural tells

Fluent bloat carries no flagged vocabulary, so these matter more than the word list.

- **Uniform paragraphs.** Five or six sentences each, throughout. Human sections vary; a one-line
  paragraph landing a key result is a feature.
- **Sandwich paragraphs.** The closing sentence restates the opening sentence. Cut the closer.
- **Topic sentence restates the heading.** "In this section, we describe the participants." Cut.
- **Discourse-marker chains.** Every paragraph opening with Furthermore / Moreover /
  Additionally / Notably. This is list-thinking rendered as prose. Keep a connective only where it
  marks a genuine logical turn — *however*, *because*, *in contrast* usually earn their place;
  *furthermore* almost never does.
- **Rule-of-three padding.** "a robust, comprehensive, and rigorous framework." Pick the one that
  is true, or the specific noun that replaces all three.
- **Redundant summary paragraph** at the end of a section that repeats the section.
- **Aim restated in abstract, intro, methods opener, and discussion opener.** State it once, in
  full, where it belongs; refer back without re-stating.
- **Prose that wants to be a list** ("Firstly… Secondly… Finally…") — either make it a real list
  or make it real prose with logical connectives.
- **Citation-free generality** as a paragraph opener: "It is well established that X." Either
  attach the citation or delete the sentence and start with the specific claim.

---

## Claim strength

The highest-risk category, and always Bucket B.

Agent-drafted discussion sections systematically overclaim, because confident prose is more
fluent. When trimming, verbs quietly strengthen: "was associated with" becomes "affected",
"is consistent with" becomes "demonstrates", "may contribute to" becomes "contributes to".

| Design supports | Verbs that fit | Verbs that do not |
|---|---|---|
| Correlational / observational | associated with, predicts, is consistent with, co-varies with | causes, affects, leads to, drives, demonstrates |
| Experimental, single study | increased, reduced, produced (in this sample) | proves, establishes, confirms |
| Exploratory / post hoc | suggests, is compatible with, warrants further test | shows, demonstrates, indicates |
| Meta-analytic / replicated | supports, demonstrates | proves |

Also flag: "clearly shows", "undoubtedly", "it is evident that", "strongly suggests" (usually a
hedge and an intensifier cancelling out), and any causal verb in a paper whose design is
cross-sectional.

**Hedge stacking** is the mirror problem: "may potentially contribute to" carries one hedge's worth
of uncertainty in three words. Keep the calibrated hedge, drop the duplicate — "may contribute to".
Never drop both.

**"Significant" is ambiguous in exactly the wrong place.** In a paper reporting statistics, an
unqualified "significant" reads as *p* < α whether or not that was meant. Every occurrence should
be either statistically qualified or replaced with *substantial*, *marked*, *meaningful*. Flag
these; do not bulk-replace, since some are correct.

---

## Section-by-section

**Title and abstract.** Every word is load-bearing under a hard limit. Cut hedging that repeats
the paper's design ("a preliminary exploratory investigation into the possible role of"), keep the
design descriptor that a reader needs to interpret the finding. The abstract's numbers must match
the Results exactly — if you touch the abstract, check them against the source, and report a
mismatch rather than fixing it silently.

**Introduction.** Bloat lives in the funnel: three paragraphs of general importance before the
specific gap. The gap statement and the hypotheses are the content; the ramp is compressible.
Never cut a citation to shorten the ramp.

**Methods.** Least compressible section in the paper. Reproducibility beats concision here —
apparatus, parameters, exclusions, software versions, and randomisation all stay. What does
compress: narration of the procedure's obviousness, and restating the design in three places.

**Results.** Trim only prose that repeats a table or figure verbatim. Never touch a number.
Keep every qualifier attached to a test.

**Discussion.** Where the most bloat and the most risk coexist. Cut the restatement of results
that opens most discussion sections down to one sentence, cut speculation that neither the data
nor a citation supports, and cut the "future research should" paragraph to the specific studies
that would actually discriminate the hypotheses. Do not touch limitations except to make them
more specific.

---

## Response letters

A distinct genre with its own slop. The reviewer is reading dozens of these and wants to find, per
point: what you did, where, and why.

**Structure that works** — per comment: the reviewer's text quoted verbatim, your response, and
the exact location of the change (section, page, line, or a quoted excerpt of the new text).

**The slop to cut:**

- **Serial gratitude.** "We thank the reviewer for this insightful and thoughtful comment"
  twenty times. One brief thanks per reviewer at the top, then substance. Editors and reviewers
  read the repetition as padding, not politeness.
- **Restating the comment before answering it.** The comment is quoted directly above. Answer it.
- **Unlocated change claims.** "We have revised the manuscript accordingly." Accordingly how, and
  where? Every response names the change and its location.
- **Hedged compliance.** "We have attempted to clarify this point somewhat." Either the change was
  made or it was not.
- **Buried disagreement.** Three sentences of appreciation wrapped around a refusal. State the
  disagreement plainly with the reason, then the alternative you offered. Reviewers respect a
  clear, reasoned no; they cannot evaluate a hidden one.

**Two integrity rails specific to this genre:**

1. **Never edit the quoted reviewer text.** Not for typos, not for length.
2. **Never write or tighten a claim that a change was made without verifying it against the
   actual manuscript diff.** An agent smoothing a response letter can easily produce a fluent
   sentence asserting a revision that does not exist. Check each claim against the diff, and
   report any you could not verify rather than polishing it.

---

## Cover letters

Short. What the paper shows, why it fits this journal specifically, and any declarations the
journal requires. Cut: the abstract restated, "your esteemed journal", generic significance
("this work will be of broad interest to your readership") unless it names the readership and
why, and any sentence that would fit an arbitrary paper submitted to an arbitrary journal.

---

## Grant proposals

A distinct genre with its own slop. A proposal is persuasive in a way a manuscript is not, which
makes it the surface where claim strength drift is most dangerous — reviewers reward confident
aims, and an agent drafting towards that reward overclaims.

**Cut.**

- **Significance inflation.** "transformative", "groundbreaking", "unprecedented", "will
  revolutionize", "a paradigm shift". State the specific advance and its consequences; let the
  reviewers decide the adjectives. One restraint phrase — "we will deliver the first X" — is
  fine when it is true and checkable.
- **The RFP restated.** A proposal that re-states the call's background section paragraph by
  paragraph is padding. Engage the call; do not echo it.
- **Reviewer-addressed justification** (see [taxonomy.md](taxonomy.md)): "this is clearly within
  scope because…", "as the call requests…". State the fit once, with the specific criterion.
- **The aim restated in summary, specific aims, significance, and approach.** Write each aim once,
  in full, where it belongs; reference it by name elsewhere.
- **Boilerplate about how rigorous and feasible the team is** without a named fact (the pilot
  data, the specific collaborator, the exact resource).

**Keep — these are load-bearing in a proposal.**

- **Every number that evidences feasibility**: pilot effect sizes, N, preliminary data,
  timelines with dates, budgets.
- **Preliminary-data caveats.** "Pilot, N=12, exploratory" stays next to the result it qualifies.
  Stripping it from a proposal is overclaiming to reviewers who will check.
- **Named commitments**: who will do what, by when, with what resource.
- **The specific aims**, verbatim in their numbered form — they are the contract of the proposal.
- **Mandated sections** (data management plan, broader impacts, human-subjects, budget
  justification) — often required, and the safest edit is structural, not semantic.

---

## Word limits

A limit is a constraint, not a licence to drop propositions. Work in this order and say which
stage you reached:

1. Cut Bucket A register bloat. In agent-drafted text this alone routinely recovers 10–20%.
2. Cut structural redundancy — sandwich sentences, restated aims, summary paragraphs.
3. Relocate rather than delete: methods detail to a supplement, secondary analyses to an
   appendix, a long ramp to a citation. Say what you moved and where.
4. Only then propose cutting content, as Bucket B, one item at a time with what is lost.

Report the count before and after with the tool used, since journals count differently — whether
the abstract, captions, and references are included changes the number substantially.

---

## LaTeX mechanics

- **`%` comments inside a `.tex` file are an internal surface**, and they are where session
  residue hides: `% TODO: reviewer 2 asked about this`, `% Let me rephrase`, `% old version
  below`. Run the internal batteries over `.tex` too. Commented-out paragraphs are the author's
  stash — leave them, or ask.
- **`\todo{}`, `\marginpar{}`, `\note{}`** are deliberate author annotations. Report them; do not
  delete them.
- **Preserve non-breaking spaces** before references: `Table~\ref{}`, `\citep{}` spacing,
  `Fig.~\ref{}`. Losing a `~` produces a bad line break in the PDF.
- **Do not touch macros, `\newcommand` definitions, environments, or float placement.**
- **Verify the document still builds** after edits — `latexmk -pdf` or the repo's build command.
  A stray brace from a sentence-level edit breaks compilation, and a prose pass that leaves the
  paper uncompilable is worse than no pass.
- **Multi-file papers**: check `\input`/`\include` structure to find every prose file before
  claiming the scope is covered.
- **Quarto/R Markdown manuscripts** (`.qmd`, `.Rmd`): narrative text is in scope here — it is the
  manuscript. Inline code chunks and their output are not; leave `` `r ` `` and chunk options
  alone, and re-render to confirm nothing broke.

---

## Delivering the edit

Authors need to see what changed, not be told it improved.

- **Commit prose separately** from content changes, and keep Bucket A and Bucket B in separate
  commits so A can be accepted wholesale.
- **`latexdiff old.tex new.tex > diff.tex`**, then build `diff.tex` for a marked-up PDF. This is
  how most co-authors want to review, and it is worth generating unprompted for anything beyond a
  handful of edits.
- **Word counts before and after**, per section if the limit is per section.
- **The Bucket B list** as the report's centrepiece: original, proposal, what changes. Ordered by
  how much the meaning moves, not by page order.
