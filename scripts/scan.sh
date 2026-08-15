#!/usr/bin/env bash
#
# Recall batteries for agent prose bloat. Probes for the classes in
# references/taxonomy.md (internal surfaces), references/manuscript.md, and
# references/presentations.md (external surfaces), tuned to over-match: every
# hit needs semantic judgment, and in a research repo a large share of them are
# legitimate keeps.
#
# Two properties worth internalising before you trust the output:
#   - A zero-hit battery proves nothing until you have seen it match. Test a
#     pattern against a known-positive line before believing a clean result.
#   - The batteries under-match by nature. The worst manuscript bloat is fluent
#     prose containing no flagged token, so pair this with an unpatterned read.
#
# Usage:
#   scan.sh [options] <path>...
#
#   --surface all|external|internal   Which battery family to run (default: all)
#   --only NAME[,NAME...]               Run just these batteries
#   --list                              Show battery names and their surface
#   --protect                           Also run PROTECT: provenance, calibration,
#                                       statistics, and suppression markers that must
#                                       survive a trim. Run this before cutting.
#   --counts                            Print only the per-battery hit counts
#   --include-phase-labels              Add the phase-label battery (very noisy in a
#                                       research repo, where T1/T2/W3/P1 are timepoints,
#                                       waves, and participant IDs)
#
# Extra exclusions: set TAP_EXCLUDES to a space-separated list of globs, e.g.
#   TAP_EXCLUDES='!drafts/old/** !supplement/**' scripts/scan.sh paper/

set -uo pipefail

if ! command -v rg >/dev/null 2>&1; then
  echo "error: ripgrep (rg) is required. Install it with your package manager (e.g. 'pacman -S ripgrep', 'brew install ripgrep', 'apt install ripgrep')." >&2
  exit 127
fi

ONLY=""
SURFACE="all"
PROTECT=0
COUNTS_ONLY=0
PHASE_LABELS=0
PATHS=()

while [ $# -gt 0 ]; do
  case "$1" in
    --list) LIST=1; shift ;;
    --surface) SURFACE="$2"; shift 2 ;;
    --only) ONLY="$2"; shift 2 ;;
    --protect) PROTECT=1; shift ;;
    --counts) COUNTS_ONLY=1; shift ;;
    --include-phase-labels) PHASE_LABELS=1; shift ;;
    -h|--help) sed -n '2,32p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*) echo "error: unknown option $1" >&2; exit 2 ;;
    *) PATHS+=("$1"); shift ;;
  esac
done

case "$SURFACE" in all|external|internal) ;; *)
  echo "error: --surface must be all, external, or internal" >&2; exit 2 ;;
esac

# Exclusions go last so a later include cannot re-admit them. Manuscript sources
# are deliberately NOT excluded — they are the primary surface. What stays out is
# build output, structured data, and third-party trees.
EXCLUDES=(
  --glob '!.git/**'
  --glob '!vendor/**' --glob '!node_modules/**' --glob '!target/**'
  --glob '!renv/**' --glob '!.venv/**' --glob '!venv/**' --glob '!**/site-packages/**'
  --glob '!.Rproj.user/**' --glob '!**/__pycache__/**' --glob '!**/.mypy_cache/**'
  --glob '!**/archived/**' --glob '!**/deprecated/**'
  --glob '!**/snapshots/**' --glob '!**/__snapshots__/**'
  --glob '!**/fixtures/**' --glob '!**/cassettes/**' --glob '!**/_output/**'
  # Static-site build output (Quarto, knitr, revealjs) and render caches.
  --glob '!**/_site/**' --glob '!**/*_files/**' --glob '!*.map'
  --glob '!.pytest_cache/**' --glob '!.ruff_cache/**'
  # LaTeX build artefacts: regenerated, never edited.
  --glob '!*.aux' --glob '!*.bbl' --glob '!*.blg' --glob '!*.out' --glob '!*.toc'
  --glob '!*.lof' --glob '!*.lot' --glob '!*.fls' --glob '!*.fdb_latexmk'
  --glob '!*.synctex*' --glob '!*.nav' --glob '!*.snm' --glob '!*.vrb'
  --glob '!**/_minted*/**' --glob '!*.log' --glob '!*.pdf'
  # Bibliography is structured data; citation verification is a different job.
  --glob '!*.bib'
  --glob '!*.csv' --glob '!*.tsv' --glob '!*.parquet' --glob '!*.rds' --glob '!*.feather'
  --glob '!CHANGELOG*' --glob '!NEWS.md'
  --glob '!**/trim-agent-prose/**'
)

# shellcheck disable=SC2206  # deliberate word splitting: TAP_EXCLUDES is a glob list
if [ -n "${TAP_EXCLUDES:-}" ]; then
  for g in ${TAP_EXCLUDES}; do EXCLUDES+=(--glob "$g"); done
fi

# name|surface|rg-flags|pattern|one-line note
# Natural-language batteries carry -i so sentence-initial capitals match.
# Code-shaped batteries stay case-sensitive: -i turns them into noise.
BATTERIES=(
# ── External surfaces: .tex, response letters, cover letters, .qmd/.Rmd prose
"llm-lexicon|external|--hidden -i|\\bdelv(e|es|ing)\\b|\\bunderscor(e|es|ing)\\b|\\bpivotal\\b|\\bintricate\\b|\\bmultifaceted\\b|\\bholistic\\b|\\brealm of\\b|\\blandscape of\\b|\\btapestry\\b|\\bmyriad\\b|shed(s|ding)? light on|pave(s|d)? the way|a testament to|at the forefront|ever-evolving|navigat(e|ing) the complexit|plays? an? (crucial|vital|pivotal|significant|key|important) role|serves? as an? |in today[\\x27’]s (world|landscape)|in recent years, there has been|it is (widely|generally) (recogni|acknowledg|accept)|LLM register tells — replace with the specific claim, or delete the sentence if it has none"
"discourse-chains|external|--hidden -i|^[[:space:]]*(furthermore|moreover|additionally|in addition|notably|importantly|significantly|overall|taken together|in conclusion|firstly|secondly|thirdly|lastly|to summari[sz]e)\\b|Discourse-marker chains — a paragraph that needs a connective in every opening sentence is list-thinking rendered as prose"
"hedge-stacking|external|--hidden -i|may potentially|could potentially|might potentially|could possibly|may possibly|may be able to|appears? to (potentially|possibly)|it is possible that .{0,40} may|somewhat of a|Stacked hedges — one hedge carries the uncertainty; two only blur it. Keep the calibrated one, drop the duplicate"
"overclaim|external|--hidden -i|clearly (show|shows|demonstrate|demonstrates|indicate|indicates)|\\b(prove|proves|proven|confirms|establishes) that\\b|undoubtedly|without a doubt|it is evident that|strongly (suggests|indicates)|Overclaim — check the design supports the verb. Correlational work is consistent with, it does not demonstrate. FLAG, do not silently edit"
"significance-ambiguity|external|--hidden -i|\\bsignificant(ly)?\\b|Every use must be statistically qualified or replaced (substantial, meaningful, marked). Noisy by design — skim, do not bulk-edit"
"obsequious|external|--hidden -i|we thank the (reviewer|referee|editor) for (this|the|your)|we (greatly |sincerely )?appreciate|we are grateful|excellent (point|suggestion)|(very )?(good|valuable|insightful|thoughtful|helpful) (point|comment|suggestion)|we have carefully (considered|reviewed|read)|thank you for (this|your) |Response-letter padding — one brief thanks per reviewer, then substance"
"vague-change-claim|external|--hidden -i|revised (the (manuscript|text|paper|section) )?accordingly|we have (revised|updated|clarified|rephrased|amended) (this|the text|the manuscript)|has been (revised|clarified|updated) accordingly|as suggested|Unlocated change claim — every response must name the section and line, and must match the actual diff"
"boilerplate-echo|external|--hidden -i|in this (paper|study|article|work), we|the (aim|goal|purpose) of this (paper|study) is to|this (paper|study) (aims|seeks|attempts) to|the present study|Repeated framing — state it once. Abstract, intro, and discussion each restating the aim is padding"
# ── External presentation surfaces: decks, posters, talks, speaker notes, blog/press
"deck-narration|external|--hidden -i|as shown (above|below|here)|as you can see|in this (talk|presentation|deck|slide|poster)|next (slide|section)|the (following|previous|next) slide|see (above|below)|without further ado|moving on|shift gears|I[\x27’]ll come back to|as I mentioned|Position and meta-narration — reference the finding or the data, not the deck's position or the talk's own structure"
"empty-intensifier|external|--hidden -i|\bvery (fast|slow|good|bad|important|effective|robust|powerful|simple|complex|large|small|efficient|accurate|clear|interesting)\b|\bincredibly\b|\bextremely\b|\bremarkably\b|\btruly\b|\bhugely\b|Empty intensifier — on a slide the number or the specific claim beats the adverb; noisy by design"
"filler-hedge|external|--hidden -i|\bkind of\b|\bsort of\b|a little bit|you know|\bright\?\b|\barguably\b|quite possibly|somewhat important|Filler hedge — say the calibrated claim or nothing; spoken prose keeps deliberate pacing words, cut the empty ones"
# ── Rhetorical structures (adapted from stop-slop, with scientific false positives)
"binary-contrast|external|--hidden -i|not (just )?[a-z]{1,30} but (also )?|isn[\x27’]t (the )?[a-z ]{1,40}[,.]+it[\x27’]s|\bis not [^.]{1,80}\. it is|it[\x27’]s not [^.]{1,80}\. it[\x27’]s|not because [^.]{1,60} but because|stops being [^.]{1,60} starts being|the (answer|question|problem|issue) isn[\x27’]t|Binary contrast — telegraphed pivot. State Y directly; keep only when the negation compares two real alternatives"
"false-agency|external|--hidden -i|the (data|results|evidence) (tells? us|demands|insists)|the decision (emerges?|was reached)|the analysis (decided|chose|concluded to)|the (culture|conversation) (shifts?|moves? toward)|a (complaint|bug|idea) (becomes|becomes a fix)|False agency — name the human actor. Note: 'data suggest', 'results show', 'model predicts' are licensed scientific register, keep them"
"vague-declarative|external|--hidden -i|the (implications|stakes|consequences) (are|is) (significant|high|real|profound)|this is (genuinely|really|fundamentally) hard|the reasons are structural|important implications for (practice|policy|research|theory)|Vague declarative — name the specific implication/stake; complete 'for whom, and what specifically'"
"emphasis-crutch|external|--hidden -i|full stop|let that sink in|make no mistake|this matters because|let me be clear|i[\x27’]ll say it again|the truth is,|it turns out|Emphasis crutch — manufactured weight with no proposition; delete. 'it turns out' is sometimes genuine math prose, judge"
"meta-commentary|external|--hidden -i|let me walk you through|let me (take|start|begin) (you|with)|as we[\x27’]ll (see|discuss|explore|show)|we[\x27’]ll see below|i want to (explore|argue|show|discuss)|the rest of this (essay|document|paper) (explains|will)|Meta-commentary — the text should move, not announce its structure"
"wh-opener|external|--hidden|^[Ww]hat (makes|is|does|can|if|we|I)|^[Ww]hy (does|is|should|do|are)|^[Hh]ow (does|do|can|should|are)|^[Ww]hat if|Wh- sentence opener — restructure to lead with subject or verb; teaching questions and genuine open research questions are exempt"
"adverb-crutch|external|--hidden -i|\b(truly|really|literally|genuinely|honestly|simply|actually|deeply|fundamentally|inherently|inevitably|interestingly|importantly|crucially|essentially|basically|particularly|remarkably|incredibly|extremely)\b|Empty adverb — replace with the number or mechanism, or delete. Scientific keeps: significantly, approximately, consistently, robustly, relatively (technical/statistical)"
"decision-passive|external|--hidden -i|it was (decided|agreed|concluded|determined) that|the decision was (made|reached|taken) to|it is (believed|assumed|claimed) that|Decision-hiding passive — name the actor. Methodological passive (was measured, were recruited, was trained) is registered convention, keep"
# ── Internal surfaces: code comments, notes, READMEs, agent artefacts, % comments in .tex
"dead-citations|internal|--hidden|\\(decision [0-9]|\\(audit [A-Z]?[0-9]|design §|plan §|spec §|§ ?[0-9]|the plan above|as (planned|outlined) (above|earlier)|per the (plan|outline|design doc)|Dead session citations — cite the committed owner by path, or delete and restate the fact"
"pr-vantage|internal|--hidden -i|this (PR|MR|patch|branch|stack|commit|diff)\\b|later (PR|commit)\b|previous commit|the diff above|as requested|per (your|the) request|you asked (me|for)|Branch vantage — state the shipped mechanism; move deferred work to a TODO or issue"
"change-narration|internal|--hidden -i|used to |no longer|previously|the old |was (renamed|moved|removed|replaced)|we (changed|renamed|moved|removed)|has been (updated|changed|refactored)|Change narration — state present behaviour; a fixed regression becomes a present-tense counterfactual"
"version-stamps|internal|--hidden -i|\\bthis cut\\b|\\bv1\\b|\\btoday\\b|\\bfor now\\b|\\bat (this time|present)\\b|\\bcurrently\\b|\\bgoing forward\\b|\\broadmap\\b|\\bfuture work\\b|Indexical stamps — go stale on merge; state the behaviour without the timestamp"
"review-choreography|internal|--hidden -i|rejected in review|review round|the reviewer said|as discussed|per our (discussion|conversation)|as we discussed|feedback from review|Review choreography — keep the decision and rationale, drop who said it when"
"self-justification|internal|--hidden -i|this is (correct|safe|fine) because|is safe (—|--) |it simply |note that this is (intentional|deliberate)|to be clear|worth noting that|Reviewer-addressed argument — state the invariant instead, or delete if the code shows it"
"narration|internal|--hidden -i|^[[:space:]]*(#|//|--|%|\\*|<!--)+[[:space:]]*(first|next|then|now|finally|after that|lastly|step [0-9])\\b|we (first|then) (call|check|compute|normalize|parse)|Control-flow narration — delete; do not compress into shorter narration"
"planning-residue|internal|--hidden -i|probably (fine|ok|okay|good)|should (be enough|suffice|work for)|might want to|we could (later|always)|\\bideally\\b|revisit (this|later)|good enough|leave (it|this) as is|Planning hedge — promote to TODO(name) or replace with the real bound and failure behaviour"
"chat-voice|internal|--hidden -i|\\blet me\\b|\\blet[\\x27’]s\\b|\\bi[\\x27’]ll\\b|\\bi will now\\b|\\bhere[\\x27’]s what\\b|great!|perfect!|absolutely right|as an AI|happy to help|hope (this|that) helps|Agent chat voice — zero propositions; delete"
"emoji|internal|--hidden|[✅❌🎉🚀✨🔥👍💡🎯🙌]|Status glyphs in committed prose — delete unless the emoji is data or rendered UI"
"register|internal|--hidden -i|it is (important|worth|crucial|essential) to note|it should be (noted|emphasi[sz]ed)|in order to\\b|\\bleverag(e|es|ing)\\b|\\butili[sz](e|es|ing)\\b|\\bfacilitat(e|es|ing)\\b|comprehensive|seamless|state-of-the-art|cutting-edge|this document (provides|describes|outlines)|in this section, we|Inflated register — name the actor and the operation; check domain terms before cutting"
"emphasis|internal|--hidden -i|^[[:space:]]*(critically|importantly|crucially),|\\bNOTE:|\\bIMPORTANT:|\\*\\*[A-Z][A-Z]+|Emphasis inflation — reserve emphasis for the clause that changes behaviour"
"status-annotations|internal|--hidden -i|\\b(implemented|done|completed)!|\\(future work\\)|TODO: *done|status: *(complete|done|implemented)|Status annotations rot — the layout, manifests, and issue tracker carry status"
"decorative-banner|internal|--hidden|//[[:space:]]*[-=*#]{4,}|#[[:space:]]*[-=*#]{4,}|;[[:space:]]*[-=*#]{4,}|%[[:space:]]*[-=*#]{4,}|\\*[[:space:]]*[-=*#]{4,}|^[[:space:]]*[=]{6,}|^[[:space:]]*-{6,}|Decorative separator banner — the file structure already shows the section; delete. Generation-provenance lines (\'generated by X\') are contracts, keep"
"process-comment|internal|--hidden -i|generated (by|with)|auto-?generated|written (by|with) (an? )?(ai|agent|assistant|claude|codex|gpt|model)|added by (the )?(ai|agent)|created by (the )?(ai|agent)|Process commentary — generation provenance (\'generated by X, edit the owner\') is a real contract, keep; authoring-session narration is slop, cut"
)

PHASE_BATTERY="phase-labels|internal|--hidden|\\bPhase [0-9IVX]+\\b|\\bP-[IVX]+\\b|\\b[TWP][0-9]\\b|Plan-phase labels — in a research repo most hits are timepoints, waves, or participant IDs; expect to reject nearly all"

PROTECT_BATTERY="PROTECT|all|--hidden -i|\\bmeasured\\b|\\bestimated\\b|\\bsimulated\\b|\\bpilot\\b|pre-?registered|\\bexploratory\\b|\\bconfirmatory\\b|post[- ]hoc|sensitivity analys|\\bseed\\b|\\bn ?= ?[0-9]|\\bp ?[<=>] ?[0-9.]|\\b(95|89|90|99) ?% ?(CI|credible)|\\bCI \\[|\\bd ?= ?[-0-9.]|\\bSD ?= ?[0-9.]|exclu(ded|sion)|underpowered|\\bassum(es|ption)|\\blimitation|doi:|arxiv|noqa|type: *ignore|pragma: *no cover|nolint|Provenance, statistics, calibration, limitations, and suppression markers — these must survive the trim. Cross-check before deleting anything on or near these lines"

if [ "${LIST:-0}" = 1 ]; then
  printf '%-24s %s\n' "BATTERY" "SURFACE"
  for b in "${BATTERIES[@]}"; do
    rest="${b#*|}"; printf '%-24s %s\n' "${b%%|*}" "${rest%%|*}"
  done
  printf '%-24s %s\n' "phase-labels" "internal (opt-in)"
  printf '%-24s %s\n' "PROTECT" "all (opt-in)"
  exit 0
fi

if [ ${#PATHS[@]} -eq 0 ]; then
  echo "error: no scope given. This skill requires an explicit scope — pass the paths to inspect." >&2
  echo "usage: scan.sh [--surface external|internal] [--protect] <path>..." >&2
  exit 2
fi

wanted() {
  local name="$1" surface="$2"
  if [ -n "$ONLY" ]; then
    case ",$ONLY," in *",$name,"*) return 0 ;; *) return 1 ;; esac
  fi
  [ "$SURFACE" = all ] && return 0
  [ "$surface" = "$SURFACE" ] && return 0
  [ "$surface" = all ] && return 0
  return 1
}

declare -a SUMMARY=()

run_battery() {
  local spec="$1"
  local name surface flags pattern note rest
  name="${spec%%|*}";     rest="${spec#*|}"
  surface="${rest%%|*}";  rest="${rest#*|}"
  flags="${rest%%|*}";    rest="${rest#*|}"
  note="${rest##*|}";     pattern="${rest%|*}"

  wanted "$name" "$surface" || return 0

  local hits count
  # shellcheck disable=SC2086  # deliberate word splitting on $flags
  hits="$(rg -n --no-messages $flags -e "$pattern" "${EXCLUDES[@]}" -- "${PATHS[@]}" 2>/dev/null)"
  count="$(printf '%s' "$hits" | grep -c . || true)"

  SUMMARY+=("$(printf '%6s  %-24s %s' "$count" "$name" "$surface")")

  [ "$COUNTS_ONLY" = 1 ] && return 0
  [ "$count" = 0 ] && return 0

  printf '\n\033[1m── %s (%s hits, %s)\033[0m\n' "$name" "$count" "$surface"
  printf '   %s\n\n' "$note"
  printf '%s\n' "$hits"
}

echo "Scope: ${PATHS[*]}   Surface: ${SURFACE}"
echo "Every hit needs semantic judgment. See references/manuscript.md, references/presentations.md, and references/taxonomy.md for the false-positive families."

for b in "${BATTERIES[@]}"; do run_battery "$b"; done
[ "$PHASE_LABELS" = 1 ] && run_battery "$PHASE_BATTERY"
[ "$PROTECT" = 1 ] && run_battery "$PROTECT_BATTERY"

printf '\n\033[1m── Summary\033[0m\n'
printf '%s\n' "${SUMMARY[@]}"
printf '\nA zero-hit battery proves nothing until you have seen it match.\n'
printf 'The densest prose in scope still needs an unpatterned read.\n'
