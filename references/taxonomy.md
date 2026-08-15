# Taxonomy of agent prose bloat — internal surfaces

Nine classes, each with what it looks like, what to do, and the false-positive families that
match the same patterns but must be kept. The false positives matter more than the definitions:
an unaided pass fails in both directions, deleting durable references while keeping dead ones.

This file covers **internal surfaces**: code comments and docstrings, `%` comments inside a
`.tex` file, READMEs, `AGENTS.md`/`CLAUDE.md`, design and decision notes, analysis logs, data
dictionaries and codebooks, speaker notes, and agent scratch files. For the external surfaces —
the paper, the rebuttal, the cover letter, the grant, and the slide deck, poster, talk, and blog
post — see [manuscript.md](manuscript.md), [presentations.md](presentations.md), and
[structures.md](structures.md), which cover the same instinct applied to prose that is the
deliverable rather than the scaffolding.

Classes 1–8 are rare in manuscript prose and common in everything around it. Class 9 (inflated
register) is the one that appears on both surfaces, and the manuscript treatment of it is
substantially longer.

## Contents

- [1. Dead session citations](#1-dead-session-citations)
- [2. Stack and PR vantage](#2-stack-and-pr-vantage)
- [3. Change narration and version stamps](#3-change-narration-and-version-stamps)
- [4. Review choreography](#4-review-choreography)
- [5. Reviewer-addressed justification](#5-reviewer-addressed-justification)
- [6. Restatement and derivation transcripts](#6-restatement-and-derivation-transcripts)
- [7. Planning residue](#7-planning-residue)
- [8. Agent chat voice](#8-agent-chat-voice)
- [9. Inflated academic register](#9-inflated-academic-register)
- [Cross-cutting false positives in research repos](#cross-cutting-false-positives-in-research-repos)

---

## 1. Dead session citations

References to artifacts only the authoring session could see: `(decision 7)`, `(audit C2)`,
`design §4.7`, `plan §1.4`, phase labels (`T4`, `W3`, `P-I`, `Phase 2`), "the design ledger",
"the plan above", "per the outline".

**Fix.** If a committed artifact owns the decision, cite it by name and relative path — a link
where the surface supports one. Name the owner's path at least once per file; later mentions can
use the searchable name alone. If nothing owns it, delete the citation and restate its factual
clause so the sentence stands alone. The clause is usually true; only the pointer is dead.

**Keep.**

- External standards and specs that resolve outside the repo by design: `RFC 9110 §10.1.5`,
  `IEEE 754 §5.4`, a committed doc that owns its own section numbering, a Figma frame name.
- Registered identifiers: preregistration IDs (OSF, AsPredicted), IRB protocol numbers, trial
  registration numbers, dataset accessions, grant numbers. These resolve at HEAD via a registry.
- A dead-looking pointer that has a real target. "See the widget-rendering RFC" is dead if no
  committed file answers to that name; "see `docs/rendering.md`" is not. The test is
  resolvability, not form.

---

## 2. Stack and PR vantage

Prose written from inside a branch: "this PR adds", "a later PR in this stack", "the previous
commit", "the diff above", "as requested".

**Fix.** State the shipped mechanism, or the extension point if the work is genuinely future:
"a remote backend can implement this interface without changing the render layer." Deferred work
moves to a `TODO(name):` marker at the call site or an issue reference.

**Keep.**

- Documentation *about* PR workflow — a contributing guide, a PR template, a process note — may
  legitimately say "PR". The ban is on a document adopting one PR's vantage about the code.
- Merged-PR citations inside a changelog, postmortem, or decision note. That is their home.

---

## 3. Change narration and version stamps

"used to", "no longer", "previously", "the old X", "was renamed", "we changed"; and indexical
stamps: "this cut", "v1", "today", "currently", "at this time", "for now", "at present".

**Fix.** State present behavior. A fixed regression survives as a present-tense counterfactual
that names the guard — "without the byte-length guard, multibyte labels double-encode" — rather
than as repo archaeology ("this used to double-encode"). Readers who never saw the old behavior
learn nothing from its absence.

**Keep.**

- **Instrumental "used to"**: "the key used to sign requests" is a purpose, not a past state.
  The temporal form has a subject state before it ("colors used to come from…").
- **Runtime old/new**: "the old connection drains before the new one accepts" names two live
  objects during handover. Lifecycle vocabulary, not repo history.
- **`v1` as an identifier**: `/v1/chat`, `schema_v1.json`, a wire-format name. Not a stamp.
- **Version and environment pins**: "requires numpy ≥ 1.24 for `np.take_along_axis` on 0-d
  arrays" is a live compatibility fact.
- **Historical stage names inside a change-story section** of a decision note or postmortem:
  "the first cut shipped X" is fine there. The indexical form ("this cut") never is.

---

## 4. Review choreography

"Rejected in review:", "the reviewer confirmed", "as discussed", "per our conversation", draft
ordinals ("v5 of this note"), round attributions.

**Fix.** Keep the surviving decision and its rationale as plain fact. In a decision note, the
alternatives-considered section is the sanctioned home: state the alternative and why it was
rejected, without the reviewer or the round.

**Keep.**

- An Alternatives-considered section itself. "Rejected" inside that genre slot is structure, not
  choreography.
- "We" as project voice.

---

## 5. Reviewer-addressed justification

A comment arguing its own correctness to an objection nobody at HEAD raised: "the cast is safe —
it simply…", "this is correct because…", "note that this is intentional", "to be clear".

**Fix.** State the invariant a maintainer must not break: "the SDK constructs this object with
every optional populated; the declared type is looser than the runtime guarantee." If the
invariant is already visible in the code, delete the comment. Correctness claims cite invariants
or tests, never people.

**Keep.**

- Suppression justifications, which are *required* prose: `# noqa: E501 -- URL cannot be
  wrapped`, `# type: ignore[arg-type] -- upstream stub omits the kwarg`, `# nolint`,
  coverage-ignore reasons, empty-`except` explanations. When the stated reason is false, fix the
  reason. Deleting it removes the only record of why the check is off.
- "Intentional" markers that pin a surprising-but-correct behavior against a well-meaning fix:
  "the off-by-one is intended; the window is inclusive at both ends."

---

## 6. Restatement and derivation transcripts

Control-flow narration ("first we normalize the label, then we truncate it, then we wrap it"),
test walkthroughs ("this test creates a session, sends two messages, then asserts…"), proofs of
obvious branches, docstrings that retype the signature, section-by-section previews of the code
below.

**Fix.** Delete. Do not compress a reasoning transcript into shorter narration — remove it. Keep
only a non-obvious contract or invariant: if the early return protects something, state only that.
For a test, keep the assertion rationale ("two round-trips must produce exactly four log entries —
the projection dedupes the shared prefix") and drop the walkthrough.

**Keep.**

- A short mapping note that says where an adapter *drops or changes* information: "preserves
  title, URL, and text; omits provider-only ranking metadata." Field-by-field restatement of
  identical names is restatement; the omission is a fact.
- Algorithm names and complexity notes that orient a reader who would otherwise reverse-engineer
  them: "Welford's method, for numerical stability in one pass."

---

## 7. Planning residue

"probably fine for now", "should be enough", "we could later", "ideally", "in a future version",
deferrals with no owner or marker.

**Fix.** Promote to a real marker with an owner (`TODO(name): coalesce per animation frame`), or
replace the hedge with the actual bound and its failure behavior: "64 KiB holds the largest
observed frame (48 KiB) with headroom; a larger frame fails loudly in `decode`."

**Keep — and this distinction is the one that matters most in a research repo.**

Scientific hedges are not planning hedges. Ask what the hedge is about:

| Hedge is about | Example | Action |
|---|---|---|
| The author's schedule or intent | "probably fine for now", "we should revisit this" | Promote to `TODO` or delete |
| The world, the data, or the evidence | "consistent with H1, but the CI includes zero", "underpowered to detect d < 0.3", "this generalizes only to the pilot cohort" | Keep verbatim |

Tightening a calibrated scientific statement into a confident one is not a style improvement.
Never remove "suggests", "consistent with", "in this sample", "exploratory", or a stated
limitation while trimming.

---

## 8. Agent chat voice

Conversational residue that reached a committed file: "Let me check…", "I'll now add…", "Now
let's…", "Great!", "Perfect!", "You're absolutely right", "Here's what I did", second-person
address to the user, and decorative emoji or ✅/❌/🎉 status glyphs in comments, commit-adjacent
docs, and READMEs.

**Fix.** Delete. These carry no proposition. Where a status glyph stood in for a real fact
("✅ implemented"), see class 9's status-annotation note: the repo layout and manifests carry
status, and status annotations rot.

**Keep.**

- Emoji that are data or UI: an emoji in a test fixture for Unicode handling, in a CLI's own
  output spec, or in a legend the product actually renders.
- First-person plural project voice in docs ("we exclude trials shorter than 200 ms").

---

## 9. Inflated academic register

The one class that appears on both surfaces. What follows is the internal-artifact version — a
README or a module header written in journal voice. For the manuscript version, including the LLM
lexicon, the structural tells, and the domain-term false positives, see
[manuscript.md](manuscript.md#llm-register-in-academic-prose). For the sentence-architecture
family — false agency in comments ("the parser chooses to…" when a human wrote the branch),
narrator-from-a-distance in READMEs ("one might wonder…"), and the rest — see
[structures.md](structures.md).

Prose that sounds authoritative while asserting little:

- **Throat-clearing**: "It is important to note that", "It should be emphasized that", "In this
  section, we will discuss", "This document provides an overview of".
- **Nominalization**: "performs a calculation of the mean" → "computes the mean"; "provides
  support for" → "supports"; "in order to" → "to".
- **Empty intensifiers and vogue verbs**: comprehensive, robust (as decoration, not as the
  statistical term), powerful, seamless, leverage, utilize, facilitate, delve, underscore, "plays
  a crucial role", "serves as a foundation for".
- **Padding structures**: rule-of-three lists where one term would do ("clean, consistent, and
  correct"); a section's first sentence restating its heading; a summary paragraph that repeats
  the section it summarizes.
- **Emphasis inflation**: bold, CAPS, or "critically"/"importantly" on every third phrase. When
  everything is emphasized, nothing is. Reserve it for the clause that changes behavior.
- **Implementation-status annotations**: "implemented!", "(future work)", "TODO: done". Status
  rots; the layout, manifests, and issue tracker carry it.
- **Duplicated rules**: the same rule stated in more than one home. Grep a distinctive phrase,
  keep one home, and link the rest.

**Fix.** Rewrite directly: name the actor, the operation, and the fact. Before writing an
abstract noun — *contract*, *boundary*, *surface*, *framework*, *pipeline*, *architecture* — ask
whether a more exact term names the subject. Write "response fields", "JSON validation", or
"ESM exports" instead of "response shape", "validation boundary", or "module shape". Keep the
abstract term when it names the exact technical subject.

**Keep.**

- **"Robust" as a statistical term** (robust standard errors, robust regression), and every
  other domain term that shares a word with the slop list: *significant*, *power*, *bias*,
  *validation*, *sensitivity*, *confounding*.
- Genuine domain abstraction where no more exact term exists.
- Precision hedges required by the field: "under the stated assumptions", "assuming exchangeable
  errors", "to the extent the instrument is valid".

---

## Cross-cutting false positives in research repos

These match the batteries constantly. Judge, do not bulk-delete.

- **`T1`, `T2`, `W3`, `P1`** are timepoints, waves, and participant IDs far more often than plan
  phases. The battery for phase labels is the noisiest one in a research repo — expect to reject
  most hits.
- **`§`** appears in legal, standards, and German-language sources.
- **"currently"** is often a true statement about live runtime state ("currently open handles"),
  not a version stamp.
- **"for now"** inside quoted participant text or survey items.
- **"previously"** describing the experimental procedure ("participants previously saw the cue")
  is a design fact, not repo history.
- **"the old"** in a within-subject design, a changepoint analysis, or a migration script that
  genuinely operates on two live schema versions.
- **Recorded model output** committed as data: a prompting study's responses, a benchmark's saved
  completions, an annotation corpus. Full of every class here, and every instance must stay.
