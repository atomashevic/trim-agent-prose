# Rhetorical structures

The second family of agent tells: not vocabulary, but **sentence architecture** — the contrastive
pivots, negated runways, manufactured emphasis, and disembodied agency that make prose sound like
it is performing insight rather than delivering it. These patterns come from the
[stop-slop](https://github.com/hardikpandya/stop-slop) skill (MIT); this file adapts them to
scientific and technical prose, where some of stop-slop's bans are too blunt. The distinction
that matters everywhere: **is the pattern doing logical work or rhetorical work?**

If a sentence constructs a contrast, a negation, or an emphasis that a claim could not exist
without, it is logic — keep it. If the construction is a runway to a claim that stands without it,
it is slop — cut it.

## Contents

- [Binary contrasts](#binary-contrasts)
- [Negative listing](#negative-listing)
- [Dramatic fragmentation](#dramatic-fragmentation)
- [Rhetorical setups](#rhetorical-setups)
- [False agency](#false-agency)
- [Narrator-from-a-distance](#narrator-from-a-distance)
- [Vague declaratives](#vague-declaratives)
- [Emphasis crutches](#emphasis-crutches)
- [Meta-commentary](#meta-commentary)
- [Wh- sentence starters](#wh--sentence-starters)
- [Rhythm patterns](#rhythm-patterns)
- [Adverb crutches](#adverb-crutches)
- [Passive voice](#passive-voice)
- [Business jargon](#business-jargon)

---

## Binary contrasts

The telegraphed pivot: "not X but Y", "isn't the problem, it's", "It's not this. It's that.",
"The question isn't X. It's Y.", "not because X, but because Y", "stops being X and starts being
Y". The negation exists to dramatize the reveal, not to compare.

**Fix.** State Y directly. "The problem is Y." If the negation is doing logical work — genuinely
comparing two live alternatives — keep it, but the test is strict: a reader should need both
halves to understand the claim.

**Scientific false positives.** Contrastive logic is real in methods and results: "the effect was
not significant in the pooled sample but was in the largest cohort" compares two estimates;
"not X but Y" comparing two mechanisms ("not driven by frequency but by orthographic regularity")
is a real discriminator when both were tested. The rhetorical form compares nothing — it merely
postures.

---

## Negative listing

The rhetorical striptease: "Not a toolkit. Not a benchmark. A framework." — or the paper-opener
runway "This paper is not about X, nor about Y, nor about Z. It is about…". The negation chain is
a runway; the claim stands without it.

**Fix.** State the thing. If the exclusions are informative (a paper genuinely confused with
neighbours), compress to one clause: "Unlike X, this paper addresses Y."

---

## Dramatic fragmentation

Fragments staged for profundity: "[Noun]. That's it.", "X. And Y. And Z.", "This unlocks
something." In scientific prose it appears as one-line "zinger" paragraphs in discussion sections
("The result is stark.") and fragment answers in abstracts.

**Fix.** Complete sentences. The one legitimate use is a one-line paragraph landing a key result
— that is the skill's own structural guidance (varied paragraph lengths are a feature), but the
fragment must be a complete sentence and the result must be the reason it is short.

---

## Rhetorical setups

"Think about it:", "Here's what I mean:", "What if [reframe]?", "And that's okay." — prompts that
announce an insight instead of delivering it.

**Fix.** Deliver. Delete the prompt; keep the point.

**Scientific false positives.** Genuine open questions are legitimate science — a discussion
section can ask what a follow-up study must determine. The test: is the question one the author
cannot answer yet (keep), or one the author answers in the next sentence (a setup — cut)? In
teaching material, questions are pedagogy and are exempt (see
[presentations.md](presentations.md#talk-scripts)).

---

## False agency

Inanimate subjects with human verbs: "the data tells us", "the decision emerges", "the culture
shifts", "a complaint becomes a fix". The transfer hides the actor.

**Fix.** Name the actor: "the team decided", "we excluded", "readers conclude from the data".

**Scientific false positives — this is the class where scientific register flips stop-slop's
rule.** The field conventionally licenses a small set of agency verbs for instruments and
objects: "the results show", "the data suggest", "the model predicts", "Table 2 reports". In
machine learning, "the model learns/chooses/generalizes" is literal, not rhetorical. These are
established convention and must survive. The rhetorical transfer is the one *outside* the
licensed set, or the one that hides a human decision: "the analysis decided to exclude", "the
criterion chooses", "the data demanded". If a human could be the subject, ask who — and say who.

---

## Narrator-from-a-distance

Disembodied lecturing: "Nobody designed this.", "This is why…", "People tend to…", "One might
wonder…". The author floats above the material instead of putting the reader in it.

**Fix.** Put the reader in the material, or name the mechanism. "People tend to overweight rare
events" without a citation is both armchair sociology and a citation-free generality (the
manuscript rules already flag the latter).

**Scientific false positives.** "This is why X matters" as a conclusion connector is legitimate
once, when it follows the actual evidence; it is the discussion restatement ("the aim restated
in four places") when repeated. "One might wonder" introducing a genuine robustness check is a
convention of the genre — keep when the question is real.

---

## Vague declaratives

Importance announced, not shown: "The implications are significant", "The stakes are high",
"The consequences are real", "This is the deepest problem".

**Fix.** Name the specific implication, stake, or consequence. "These findings have important
implications for practice" → "These findings suggest hiring panels should weight calibration
over confidence."

**Scientific context.** This is one of the most common agent tells in discussion sections and
grant significance statements — see [manuscript.md](manuscript.md#grant-proposals). The test:
can the sentence be completed with "for whom, and what specifically"?

---

## Emphasis crutches

"Full stop.", "Let that sink in.", "Make no mistake", "This matters because", "Let me be clear".
Manufactured weight with no proposition.

**Fix.** Delete. Where the point matters, the point carries itself; if it does not, no amount of
framing fixes it.

---

## Meta-commentary

The text announcing its own structure: "Let me walk you through…", "As we'll see…", "In this
section, we describe…", "The rest of this essay explains…". (The last two are also caught by the
`boilerplate-echo` battery; the family is wider.)

**Fix.** Delete. The text should move, not announce its itinerary. The one legitimate use is a
single orienting sentence in a long document's introduction ("We first derive the model, then
test it on three corpora") — once, not per section.

---

## Wh- sentence starters

"What makes this hard is…", "Why does this matter? Because…", "What if the assumption fails?" as
an opener crutch.

**Fix.** Restructure to lead with the subject or verb: "The constraint is…", "This matters
because…".

**Scientific false positives.** Questions are the native register of teaching material —
exempt (see [presentations.md](presentations.md)). In papers, an open research question stated
in the introduction or discussion is legitimate; the crutch is the question answered in the same
breath.

---

## Rhythm patterns

Metronomic cadence that reads as machine-produced:

- **Three-item lists everywhere.** The manuscript rules already cover rule-of-three padding.
  The tell here is *every* claim coming in threes — vary with two or one.
- **Questions answered immediately** (in prose — exempt in teaching).
- **Every paragraph ending punchily.** Vary endings; let a paragraph end mid-argument.
- **Em-dash density.** Em-dashes are legitimate punctuation in academic prose — the tell is
  density. More than roughly one parenthetical em-dash pair per 300 words is an AI-voice
  signal; the fix is commas or periods, not wholesale removal.
- **Staccato fragments stacked** — see [Dramatic fragmentation](#dramatic-fragmentation).

---

## Adverb crutches

stop-slop's "kill all adverbs" is too blunt for scientific prose — *significantly*,
*approximately*, *consistently*, *reliably*, *robustly* are statistical or technical and must
survive. The crutch set is the empty emphasis adverbs: **truly, really, literally, genuinely,
honestly, simply, actually, deeply, fundamentally, inherently, inevitably, interestingly,
importantly, crucially, essentially, basically, particularly, remarkably, incredibly, extremely,
quite, somewhat**.

**Fix.** Delete, or replace with the number or mechanism the adverb is standing in for:
"the method is very fast" → "runs in 12 ms per trial".

**Scientific false positives.** *Significantly* (statistical), *approximately* (measurement),
*consistently* (replication), *robustly* (method), *relatively*, *marginally*, *jointly*,
*independently* (technical). *Quite* and *somewhat* can be calibrated hedges — "somewhat larger
than the null expectation" — where the hedge is the claim (see the planning-residue table in
[taxonomy.md](taxonomy.md#7-planning-residue)). Also *interestingly* / *importantly* as
sentence-initial discourse markers are flagged by the `discourse-chains` and `emphasis`
batteries; the fix is the same: cut or make specific.

---

## Passive voice

Passive that hides the actor in decision prose is slop: "It was decided that…", "The data was
processed in the conventional manner" (by whom?), "Mistakes were made".

**Fix.** Name the actor for *decisions*: "we excluded", "the committee decided", "the pipeline
filters".

**Scientific false positives — the crucial distinction.** Methodological passive is the
registered convention of scientific writing and must survive: "participants were recruited",
"the model was trained for 30 epochs", "samples were centrifuged at 4 °C". The register requires
it; forcing active voice everywhere is style-homogenization, which the skill forbids. The test is
which verb is passivized: **measurement and procedure** (keep), **decision and judgment**
(should name the actor).

---

## Business jargon

| Avoid | Use instead |
|---|---|
| navigate (challenges) | handle, address |
| unpack (an analysis) | explain, examine |
| leverage (a resource) | use, draw on |
| landscape (of a field) | field, literature |
| deep dive | detailed analysis |
| game-changer | major advance (only when specific) |
| double down | commit |
| take a step back | reconsider |
| moving forward | next, henceforth |
| circle back | return to |
| on the same page | aligned |
| drive (change, adoption) | cause, produce |
| streamline | simplify, remove steps |

In academic prose the usual offenders are *leverage*, *unpack*, *navigate*, and *landscape*.
Replace with the plain verb; the sentence loses nothing. Note that the LLM-lexicon lists in
[manuscript.md](manuscript.md#llm-register-in-academic-prose) already catch several of these —
the table adds the business-specific remainder.

---

## The one test for this family

For every construction flagged here, ask:

> Does the pattern carry a proposition the claim needs, or is it the runway to a claim that
> stands without it?

Runway: cut the construction, keep the claim. If cutting the construction also cuts a comparison,
a caveat, or an actor, it was doing work — keep it and record it as a deliberate keep.
