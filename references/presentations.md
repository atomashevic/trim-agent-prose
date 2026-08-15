# Slide decks, posters, talks, and speaker notes

External-facing materials where the audience is present — reading slides at speed, standing in
front of a poster, or listening without being able to re-read. The same register bloat appears,
but the medium changes the cost: a sandwich paragraph that a reviewer skims is one thing; a bullet
the audience reads while you are already talking about the next point is another.

Everything here assumes the rails in SKILL.md are in force. The two buckets, the never-change
list, and the preserve-every-proposition rule apply unchanged.

## Contents

- [The presentation rule](#the-presentation-rule)
- [Slide decks](#slide-decks)
- [Posters](#posters)
- [Talk scripts](#talk-scripts)
- [Speaker notes](#speaker-notes)
- [Blog and press prose](#blog-and-press-prose)
- [What must survive](#what-must-survive)

---

## The presentation rule

A slide, a poster block, or a talk sentence earns its place by adding something the audience
cannot get from the previous one. If it restates, it goes. This is stricter than the manuscript
rule, because a presentation has no table of contents the reader can skip — every redundancy is
experienced in sequence, in real time.

The flip side: a presentation is allowed — expected — to be *less* complete than a manuscript.
Omitting a caveat from a slide is not the same crime as omitting it from a paper, provided the
paper carries it and the speaker can answer. But the slide must not *contradict* the paper. A
claim stated more strongly on a slide than the results support is an overclaim on the most public
surface there is.

---

## Slide decks

**Structural tells.**

- **Slide title restating the bullet.** Title "We collected N=412 participants" with the first
  bullet "We collected 412 participants." The title is a heading, not a sentence — make it the
  takeaway, and let the bullet carry the number once.
- **"As shown above / below / in the previous slide."** The audience can see the deck. Reference a
  figure by what it shows ("Fig. 2: retention drops at 14 days"), not by its position.
- **"In this talk / in this presentation / in this slide."** Delete. The audience knows where they
  are.
- **Agenda and recap slides that promise or repeat more than they orient.** One agenda slide with
  three takeaway phrases is orientation; an agenda that is itself a wall of bullets, plus a recap
  slide per section, plus a "summary" slide, plus a "thank you / questions" slide, is padding.
- **Transition slides** ("Part II", "Results", a slide with only a heading). A deck needs some
  way-finding, but a slide whose entire content is a heading the next slide restates is a deck
  talking about itself.
- **"Thank you! Questions?" as a slide.** Keep it or cut it as a design choice — it is a slide,
  not prose — but never let it be the only place the conclusions appear.

**Bullet-level tells.**

- **Empty intensifiers**: "very", "extremely", "incredibly", "remarkably", "truly", "hugely".
  On a slide these are the loudest register tell because there is no surrounding prose to
  absorb them.
- **Fragment hedges that say nothing**: "may be somewhat important", "quite possibly relevant",
  "arguably novel". A slide hedge should either be the calibrated claim from the paper
  ("effect present in 3 of 4 cohorts") or absent.
- **Rule-of-three fragments**: "fast, robust, and scalable" where the talk demonstrates one of
  the three.
- **Bullet sentences that are actually paragraphs.** Six bullets of three lines each is a
  paragraph with bullet points. Split or cut; a slide supports roughly one idea per bullet.
- **"Notably", "Interestingly", "Importantly"** at the start of every bullet — the discourse
  chain from the manuscript, transplanted.

**False positives to keep.**

- **Figure and equation labels** ("Fig. 3", "Eq. 2") — these are cross-references, not position
  narration.
- **Consecutive-build labels** in decks that animate: "Step 1 → Step 2" on a build is structure,
  not narration.
- **"As shown in Table 1"** when the table is the point — position words that point at data are
  fine; position words that point at the deck ("as shown above") are not.

---

## Posters

A poster is a figure with captions, not a manuscript hung on a wall. Bloat on a poster is any
sentence that would also fit in the abstract.

**Cut.**

- The abstract, restated. A poster needs the title, the question, the key result, the method in
  one line, and the takeaway. Not the abstract.
- Paragraph blocks. A poster that needs a full paragraph to explain a result is usually a paper
  in disguise. Replace with a figure, a table, or a one-line claim.
- "Results and Discussion" and "Future work" sections with content that restates the figure
  captions.
- Acknowledgements and references at manuscript length — trim to the ones that must be on the
  wall (funding logo, the one or two key citations), not the full bibliography.

**Keep.**

- Every number that lands the result, with its statistic and error.
- Figure captions — these are the poster's prose and earn more words than slide bullets do.
- Methods detail that a reader needs to judge validity (sample, design, key exclusion) in one
  compact block.
- The "take-home" line. If the poster has none, that is a gap to fill, not a redundancy to cut.

---

## Talk scripts

A talk script is the one external surface where the prose is meant to be spoken. The bloat here
is the bloat of someone stalling for time.

**Cut.**

- **Throat-clearing openers**: "So, without further ado…", "I'm going to talk to you today
  about…", "As I'm sure you all know…", "Before I begin…".
- **Meta-transitions**: "moving on to the next point", "so that's the background", "and now I'd
  like to shift gears". A spoken transition can be as short as "Next, the model." The audience
  can see the slide change.
- **Self-narration**: "as I mentioned earlier", "I'll come back to this", "as I was saying".
- **Filler hedges**: "kind of", "sort of", "a little bit", "you know", "right?".
- **The recap spiral**: restating the result after every section and again at the end.

**Keep — spoken prose is not written prose.**

- **Pacing and emphasis words** that are read aloud: "the key point is…", "this is the number to
  remember". Spoken emphasis is legitimate where written emphasis inflation is not.
- **Repetition as a rhetorical device.** Repeating the takeaway three times across a talk is
  memory design, not bloat — *provided* each repetition is deliberate and the slide does not
  restate the sentence verbatim.
- **The throughline.** The connective sentence that ties the last slide to the next one ("that
  gap is what the next experiment closes") earns its place; a bare "moving on" does not.

---

## Speaker notes

Speaker notes are the presenter's private companion, so they are an **internal surface** attached
to an external artifact. Apply the internal rules (see
[taxonomy.md](taxonomy.md)) with these adjustments:

- **Timing and delivery cues survive**: "pause here", "build this slide", "if asked about X".
- **Chain-of-thought leakage is cut**: "Let me explain the result…", "I'll now walk through the
  figure", drafts of the same sentence written twice.
- **A note that says what the slide already says is bloat.** A note earns its place by adding the
  thing the slide cannot show: the answer to the likely question, the caveat to raise, the
  transition to the next slide.

---

## Blog and press prose

Public-facing prose written for a general reader. The manuscript register list applies, but the
fix is different: a paper says "we observed an association"; a blog post says "when X went up,
Y tended to go up too." Do not impose journal voice on outreach, and do not let outreach
voice leak into the manuscript.

**Cut.**

- Clickbait hedging that commits to nothing: "could potentially change everything", "may
  revolutionize".
- The LLM lexicon at full strength (see
  [manuscript.md](manuscript.md#llm-register-in-academic-prose)) — outreach is where "delve",
  "underscore", "in the ever-evolving landscape" proliferate.
- Serial signposting: "In this post, we will…", "As we've seen…", "In conclusion…".

**Keep.**

- Direct quotes — never edit inside them, including participant quotes.
- The concrete number over the adjective: "the model was correct on 82% of trials" beats "the
  model performed remarkably well".
- Author voice. Outreach is where an individual's voice most belongs; do not homogenize it.

---

## What must survive

The SKILL.md never-change list applies. On this surface the highest-risk mistakes are:

- **Strengthening a claim on a slide or poster** — the most public overclaim there is. A slide
  that drops "suggests" is worse than a manuscript that does, because the audience cannot check
  the results section.
- **Deleting a figure caption's statistic** while trimming its wording. Numbers, error bars,
  *p*-values, N stay.
- **Removing a credit or funding acknowledgement** from a poster or the final slide.
- **Editing a quoted participant statement** in a talk script or blog post.

If a slide, poster, or talk sentence contains a number, a citation, or a hedge about the evidence,
it is Bucket B — propose it, never apply it silently.
