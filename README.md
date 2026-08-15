# trim-agent-prose

An agent skill that removes LLM prose bloat from research projects — while never touching the
science.

Agents leave two kinds of residue. In **external-facing materials** — the manuscript, the slide
deck, the poster, the talk, the grant proposal — it is register bloat: throat-clearing, vogue
vocabulary, uniform sandwich paragraphs, discourse-marker chains, hedges stacked until they blur.
In the **internal artifacts** around them — code comments, docstrings, READMEs, `AGENTS.md`, design
notes, analysis logs — it is chain-of-thought leakage: prose whose vantage is the authoring
session rather than the project.

This skill teaches an agent to find both, sort every proposed edit into a *register-only* bucket
(safe to apply) and a *meaning-adjacent* bucket (proposed, never silently applied), and to refuse
to touch the load-bearing parts: numbers, citations, quotations, math, limitations, provenance.

The goal is **not** fewer words. A shorter paragraph that lost a qualifier, a limitation, or a
provenance marker is a worse paper — and in a manuscript that error can end up in print.

## What it covers

| Surface | Materials |
|---|---|
| **External** | manuscripts (LaTeX / Quarto / R Markdown), abstracts, response letters, cover letters, **slide decks**, **posters**, **talk scripts**, **grant proposals**, blog and press prose |
| **Internal** | code comments and docstrings, `%` comments in `.tex`, READMEs, `AGENTS.md`/`CLAUDE.md`, design and decision notes, analysis logs, data dictionaries, agent scratch files |

## Install

It is a plain skill directory, so it works with the agents that read skills in this format.

**pi** (via the package manifest in this repo):

```bash
pi install git:github.com/<you>/trim-agent-prose
# or
pi install npm:trim-agent-prose          # if published to npm
```

**Claude Code / Codex** — clone the repo and add the directory to your skills path, or symlink
`SKILL.md` into your skills folder. The `SKILL.md` at the repo root is the entry point; the
`references/` and `scripts/` resolve relative to it.

## Usage

The skill runs the `scripts/scan.sh` battery (requires [ripgrep](https://github.com/BurntSushi/ripgrep))
to surface candidates, then relies on the agent's judgment — the batteries over-match on purpose,
and the worst bloat is fluent prose with no flagged token, so a scan is always paired with an
unpatterned read.

```bash
scripts/scan.sh --surface external paper/
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
`.agents/skills/dsh-prose-standard` and `.agents/skills/dsh-trim-cot-leakage`.

## License

MIT — see [LICENSE](LICENSE).
