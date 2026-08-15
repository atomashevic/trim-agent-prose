---
name: trim-agent-prose
description: Trim agent-generated prose bloat from research projects — the external-facing materials (LaTeX/Quarto/R Markdown manuscripts, abstracts, response letters, cover letters, slide decks, posters, talk scripts, grant proposals, blog and press prose) and the internal artifacts around them (code comments, docstrings, READMEs, AGENTS.md/CLAUDE.md, design notes, analysis logs, data dictionaries, agent scratch files). Removes LLM register ("delve", "underscore", "plays a crucial role", "it is important to note"), throat-clearing and sandwich paragraphs, discourse-marker chains, stacked hedges, serial gratitude in response letters, chain-of-thought leakage, change narration, reasoning transcripts, dead session citations and agent chat voice — while refusing to alter numbers, citations, hedges, claim strength, data, or limitations. Use whenever the user wants a paper, draft, rebuttal, cover letter, deck, poster, talk, grant, section, abstract, README, notes, or comments cleaned up, tightened, de-slopped, cut to a word limit, or checked for AI-sounding writing; says something "reads like an AI wrote it" or is full of "slop", "fluff", or "filler"; or is preparing a submission, revision, talk, handoff, or reproducibility review. Also use before drafting new manuscript or presentation prose, to know what belongs there.
---

# Trim Agent Prose

Agents leave two kinds of residue in a research project. In **external-facing materials** — the
paper, the rebuttal, the cover letter, the slide deck, the poster, the talk, the grant — it is
register bloat: throat-clearing, vogue vocabulary, uniform sandwich paragraphs, discourse-marker
chains, hedges stacked until they blur, gratitude repeated until it reads as padding. In the
**internal artifacts** around them it is chain-of-thought leakage: prose whose vantage is the
authoring session rather than the project, citing artifacts only that session could see and
narrating the change instead of the state.

Both accumulate silently, because neither breaks a test and both read fluently. The goal is prose
that sounds like the author at their most direct. The goal is **not** fewer words: a shorter
paragraph that lost a qualifier, a limitation, or a provenance marker is a worse paper, and in a
manuscript that error can end up in print.

This is guidance, not a script. The batteries find candidates; you judge them.

Register standards adapted from [deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness)
(`.agents/skills/dsh-prose-standard`, `.agents/skills/dsh-trim-cot-leakage`). Rhetorical-structure
classes and the scoring heuristic adapted from [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop)
(MIT), reworked with scientific-register false positives.

## The two surfaces

| Surface | Files | Guidance |
|---|---|---|
| **External** — prose the outside world reads | manuscripts (`*.tex`, `.qmd`/`.Rmd`/`.md`), abstracts, response letters, cover letters, grant proposals — and slide decks, posters, talk scripts, blog and press prose | [references/manuscript.md](references/manuscript.md) · [references/presentations.md](references/presentations.md) · [references/structures.md](references/structures.md) |
| **Internal** — comments and artifacts | code comments and docstrings, `%` comments inside `.tex`, READMEs, `AGENTS.md`/`CLAUDE.md`, design and decision notes, analysis logs, data dictionaries, speaker notes, agent scratch files | [references/taxonomy.md](references/taxonomy.md) |

Both surfaces share the rules below. `references/examples.md` calibrates every class with
before/after pairs; `references/coverage.md` covers what prose each surface *owes* its reader,
because a long agent-built project is usually over-narrated where the text already speaks and
under-documented where it matters.

## The two buckets

Sort every proposed edit into one of two buckets and keep them separate in the diff and the
report. This split is the safety design: it lets the author accept a hundred wording fixes at a
glance while giving real attention to the few edits that touch the argument.

**Bucket A — register only.** The proposition is identical; only the wording changed. Deleting
"It is important to note that", collapsing "performs a calculation of" to "computes", cutting a
closing sentence that restates the opening sentence. Apply these.

**Bucket B — meaning-adjacent.** Anything that could change what a reader concludes: claim
strength, hedge removal, a merge that creates a new causal implication, reordering that shifts
emphasis, cutting a clause that qualified a result, anything on or beside a number or citation.
Do not apply these. Propose each with the original, the proposal, and one line on what changes.

**When you cannot tell which bucket an edit is in, it is Bucket B.** Over-flagging costs the
author one extra line to read. Under-flagging puts a claim in a paper that the data do not support.

## Never change

Not "be careful with" — never, in either bucket, unless the author explicitly asks:

- **Numbers and statistics** — effect sizes, CIs, *p*-values, N, df, percentages, coefficients,
  dates. Not their values, not their rounding, not their direction.
- **Citations** — nothing added, removed, reattributed, or moved between clauses. Moving a
  citation changes who is claimed to have shown what.
- **Direct quotations**, including reviewer text in a rebuttal and participant quotes in
  qualitative work. Edit around them, never inside.
- **Math environments and symbol definitions.**
- **Limitations, exploratory labels, preregistration statements.** Shortening a limitations
  paragraph is the most damaging edit available here. Tighten the prose only if every named
  limitation survives by name.
- **Journal-mandated boilerplate** — ethics, consent, funding, conflicts, data and code
  availability, CRediT, registration. Often required verbatim.
- **Recorded outputs, build artifacts, and third-party trees** — `*.aux`/`*.bbl`, fixtures,
  snapshots, saved model responses, `vendor/`, `renv/`, `.venv/`.
- **Data files and data values** — `*.csv`/`*.tsv`/`*.parquet`/`*.rds`, survey items, variable
  values, participant quotes, recorded model output committed as data. Data *documentation* —
  dictionaries, codebooks, variable labels, and the README that describes a dataset — is internal
  prose and is in scope; the data itself never is.
- **The line-break convention.** If the source is one sentence per line, keep it. Reflowing
  destroys the author's diff and their co-authors' review workflow.

Generated files get fixed at the owner: edit the source docstring, template, or `.qmd` chunk, then
regenerate. Editing the artifact alone is overwritten on the next build.

## Before you start

**Require an explicit scope.** If the user did not name files, a section, or a diff range, ask.
A whole-project pass produces a diff nobody reviews, and unreviewable prose diffs are how true
statements get deleted.

**Separate report authority from write authority.** "Audit", "review", "check", "what's bad here"
→ report, edit nothing. "Trim", "clean", "cut to 4000 words", "fix" → apply Bucket A, propose
Bucket B. On a first pass over an unfamiliar manuscript, show the author a sample of both buckets
from one section before doing the rest.

**Read the target's own constraints first**: journal word and abstract limits, the style guide,
the repo's `AGENTS.md`/`CLAUDE.md`, an existing lint or `.aspell` config. A local rule outranks
this skill.

## The one test — internal surfaces

For every suspect passage in a comment, note, or README:

> Could a reader at HEAD, with no access to any session transcript, chat log, PR thread, or
> uncommitted draft, resolve every reference and verify every claim?

If **no**: restate the surviving facts from the project's vantage, then delete the transcript
around them. Deletion alone is wrong whenever the passage carries a factual clause — a dead
citation usually has a true statement stapled to it. A passage with no proposition at all (an
audit code, control-flow narration, "Perfect!") is deleted outright.

If **yes**: it is not leakage, however historical it sounds. But on current-state surfaces a
resolvable change story is still change narration, and belongs in the changelog or the commit.

## Preserve every proposition

Before editing any passage, enumerate what it asserts. Each is a separate fact and each must
survive:

- actor and action; condition, timing, ordering
- modality: must, may, never, pending
- negative guarantees and exceptions
- ownership, side effects, failure modes, consequences
- **provenance and epistemic status** — measured vs. assumed, exploratory vs. preregistered,
  pilot vs. full sample, in this sample vs. in general

Delete *clauses*, not sentences, when a line mixes bloat with a load-bearing fact. If you cannot
restate a passage without losing a proposition, keep it and record it as a deliberate keep.

## What to cut

**Manuscript and grant surfaces** — LLM lexicon (delve, underscore, pivotal, multifaceted, "plays a
crucial role", "sheds light on"), throat-clearing openers, sandwich paragraphs, topic sentences
that restate the heading, discourse-marker chains (Furthermore/Moreover/Additionally),
rule-of-three padding, the aim restated in four places, citation-free generalities, stacked
hedges, serial gratitude and unlocated change claims in rebuttals, significance inflation in
grant aims. Full treatment with fixes, section-by-section guidance, and the domain-term false
positives: [references/manuscript.md](references/manuscript.md).

**Presentation and outreach surfaces** — slide titles that restate the bullet, "as shown above",
agenda and recap slides that over-promise, empty intensifiers in bullets, meta-transitions and
throat-clearing in talk scripts, the abstract restated on a poster, clickbait hedging in blog and
press prose. Full treatment: [references/presentations.md](references/presentations.md).

**Rhetorical structures** — binary contrasts ("not X but Y"), negative listing ("not a toolkit,
not a benchmark"), dramatic fragmentation, rhetorical setups ("What if…?", "Think about it:"),
false agency ("the data tells us", "the analysis decided"), narrator-from-a-distance ("people
tend to…"), vague declaratives ("the implications are significant"), emphasis crutches ("full
stop."), meta-commentary ("let me walk you through"), Wh- sentence starters, adverb crutches
("truly", "essentially"), and decision-hiding passive voice. Each class carries its scientific
false positives — the register words that must survive. Full treatment:
[references/structures.md](references/structures.md).

**Internal surfaces** — dead session citations (`(decision 7)`, `design §4.7`, phase labels), PR
and branch vantage ("this PR adds"), change narration and version stamps ("used to", "no longer",
"for now"), review choreography ("as discussed", "the reviewer confirmed"), reviewer-addressed
self-justification ("this is safe because…"), control-flow narration and test walkthroughs,
planning residue ("probably fine for now"), agent chat voice ("Let me…", "Perfect!", ✅), status
annotations, and comment-form slop (decorative separator banners, section-header comments,
authoring-session process commentary — with generation provenance kept). Full treatment with
false-positive families: [references/taxonomy.md](references/taxonomy.md).

## What must survive

An unaided pass deletes these. They are keeps.

- **Calibrated uncertainty about findings.** "Consistent with H2, but the CI includes zero and
  the design is underpowered for d < 0.3" is the paper being honest. The test for any hedge: does
  it describe *the world* (keep verbatim) or *the author's schedule* (promote to a TODO or
  delete)? "Probably fine for now" is residue; "may contribute to" is a claim about evidence.
- **Provenance words** — measured, estimated, simulated, pilot, preregistered, exploratory, post
  hoc, "in this sample". Dropping *exploratory* is not concision; it is a different claim.
- **Exclusion, deviation, and analysis-decision rationale** — the reproducibility audit trail,
  wherever it sits.
- **Durable references** — DOIs, arXiv IDs, registration and accession numbers, `#1470`,
  `TODO(name):`, RFC and standard sections. Keep on any surface.
- **Suppression justifications** — `# noqa: … -- reason`, `# type: ignore`, coverage-ignore
  reasons. If the reason is false, fix the reason; never delete it.
- **Non-obvious technical facts** — log-sum-exp for underflow, tie-breaking, locale-dependent
  sorting, tolerance choices, version pins that exist for a reason.
- **Author voice.** A short punchy sentence, an unusual but precise word, a deliberately blunt
  transition — these are the author, not the machine. Remove machine register; do not homogenize
  a human one. Flag rather than smooth.

## Workflow

1. **Confirm scope, mode, and limits** in one line before a large pass, so a misread scope costs
   a sentence rather than a diff.
2. **Scan for candidates.** `scripts/scan.sh <path>` runs the recall batteries.
   `--surface external` or `--surface internal` narrows the family; `--protect` surfaces the
   provenance, statistics, and calibration markers that are off-limits — worth running first so
   you know what not to touch; `--only NAME` and `--counts` narrow further. The batteries
   over-match on purpose, and a zero-hit battery proves nothing until you have seen it match.
3. **Read the densest prose without a pattern in hand.** Discussion sections, module headers, the
   longest paragraphs. The worst bloat is fluent and carries no flagged token, so the batteries
   will not find it.
4. **Classify every candidate**: keep, Bucket A, Bucket B, relocate, or defer. Do not manufacture
   edits to hit a word target. Relocation is often right — methods detail to a supplement, a
   change story to the changelog, a rationale to a decision note with a link left behind.
5. **Apply Bucket A**, one surface at a time, owner before generated artifact. Fix one instance,
   then re-check every analogous passage before moving on.
6. **Verify.** Re-run the batteries and expect only sanctioned keeps. For LaTeX, confirm the
   document still builds — a stray brace from a sentence edit breaks compilation, and a prose pass
   that leaves the paper uncompilable is worse than no pass. For `.qmd`/`.Rmd`, re-render. For
   code, check `git diff -U0` touches only comment and docstring lines, and run the tests if any
   code file was touched. Check that numbers in an edited abstract still match the Results.
7. **Deliver reviewably.** Commit Bucket A separately from Bucket B and both separately from
   content changes. For anything beyond a handful of manuscript edits, generate a marked-up PDF —
   `latexdiff old.tex new.tex > diff.tex` — since that is how most co-authors want to review.

## Quick score (optional)

For a passage, a section, or a whole draft under review, rate 1–10 on each dimension — adapted
from stop-slop — and say which dimension drives the score:

| Dimension | Question |
|---|---|
| Directness | Statements, or announcements of statements? |
| Rhythm | Varied cadence, or uniform sentences and three-item lists? |
| Trust | Respects the reader's intelligence — no manufactured weight? |
| Authenticity | Reads like the author at their most direct? |
| Density | Anything cuttable that carries no proposition? |

Below 35/50, the passage needs a Bucket A pass; below 20/50, suspect structure more than
vocabulary and re-read with [references/structures.md](references/structures.md) in hand.

Two verification points that catch real mistakes. **Docstrings, CLI help, and error text are
behavior** when anything reads them at runtime; treat a reword there as a behavior change. And in
a rebuttal, **never write or tighten a claim that a change was made without checking it against
the actual manuscript diff** — a fluent sentence asserting a revision that does not exist is the
worst failure mode this skill has.

## Before deleting: the overcorrection traps

Each shipped in a real purge and was caught in review:

- **Strengthening a claim.** Removing "suggests", "consistent with", "in this sample" is not
  concision. It is a different assertion.
- **Flipping modality.** "exceptions pending migration" → "sanctioned exceptions" turns an
  obligation into an endorsement.
- **Promoting a hypothetical.** Deleting "future" from "a future IPC shell subclasses the
  executor" claims a class that does not exist.
- **Deleting a true fact with the transcript around it.** Half the sentence was narration; the
  other half was load-bearing. Cut the clause.
- **Dropping provenance while keeping the number.** Without "measured", an observation reads as a
  definition and nobody re-measures.

[references/examples.md](references/examples.md) has before/after calibration for every class and
every trap. Read it when a case feels borderline rather than inventing a house style.

## Report

Close every run — audit or edit — with:

```
## Scope
Files inspected; what was excluded and why; word counts before/after if a limit applies.

## Applied (Bucket A)
Grouped by class, with counts. Individual lines only where the change is interesting.

## Proposed (Bucket B)
The centrepiece. Per item: original, proposal, what changes in meaning.
Ordered by how far the meaning moves, not by page order.

## Deliberate keeps
Passages that matched a battery and were kept, with the rule that governs them.

## Checks run
Batteries re-run, build/render result, tests, what the diff touches,
and — for a rebuttal — which change claims were verified against the manuscript diff.
```

Report what you actually inspected and ran. "Clean" claimed over text you did not read is the one
failure mode this skill cannot recover from.
