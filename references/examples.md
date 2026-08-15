# Calibration examples

Before/after pairs for every class in [the taxonomy](taxonomy.md), plus the keeps and the
overcorrection traps. Use them to identify the governing principle, not as text templates.
"Balanced" preserves every load-bearing proposition with the least explanation the location needs.

This file deliberately quotes leaked wording as calibration material. The scanner excludes this
skill's own directory; the wording here is not a license elsewhere.

## Contents

**External surfaces**

- [Preserve every proposition](#preserve-every-proposition)
- [Abstract and title](#abstract-and-title)
- [Introduction funnel](#introduction-funnel)
- [Sandwich paragraphs and discourse chains](#sandwich-paragraphs-and-discourse-chains)
- [Claim strength — always Bucket B](#claim-strength--always-bucket-b)
- [Response letters](#response-letters)
- [Cover letters](#cover-letters)
- [Presentations and outreach](#presentations-and-outreach)
- [Rhetorical structures](#rhetorical-structures)

**Internal surfaces**

- [Dead citations](#dead-citations)
- [Stack and PR vantage](#stack-and-pr-vantage)
- [Change narration](#change-narration)
- [Review choreography](#review-choreography)
- [Reviewer-addressed justification](#reviewer-addressed-justification)
- [Restatement and derivation](#restatement-and-derivation)
- [Planning residue vs. scientific hedging](#planning-residue-vs-scientific-hedging)
- [Agent chat voice](#agent-chat-voice)
- [Inflated register](#inflated-register)
- [Keeps](#keeps)
- [Overcorrection traps](#overcorrection-traps)

---

## Preserve every proposition

**Original:** "The loader carefully validates each manifest per package, flushes buffered
warnings before the build resolves, and reports schema failures to the caller."

**Over-trimmed:** "The loader validates manifests."

**Balanced:** "The loader validates each manifest per package, flushes buffered warnings before
the build resolves, and reports schema failures to the caller."

Remove decoration ("carefully"), not propositions. Per-package scope, flush ordering, and failure
visibility are three separate facts. A smaller word count alone is not an improvement.

---

## Abstract and title

### Register bloat under a hard limit — Bucket A

**Leaked (58 words):** "In recent years, there has been growing interest in the role that sleep
plays in cognitive functioning. It is important to note that sleep quality is a multifaceted
construct that plays a crucial role in shaping a myriad of outcomes. Here, we delve into this
intricate relationship and shed light on the underlying mechanisms."

**Fixed (24 words):** "Sleep quality predicts next-day cognitive performance, but the mechanisms
are unclear. We test whether slow-wave duration mediates the effect on working-memory span."

Thirty-four words recovered and nothing was lost, because the original asserted two things: the
topic and the gap. Everything else was ramp. This is the shape of most abstract bloat in
agent-drafted text.

### Design descriptors are not hedges — keep

**Present:** "In this preregistered, within-subjects experiment (N = 84), …"

**Overcorrected:** "In this experiment, …"

**Right:** keep the original.

Preregistration, design, and N are what let a reader interpret the effect. They read like
qualifiers and are actually the load-bearing content of an abstract's methods sentence.

---

## Introduction funnel

**Leaked:** "Cognitive neuroscience has made remarkable strides in recent decades, opening new
avenues for understanding the intricate workings of the human mind. Among the many domains that
have garnered attention, memory consolidation stands out as particularly pivotal. A comprehensive
body of work has underscored its importance across a myriad of contexts."

**Fixed:** (deleted; the paragraph below it, which states the specific gap, becomes the opener.)

Three sentences, zero propositions, zero citations. The tell is that the paragraph would fit
unchanged in front of a paper on any topic — swap "memory consolidation" for anything.

**Not the same case:** a funnel paragraph that carries citations and narrows a real literature is
content. Compress it; do not delete it, and never cut a citation to save words.

---

## Sandwich paragraphs and discourse chains

### The closer restates the opener

**Leaked:** "Reaction times were slower in the incongruent condition. [four sentences of
detail] … Taken together, these results indicate that reaction times were slower under
incongruence."

**Fixed:** delete the closing sentence.

A paragraph does not need to announce what it just did. Keep a closer only when it states
something the body did not — a consequence, a contrast, a link forward.

### Connective in every opening slot

**Leaked:** "Furthermore, participants showed … Moreover, the effect persisted … Additionally,
sensitivity analyses confirmed …"

**Fixed:** "Participants showed … The effect persisted after excluding the three fastest
responders. Sensitivity analyses with a 200 ms cutoff produced the same pattern."

Deleting the connectives forced each sentence to carry its own specifics. That is usually what
happens: the discourse marker was standing in for the content that should have been there.
*However*, *because*, and *in contrast* mark real logical turns and stay.

---

## Claim strength — always Bucket B

### Verb creep during a trim

**Original:** "Higher sleep quality was associated with better working-memory performance."

**Overcorrected:** "Higher sleep quality improved working-memory performance."

**Right:** keep the original, or propose the change as Bucket B with a note: *"'improved' asserts
causation; the design is cross-sectional."*

Two words shorter and a different paper. This is the most common way an automated tightening pass
does damage, because the causal verb is genuinely more fluent.

### Hedge stacking versus calibrated hedging

**Leaked:** "These findings may potentially suggest that the intervention could possibly be
beneficial for some individuals."

**Fixed:** "The intervention may benefit some participants; the CI for the group difference
includes zero."

One hedge survives and one fact was added. Compare:

**Present:** "Consistent with H2, but underpowered to detect d < 0.3."

**Overcorrected:** "Consistent with H2."

**Right:** keep the original. The power statement is the reader's basis for weighting the result.

### "Significant" without a referent

**Leaked:** "The intervention produced a significant improvement in wellbeing scores."

**Fixed — if statistical:** "The intervention improved wellbeing scores, *t*(82) = 2.41,
*p* = .018."

**Fixed — if not:** "The intervention produced a substantial improvement in wellbeing scores
(mean difference 8.2 points on a 100-point scale)."

Flag every unqualified use and let the author pick. Guessing which sense was meant is how a
descriptive claim becomes an inferential one.

---

## Response letters

### Serial gratitude

**Leaked:**

> **Comment 2.3:** *The exclusion criteria are not clearly justified.*
>
> We thank the reviewer for this insightful and thoughtful comment. We greatly appreciate the
> opportunity to clarify this important point. The reviewer correctly notes that our exclusion
> criteria required further justification. We have carefully considered this and have revised the
> manuscript accordingly.

**Fixed:**

> **Comment 2.3:** *The exclusion criteria are not clearly justified.*
>
> The criteria were fixed before unblinding and are now stated with that timing (Methods,
> §2.3, p. 7, lines 214–221), together with the three excluded IDs and the trial counts. The
> preregistration section that specifies them is linked in the data-availability statement.

Eight sentences of nothing became four facts and a location. One brief thanks at the top of the
letter covers the whole response; repeating it per comment reads as padding.

### Unlocated change claim

**Leaked:** "We have revised the manuscript accordingly."

**Fixed:** "Added to Discussion, p. 14, lines 402–409: 'Because the sample was recruited online,
these estimates may not generalise to clinical populations.'"

**And verify it.** Before writing either version, confirm against the actual diff that the change
exists. A fluent sentence asserting a revision that was never made is the worst output this skill
can produce, and it is easy to generate while smoothing a letter.

### Buried disagreement

**Leaked:** "We thank the reviewer for this valuable suggestion. While we appreciate the merit of
this approach and agree it would be interesting, we felt that, given the constraints of the
current design, it may perhaps be beyond the present scope."

**Fixed:** "We did not run the mediation analysis. With a single measurement occasion it cannot
distinguish mediation from confounding, so the estimate would not be interpretable. We have
instead added the correlation matrix (Supplement S4) so readers can assess the pattern directly."

A reviewer can evaluate a clear no with a reason. They cannot evaluate a hidden one, and the
hedged version usually triggers another round.

---

## Cover letters

**Leaked:** "We are delighted to submit our manuscript to your esteemed journal. This
comprehensive study delves into the intricate relationship between sleep and cognition, shedding
light on a topic of broad interest to your readership. We believe it represents a significant
contribution to the field."

**Fixed:** "We submit 'Slow-wave duration mediates the effect of sleep quality on working memory'
for consideration. In a preregistered within-subjects experiment (N = 84) we show that slow-wave
duration accounts for the sleep–memory association, which adjudicates between the two mechanisms
proposed by Diekelmann & Born (2010). The journal's recent series on sleep-dependent
consolidation is the closest existing venue for this test."

The test for a cover letter sentence: would it fit an arbitrary paper submitted to an arbitrary
journal? If yes, it is doing no work.

---

## Dead citations

### Ordinal with a committed owner

**Leaked:** "Trials are excluded by RT threshold before outlier removal (decision 21)."

**Fixed:** "Trials are excluded by RT threshold before outlier removal — the exclusion-order
decision, owned by [`docs/decisions/2026-03-exclusion-order.md`](../docs/decisions/2026-03-exclusion-order.md)."

The ordinal resolves nowhere at HEAD; the decision's name and path do.

### Ordinal without an owner

**Leaked:** "The registry rejects duplicate names (decision 7: names are flat, no namespacing)."

**Fixed:** "The registry rejects duplicate names; names are flat, with no namespacing."

Nothing committed owns "decision 7", so the citation goes — but its factual clause is restated to
stand alone, not deleted with it.

### Audit codes

**Leaked:** "Rendering is pure: same snapshot, same string (audit R3)."

**Fixed:** "Rendering is pure: same snapshot, same string."

No audit document exists in the repo. The code is session shorthand carrying zero propositions.

### Draft section numbers

**Leaked:** "Layering follows the design (v2 §3.2): `src/core/` is the pure core."

**Fixed:** "Layering: `src/core/` is the pure core."

Contrast: "escapes per RFC 9110 §10.1.5" stays. The ban covers uncommitted internal drafts, not
external standards or committed docs that own their numbering.

### Plan-phase labels

**Leaked:** "`src/client/` is the shell (T4); the P-I migration owns the adapters."

**Fixed:** "`src/client/` is the shell; the adapters live in `src/client/adapters/`."

Replace the label with what the phase produced. But see the false-positive note: in a longitudinal
study, `T4` is a timepoint and stays.

---

## Stack and PR vantage

### Stack position in durable prose

**Leaked:** "A future remote backend implements this interface (the sandbox backend is a later PR
in this stack)."

**Fixed:** "A remote backend can implement this interface without changing the render layer."

Durable prose cannot see the stack. Keep the extension-point contract; the pending work's home is
the PR, a `TODO`, or an issue.

### "This PR" in a README

**Leaked:** "This PR adds cursor-based pagination to the session list."

**Fixed:** "The session list paginates by cursor."

A README outlives every PR.

---

## Change narration

### War story with a PR number

**Leaked:** "Colors used to come from `--widget-*` tokens, which nothing defined, so it always
rendered the fallbacks; the alias tokens fixed that (PR #88)."

**Fixed:** "Colors come from the alias tokens; an undefined token renders the fallbacks."

Both live facts survive — current mechanism and standing failure behavior — restated in the
present. The bug's biography belongs to the PR and the changelog.

### Removal narration

**Leaked:** "The `probe` field is gone with the removal cut; badges ride the generic projection
pair now."

**Fixed:** "Badges use the generic projection pair."

Readers who never saw `probe` learn nothing from its absence.

### Fixed regression becomes a counterfactual

**Leaked:** "This used to double-encode multibyte labels."

**Fixed:** "Without the byte-length guard, multibyte labels double-encode."

The regression pin survives in the present tense and names the guard, so a future refactor knows
what it would break.

### Indexical stamps

**Leaked:** "Batch rendering is synchronous this cut; the async path is roadmap work."

**Fixed:** "Batch rendering is synchronous." (The deferral lives in `TODO(widget-batch):` at the
call site.)

"This cut", "v1", "today", "for now" go stale the moment they merge.

---

## Review choreography

**Leaked:** "Rejected in review: caching the resolved spec. We keep resolution per-call."

**Fixed (in a decision note's Alternatives considered):** "**Caching the resolved spec.**
Rejected: the spec depends on per-call cwd, so a cache keyed by request would serve stale roots."

The genre slot is the sanctioned home; the reviewer and the round are not part of the rationale.

**Leaked:** "As of v5 of this note, the loader also validates manifests."

**Fixed:** "The loader validates manifests."

A note's own revision history lives in git.

---

## Reviewer-addressed justification

### Arguing a cast

**Leaked:** "The cast is safe — the SDK constructed the object, it simply doesn't declare the
optionals strictly enough."

**Fixed:** "The SDK constructs this object with every optional populated; the declared type is
looser than the runtime guarantee."

State the invariant a maintainer must not break. "It simply…" answers an objection nobody at HEAD
raised. If the invariant is visible in the code, delete the comment instead.

### Appeal to authority

**Leaked:** "This is correct because the reviewer confirmed the wrapping order."

**Fixed:** (deleted; the wrapping order is stated in the function's `Returns:` section.)

Correctness claims cite invariants or tests, never people.

---

## Restatement and derivation

### Control-flow narration

**Leaked:** "First we normalize the label, then we truncate it, then we wrap it."

**Fixed:** (deleted.)

The three lines below say the same thing in code. Do not compress narration — remove it.

### Test walkthrough

**Leaked:** "This test creates a session, sends two messages, waits for the second reply, and
then asserts the log has four entries."

**Fixed:** "Two round-trips must produce exactly four log entries — the projection dedupes the
shared prefix."

Keep the non-obvious assertion rationale; the walkthrough restates the test body.

### Docstring that retypes the signature

**Leaked:**

```python
def resample(df: pd.DataFrame, n: int, seed: int) -> pd.DataFrame:
    """Resample the dataframe.

    Args:
        df: The dataframe.
        n: The number of samples.
        seed: The seed.

    Returns:
        A dataframe.
    """
```

**Fixed:**

```python
def resample(df: pd.DataFrame, n: int, seed: int) -> pd.DataFrame:
    """Draw `n` rows with replacement, stratified by `df["condition"]`.

    Raises ValueError if any stratum has fewer than 2 rows, because a
    single-row stratum yields a zero-variance bootstrap estimate.
    """
```

The stratification, the failure condition, and the reason for it are caller-visible contract.
The parameter names are already in the signature.

---

## Planning residue vs. scientific hedging

### Unmarked deferral — trim

**Leaked:** "Probably fine to render eagerly for now."

**Fixed:** (deleted; the deferral already has its `TODO(widget-batch):` marker.) If no marker
exists, write one instead of keeping the hedge.

### Vague sizing — replace with the bound

**Leaked:** "A 64 KiB buffer should be enough for most cases."

**Fixed:** "64 KiB holds the largest observed frame (48 KiB) with headroom; a larger frame fails
loudly in `decode`."

### Scientific hedge — keep verbatim

**Present:** "The interaction is consistent with H2, but the 95% CI includes zero and the design
is underpowered to detect d < 0.3."

**Overcorrected:** "The interaction supports H2."

**Right:** keep the original.

The hedge describes the evidence, not the schedule. Tightening it manufactures a claim the
analysis does not support — the most damaging edit this skill can make.

### Exclusion rationale — keep

**Present:** "Three participants dropped for incomplete trials (IDs in `exclusions.csv`); the
threshold was fixed before unblinding."

**Overcorrected:** "Three participants excluded."

**Right:** keep the original.

The count is not the point. The reason, the record, and the pre-registration timing are the audit
trail a reproducibility reviewer needs.

---

## Agent chat voice

**Leaked (in a committed `NOTES.md`):**

> Great! Now let me add the preprocessing step. ✅ Done — the pipeline now handles missing values.
> You're absolutely right that we should also handle the edge case.

**Fixed:**

> Preprocessing drops rows with missing values in any modeled column before scaling.

One proposition survived the paragraph. Everything else addressed a conversation partner who is
not reading this file.

---

## Inflated register

### Throat-clearing and nominalization

**Leaked:** "It is important to note that this module provides comprehensive support for the
performance of robust statistical calculations across a variety of different input formats, in
order to facilitate downstream analysis."

**Fixed:** "Computes Huber-robust means and variances for dense arrays, sparse matrices, and
`pandas` frames."

Every abstraction was replaced by the thing it stood for. Note that "robust" survives — here it is
the statistical estimator, not decoration.

### A section restating its heading

**Leaked:**

> ## Data preprocessing
>
> This section describes the data preprocessing steps. Data preprocessing is a crucial part of
> any analysis pipeline, and this project is no exception. The preprocessing consists of several
> key steps, outlined below.

**Fixed:**

> ## Data preprocessing

Delete the paragraph. The list below it already carries the content, and the heading already
announced the subject.

### Emphasis inflation

**Leaked:** "**Critically**, the seed **must** be set **before** any **stochastic** operation —
this is **essential** for **reproducibility**."

**Fixed:** "Set the seed before any stochastic operation; unseeded runs are not reproducible."

One clause changes behavior and it does not need bold to do it.

---

## Rhetorical structures

### Binary contrast that postures

**Leaked:** "This paper is not about yet another benchmark. It is about measurement."

**Fixed:** "This paper contributes a measurement framework."

The negation was a runway; the claim stands without it.

### Binary contrast that compares — keep

**Keep:** "The effect was not significant in the pooled sample but was in the largest cohort."

The negation compares two real estimates; a reader needs both halves.

### Negative listing

**Leaked:** "Not a toolkit. Not a benchmark. Not a survey. A validation framework."

**Fixed:** "We contribute a validation framework."

### False agency, rhetorical

**Leaked:** "The analysis decided to exclude participants with missing covariates."

**Fixed:** "We excluded participants with missing covariates."

Name the human. The analysis does not decide; the analyst does.

### False agency, scientific register — keep

**Keep:** "The data suggest the effect is limited to the training cohort." / "The model predicts
log-odds of 1.4 for held-out verbs."

"Suggest" and "predict" are the licensed agency verbs of the field; in machine learning the
model literally predicts. Do not homogenize registered usage into active human voice.

### Vague declarative

**Leaked:** "These findings have important implications for practice."

**Fixed:** "These findings suggest hiring panels should weight calibration over confidence."

Complete the sentence with "for whom, and what specifically"; if you cannot, the sentence was
announcing, not saying.

### Emphasis crutch

**Leaked:** "The gap is real. Make no mistake."

**Fixed:** (delete the second sentence)

### Meta-commentary

**Leaked:** "Let me walk you through the three failure modes."

**Fixed:** "The three failure modes are…"

### Wh- opener crutch

**Leaked:** "What makes this hard is that embeddings are trained per-corpus."

**Fixed:** "Embeddings are trained per-corpus, which makes transfer hard."

### Adverb crutch

**Leaked:** "The method is truly simple and genuinely scalable."

**Fixed:** "The method is a two-pass scan over the vocabulary."

### Adverb that is the claim — keep

**Keep:** "The estimate is approximately 0.31" and "significantly larger than the null".

*Approximately* is measurement; *significantly* is statistical. The crutch list is the empty
set: truly, really, essentially, fundamentally, actually, simply, notably, importantly…

### Decision-hiding passive

**Leaked:** "It was decided that the pilot would use six countries."

**Fixed:** "We fixed the pilot at six countries."

### Methodological passive — keep

**Keep:** "Participants were recruited through the ESS sampling frame; models were trained for 30
epochs."

Procedure and measurement stay passive — that is the registered convention. Decisions name
their actor.

---

## Presentations and outreach

### Slide title restating the bullet

**Leaked:**

> **Title:** We collected 412 participants
> **First bullet:** We collected 412 participants.

**Fixed:**

> **Title:** 412 participants across four cohorts
> **First bullet:** N=412, four cohorts (T1–T4).

The title states the takeaway; the bullet carries the number once.

### "As shown above"

**Leaked:** "This confirms the retention drop, as shown in the previous slide."

**Fixed:** "Retention drops at 14 days (Fig. 2)."

Reference the finding, not the deck's position.

### Meta-transition in a talk script

**Leaked:** "So, moving on to the next point, I'd now like to shift gears and talk about the
model."

**Fixed:** "Next, the model."

The audience sees the slide change; a spoken transition can be one phrase.

### Empty intensifier in a bullet

**Leaked:** "The method is very fast and incredibly robust."

**Fixed:** "Runs in 12 ms per trial (Fig. 4)."

The number beats the adverb.

### Poster paragraph restating the abstract

**Leaked:** "This study investigated whether X relates to Y. We found that X was associated with
Y, suggesting that…"

**Fixed (takeaway line):** "X predicts Y in three of four cohorts (β = .31, CI [.19, .43])."

A poster states the result; it does not restate the abstract.

### Grant significance inflation

**Leaked:** "This groundbreaking work will transform the field and revolutionize how we understand…"

**Fixed:** "We will deliver the first dataset of X (N=2,000) and a validated measure of Y."

State the specific advance and let reviewers decide the adjectives.

---

## Keeps

### Issue and DOI references are durable on every surface

**Keep:** "The cap applies to the complete rendered value, wrappers included (issue #1470 owns the
follow-up)."

**Keep:** "Implements the estimator from Huber (1964), doi:10.1214/aoms/1177703732."

An unaided pass deleted the first as "belongs in a decision note". Wrong direction: issues resolve
at HEAD from any surface, and "#N owns the follow-up" is the sanctioned home for deferred work in
a README.

### Dead name-drops are not "naming the owner"

**Delete:** "Badge renderer over the widget seam (see the widget-rendering RFC)."

An unaided pass kept this as "naming the owning document by topic". The test is resolvability, not
form: no committed file answers to that name. Retarget it to the committed owner if one exists;
otherwise delete it.

### Suppression justifications

**Keep (after fixing):** `# noqa: E731 -- the lambda is the scipy callback signature.`

The justification clause is required prose. When the reason is false — the original said "the loop
guard above proves a frame exists", with no loop in sight — fix the reason; never delete it.

### Measured bounds

**Keep:** "Depth cap (measured: 512 nests ≈ 0.15 s synchronous; 4096 blocks the loop)."

The measurement pins the constant against uninformed retuning, and "measured" is the provenance
that distinguishes data from a guess.

### Runtime old/new is not change history

**Keep:** "The old connection drains before the new one accepts."

Two live runtime objects during handover, not two repo states.

---

## Overcorrection traps

Every trap below shipped in a real purge and was caught in review. Enumerate a passage's
propositions before trimming it.

### Flipping an obligation into an endorsement

**Original:** "These direct registrations are exceptions pending migration to slots."

**Overcorrected:** "These direct registrations are sanctioned exceptions."

**Right:** keep the original.

"Pending migration" is an obligation; "sanctioned" blesses the status quo. The trim inverted the
sentence's modality while shortening it.

### Promoting a hypothetical to a shipped feature

**Original:** "A future IPC-based shell subclasses the executor and overrides `spawn`."

**Overcorrected:** "An IPC-based shell subclasses the executor and overrides `spawn`."

**Right:** "A hypothetical IPC-based shell — no such shell exists — would subclass the executor
and override `spawn`."

Deleting the future-marker alone turns a design illustration into a claim that the class ships.
Mark the hypothetical explicitly instead of unmarking the future.

### Deleting a true fact with the transcript around it

**Original:** "The gate notice narrates the check order; the notice text is also what
`verify-doc-typecheck` compiles against."

**Overcorrected:** (whole sentence deleted as narration.)

**Right:** "The notice text is what `verify-doc-typecheck` compiles against."

Half the sentence was narration; the other half was a load-bearing coupling. Delete clauses, not
sentences, when propositions share a line.

### Dropping provenance while keeping the number

**Original:** "The 4 MiB ceiling is measured: the largest generated module is 3.1 MiB."

**Overcorrected:** "The ceiling is 4 MiB; the largest generated module is 3.1 MiB."

**Right:** keep "measured".

Without it, 3.1 MiB reads as a definition rather than an observation, and nobody re-measures
before raising the ceiling.

### Strengthening a scientific claim

**Original:** "In this sample, condition order suggests a small effect on accuracy (exploratory)."

**Overcorrected:** "Condition order affects accuracy."

**Right:** keep the original.

"In this sample", "suggests", and "(exploratory)" are three separate provenance facts. Removing
them is not concision; it is a different claim.
