# Required prose by surface — around the manuscript

Trimming is half the job. A long agent-built project is usually over-narrated where the code
already speaks and under-documented at the points that cost real time — the reason a threshold is
0.05 and not 0.01, the column a merge silently drops, the exclusion nobody can reconstruct six
months later when a reviewer asks.

This file covers everything except the manuscript itself: code, analysis scripts, pipelines, data
handling, and project documents. For what each *manuscript* section owes its reader, see
[manuscript.md § Section-by-section](manuscript.md#section-by-section).

Use this list two ways: to decide whether a comment you are about to delete is actually required
here, and to notice gaps worth filling in the same pass. The governing rule everywhere is the
same — **a comment earns its place by stating a contract or a rationale the code cannot express.**
Do not add a comment when the facts are already obvious locally; an obligatory docstring on a
three-line helper is the bloat this skill removes.

## Contents

- [Code surfaces](#code-surfaces)
- [Research-specific surfaces](#research-specific-surfaces)
- [Document surfaces](#document-surfaces)
- [Two structural rules](#two-structural-rules)

---

## Code surfaces

**Public functions, classes, and exported APIs.** Document what a caller cannot see from the
signature: return distinctions (what `None` versus an empty result means), what it raises and
when, side effects, ownership transfer, timing and ordering constraints, cancellation, durability,
and thread/process safety. Skip the parameter list when the names and types already say it.

**Internal comments.** Orient non-local structure and genuinely complicated local structure:
invariants, ordering and race constraints, ownership, security boundaries, and surprising failure
behavior. Delete control-flow narration and code restatement. A good internal comment answers
"why is this here" or "what breaks if you change it", never "what does this do".

**Module and package headers.** State the module's role, its dependencies, what it owns, and any
non-obvious architectural choice — with a link to the owning explanation rather than a copy of it.
Not a preview of the classes below.

**Tests.** Explain only non-obvious test design: why this fixture, why this tolerance, why the
assertion observes an external result rather than the function's own report, why a platform
accommodation exists. Delete walkthroughs and inventories. A test whose design is obvious needs no
comment at all.

**Suppressions and ignores.** Every `# noqa`, `# type: ignore`, `# nolint`, `# pragma: no cover`,
and empty `except` needs a reason clause. These are required prose, not optional decoration.

**CLI help, error messages, and tool descriptions.** Anything a user or a model reads at runtime
is behavior, not documentation. Treat a reword as a behavior change: check the rendered output and
any snapshot that pins it.

---

## Research-specific surfaces

**Analysis scripts.** The header should let someone re-run and trust the result: what question the
script answers, its inputs and outputs by path, the seed, and the runtime order relative to
sibling scripts if it matters. Inside, document every analysis decision that a reviewer could
challenge — exclusion rules and their timing relative to unblinding, why this covariate set, why
this window, why this prior, why this correction for multiple comparisons.

**Statistical choices.** State the estimator and its assumptions where the assumption could be
violated by the data at hand: "cluster-robust SEs by site; the site count (8) is at the low end
for the asymptotics." Distinguish confirmatory from exploratory analyses explicitly. If a result
is exploratory, the word belongs next to the result, not only in the manuscript.

**Data handling.** Provenance (where each raw file came from, when, under what version or access
date), licensing and redistribution limits, what is deliberately not committed and why, PII
handling, and any manual correction applied to raw data. A manual fix with no note is
irreproducible by definition.

**Data dictionaries and codebooks.** Each variable owes its reader the meaning, units, coding
scheme (what 0/1 mean, how missing is marked), and any transformation applied. These are
trimmable *prose* — cut the register bloat, keep every coding rule. A variable whose codebook
entry is missing is a gap to fill, not a redundancy to cut. The data values themselves are out of
scope (see SKILL.md — never change data).

**Pipeline definitions** (`Makefile`, `snakemake`, `targets`, `dvc.yaml`, workflow YAML). Comment
the non-obvious dependency, the step that must not run in parallel, the expensive rule and its
approximate cost, and any step whose output is committed rather than regenerated. Do not narrate
the DAG the file already declares.

**Notebooks and Quarto/R Markdown.** When the file *is* the manuscript, its narrative text is a
external (manuscript) surface — see [manuscript.md](manuscript.md). When it is an analysis notebook, the
narrative cells owe the reader the same thing a script header does: the question, the inputs, the
decisions taken, and what the reader should conclude from each output. Code-cell comments follow
the ordinary rules. If output cells are committed, note whether they are current and what
regenerates them.

**Environment and reproducibility notes.** Version pins that exist for a reason, platform
differences that change results (BLAS threading, locale-dependent sorting, RNG stream changes
between library versions), and the command that reproduces the headline numbers.

---

## Document surfaces

**README.** The consumer contract: what this is, how to run it, configuration and its semantics,
known limitations, extension points. For a research repo, add the reproduction path — the exact
command sequence from a clean checkout to the reported result, and how long it takes. Keep durable
gaps and maintainer traps; a README is not a backlog dump, and ordinary cleanup belongs in a
`TODO` or an issue.

**AGENTS.md / CLAUDE.md.** Standing orders only — rules an agent needs in context every session,
one to three lines each, each linking to its home. Not stories, not worked examples, not anything
restated from a linked document. If a rule needs a paragraph to explain, the paragraph lives in
its home and the standing order links there.

**Decision notes / ADRs.** Retain the unique rationale, the mechanism, the alternatives considered
and why they lost, the consequences accepted, and the verification that pins the decision. Once
the decision has shipped, write it in the present tense as shipped reality — delete the migration
plan and the acceptance checklist, keep the evidence and the named gaps. Spec-speak ("should",
"will") in an implemented note is a signal it was never updated after landing.

**Postmortems and incident notes.** The sequence, the evidence, the causal chain, the impact, and
the prevention. Remove repeated persuasion and implementation detail that does not establish
causality. This is the one tier where narrative belongs.

**Changelogs.** Change narration lives here. Do not trim it out; do trim it *into* here from
places it does not belong.

**How-to guides and cookbooks.** Prerequisites, the required actions in order, the real entry path
(not a simplified stand-in), observable verification at each step, and concise warnings. Design
rationale belongs in the decision note the guide links.

**Configuration files and example configs.** Explain what the tree cannot show: load order and its
consequence, access limits, security stance, replay behavior, and likely misuse. "Load the policy
plugin before the model-facing tools so their writes pass through the read-before-mutation check"
is worth a line. Narrating the entries the file already lists is not.

---

## Presentation surfaces

The positive side of [presentations.md](presentations.md). A deck, poster, or talk owes its
audience one thing the manuscript already has: the takeaway, stated once and clearly.

**Slide decks** owe a title that states the takeaway, one idea per slide, the key number with its
statistic, and a throughline that connects slides. What a deck does not owe: an agenda, a recap
per section, and the abstract.

**Posters** owe the question, the headline result with its number, the method in one line, and the
take-home. What a poster does not owe: the abstract, a paragraph block, and the full bibliography.

**Talk scripts** owe the spoken throughline and the one sentence the audience should remember.
What a script does not owe: throat-clearing, meta-transitions, and self-narration.

**Speaker notes** owe the delivery cues and the answer to the likely question. What they do not
owe: the slide restated and chain-of-thought.

---

## Two structural rules

**One fact, one home.** When the same rule appears in two places, one of them is drifting.
Keep the copy in the tier that owns it and link from the other. Essential contract facts may
repeat locally at the point of use — a caller needs the failure mode where they call, not only in
the architecture doc — but the rationale, the algorithm, and the history have exactly one home.

**Link aggressively, but never instead of the local contract.** "Disposal is documented in the
lifecycle note" is not a contract. "Disposal aborts the run and waits for provider quiescence; see
the lifecycle note for ownership and race handling" is: the caller gets the behavior and the
completion guarantee where they need them, and the algorithm stays in one place.
