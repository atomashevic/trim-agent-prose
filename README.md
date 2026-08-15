# deslop my research

An agent skill that detects and removes LLM prose bloat/slop from research projects, while never touching the research materials. *(Formerly `trim-agent-prose`.)*

Agents leave two kinds of residue. 

- In **external-facing materials** (the manuscript, the slide
deck, the poster, the talk, the grant proposal) it is register bloat: throat-clearing, vogue
vocabulary, defensive language, uniform sandwich paragraphs, discourse-marker chains, etc.

- In the **internal artifacts** around them — code comments, docstrings, READMEs, `AGENTS.md`, design
notes, analysis logs — it is chain-of-thought leakage: prose whose vantage is the authoring
session rather than the project.

This skill teaches an agent to find both, sort every proposed edit into a *register-only* bucket
(safe to apply) and a *meaning-adjacent* bucket (proposed, never silently applied), and to refuse
to touch the load-bearing parts: numbers, citations, quotations, math, limitations, provenance.


## What it covers

| Surface | Materials |
|---|---|
| **External** | manuscripts (LaTeX / Quarto / R Markdown), abstracts, response letters, cover letters, **slide decks**, **posters**, **talk scripts**, **grant proposals**, blog and press prose |
| **Internal** | code comments and docstrings, `%` comments in `.tex`, READMEs, `AGENTS.md`/`CLAUDE.md`, design and decision notes, analysis logs, data dictionaries, agent scratch files |

Plus **rhetorical structures** on both surfaces: binary contrasts, negative listing, false
agency, vague declaratives, emphasis crutches, meta-commentary, Wh- openers, adverb crutches,
and decision-hiding passive — each with its scientific-register false positives.

## Install

It is a plain skill directory, so it works with the agents that read skills in this format.

**pi** (via the package manifest in this repo):

```bash
pi install git:github.com/<you>/deslop
# or
pi install npm:deslop          # if published to npm
```

**Claude Code / Codex** — clone the repo and add the directory to your skills path, or symlink
`SKILL.md` into your skills folder. The `SKILL.md` at the repo root is the entry point; the
`references/` and `scripts/` resolve relative to it.

## Usage

The easy path is one command on whatever you want judged — a file, a directory, or the whole
repo root:

```bash
scripts/scan.sh --score .
```

It prints a 0–100 score with a grade band, a per-file breakdown worst-first (so a sloppy
response letter can't hide behind ten thousand clean lines of code), the top weighted issues,
and a suggested next step. Everything else stays in the background.

Under the hood it runs the recall batteries (requires
[ripgrep](https://github.com/BurntSushi/ripgrep)) and then relies on the agent's judgment — the
batteries over-match on purpose, and the worst bloat is fluent prose with no flagged token, so a
scan is always paired with an unpatterned read. Narrower entry points:

```bash
scripts/scan.sh --score paper/            # score just the manuscript sources
scripts/scan.sh --surface external paper/ # line-level hits, external prose only
scripts/scan.sh --surface internal src/ README.md
scripts/scan.sh --protect paper/          # provenance/statistics/calibration markers: keep these
```

See `SKILL.md` for the full rules, and `references/` for the calibration examples.

## Safety model

- **Two buckets.** Register-only edits are applied; meaning-adjacent edits are proposed with the
  original, the proposal, and one line on what changes. When in doubt, it's the second bucket.
- **Never change** numbers/statistics, citations, direct quotations, math, limitations,
  exploratory labels, preregistration statements, or mandated boilerplate.
- **Data files are never prose.** `.csv`, `.tsv`, `.parquet`, survey items, participant quotes and
  recorded outputs are out of scope. Data *documentation* — dictionaries, codebooks, variable
  labels — is internal prose and in scope.

## Attribution

The register standards adapt
[deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) (MIT) —
`.agents/skills/dsh-prose-standard` and `.agents/skills/dsh-trim-cot-leakage`. The rhetorical-
structure classes and scoring heuristic adapt
[hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) (MIT), reworked with
scientific-register false positives.

## License

MIT — see [LICENSE](LICENSE).
