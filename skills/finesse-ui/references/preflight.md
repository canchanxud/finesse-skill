# Pre-Flight Check

Run before saying "done." Merges the substrate check, the cheapness scan, the spectacle verification, and the accessibility gates. Failing any **hard rule** is shipping broken work — fix before delivery. Soft rules are judgment calls; if you skip one, say why.

---

## A. Direction & Soul (hard)

- [ ] **Design Read** was committed (industry · soul · register · SPECTACLE · engine).
- [ ] **Anti-default named** — the lazy aesthetic for this brief was identified and beaten.
- [ ] **Rotation was read and stated** — `.finesse/log.json` (or a `/* finesse ·` CSS stamp) was read at §0, the rotation line was written out loud alongside the Design Read, and this build differs from the last on **≥3 of 5 axes** (`divergence.md` §4).
- [ ] **Build recorded** — the five-axis stamp is the first non-empty line of the CSS, and an entry was prepended to `.finesse/log.json` (trimmed to 20). *An unrecorded build is one the next run collides with.* Component-scope builds skip both by design.
- [ ] **One soul, one accent, locked** across every section. No drift, no second accent unless duotone-by-design.
- [ ] **Theme locked** — no warm-paper section inside a dark page (unless deliberate one-time switch).
- [ ] Page matches its **register** (brand = bold/spectacle; if it's really product-UI, finesse is the wrong tool).

## B. Premium Substrate (hard)

- [ ] **Grain** layer present (`opacity .02–.05`).
- [ ] **No pure `#fff`/`#000`**; neutrals tinted toward brand hue.
- [ ] **Translucent borders** only; no hard `#333` lines; shadows hue-tinted (not pure black on light bg).
- [ ] **Display type tension** — `clamp()` size, negative tracking, weight contrast against light body. Line-height **`.86–.95` for mixed case**; **`1.0` floor (`1.02–1.08` recommended) whenever `text-transform: uppercase` is on** — all-caps has no descenders, so tight leading collides cap-tops with the line above the moment the heading wraps, which on a phone it always does (`mobile-floor.md` M6).
- [ ] **Tokens hold to the end** — every colour and `font-family` in the artifact references a named token; no literal `#hex` / `oklch()` / `rgb()` outside the `:root` block. The colour lock is the decision; this is what enforces it 400 lines in.
- [ ] **Layered z-index** depth (engine · grain · vignette · content).

## C. Spectacle (hard if SPECTACLE ≥ 7)

- [ ] **Spectacle shown, not claimed** — a real working engine exists.
- [ ] **60fps on a mid-range device** (not the dev machine). Below 50fps → simplified.
- [ ] **Canvas DPR-adapted** (retina not blurry).
- [ ] **Progressive enhancement** — page is complete and readable with the engine removed.
- [ ] **`prefers-reduced-motion`** freezes the engine to a still frame / static hero.
- [ ] **Motivated motion** — every animation has a one-sentence reason. ≤1 marquee.

### Verifying spectacle — don't trust your own claim, prove it

A page that *claims* SPECTACLE 8 but ships a white hero is broken, not plain. Verify in two passes:

1. **Static (always):** run the detector — it greps for a real engine and the reduced-motion fallback, and fails on "claimed-not-shown":
   ```bash
   node skills/finesse-ui/scripts/detect.mjs --json <target>
   ```
   A `P0 spectacle-not-shown` or `P0 no-reduced-motion` in the output (`p0 > 0`) is a hard fail — fix before shipping. The script always exits 0 (findings live in the JSON); add `--strict` if you want it to block with a non-zero exit in a git hook / CI. If the script isn't present, fall back to the by-hand checks above — don't treat its absence as a pass.
2. **Runtime (when a browser is available):** the grep only proves the *code* exists, not that it *renders*. Open the page and confirm real pixels:
   - Use the Playwright MCP tools (`browser_navigate` → `browser_take_screenshot`) to load the page and screenshot the hero.
   - Confirm the engine drew something — **not** a white screen, not a flat background-color fill. If the hero is blank, the engine errored; check `browser_console_messages` for the throw.
   - Reload with reduced motion (emulate `prefers-reduced-motion: reduce`) and confirm a composed static frame still shows — never a blank or frozen-mid-animation hero.
   - If you cannot run a browser in this environment, say so explicitly and fall back to the static pass; don't silently claim runtime verification you didn't do.

## D. Layout Discipline (hard)

- [ ] **Hero fits the viewport** — headline ≤2 lines, subtext ≤20 words, CTA visible without scroll. Max 4 text elements.
- [ ] **Nav** single line, ≤80px tall.
- [ ] **Eyebrow count ≤ ceil(sections/3).**
- [ ] **≥4 layout families** on a long page; no family more than twice; ≤2 consecutive image+text zigzags.
- [ ] **Mobile collapse** declared per multi-column section. `min-h-dvh` over `100vh`.

### D.1 The mobile floor (hard) — test at 320 · 375 · 414 · 768

Not "narrow the window until it looks off" — those four widths. Causes and fixes: `mobile-floor.md`.

- [ ] **M1** — `overflow-x: clip` on **both** `html` and `body`. Not `hidden` (it creates a scroll container and kills every sticky/fixed descendant — the "I fixed the scroll and broke the nav" bug).
- [ ] **M2** — every grid track that can hold an image is `minmax(0, 1fr)`, not bare `1fr`; flex children that can hold one have `min-width: 0`.
- [ ] **M3** — no button, nav link, footer link, tab, breadcrumb, or CTA wraps to two lines at **any** width from 320 up. Shorten the label first.
- [ ] **M4** — display headings carry `overflow-wrap: anywhere; min-width: 0`.
- [ ] **M5** — exactly one sticky element at `top: 0`; every other sticky offset by `--nav-h`, with `--z-nav` above `--z-sticky`.
- [ ] **M6** — nothing has both `text-transform: uppercase` and `line-height < 1.0` (see §B).
- [ ] Ran `node skills/finesse-ui/scripts/detect.mjs --json <target>` — it catches M1/M2/M5/M6. **M3 and M4 it cannot see**; open the page at 320px and read it.

## E. Cheapness Scan (hard)

- [ ] No em-dashes in copy. No div-based fake screenshots. No gradient-text/glass/AI-purple as default.
- [ ] **No re-drawn environment chrome** — no hand-built browser bar (URL pill + traffic lights), phone bezel, IDE frame, or terminal window. Real screenshot in a `<figure>`, or no chrome at all. (Distinct from fake screenshots: a *real* screenshot inside a *drawn* MacBook bezel still fails.)
- [ ] No fake-precise numbers without a source. No banned beige+brass default palette.
- [ ] No identical card grids. No numbered `01·02·03` unless a real sequence.
- [ ] **Real imagery** where the brief implies it (food/hotel/fashion/travel/product); sourced per `asset-sourcing.md` (generate/stock/placeholder), not a silent gradient-blob substitute.
- [ ] Real SVG logos (not text wordmarks) on any "trusted by" wall.
- [ ] Fonts chosen with a reason — not a blind reach for Inter/Fraunces/Instrument Serif.

## F. Copy Self-Audit (hard)

- [ ] Re-read every visible string. No broken grammar, unclear referents, or AI-cute wordplay.
- [ ] One copy register per page. Quotes ≤3 lines with full attribution.
- [ ] One label per CTA intent across nav/hero/footer.

## G. Accessibility (hard)

- [ ] Contrast WCAG AA — body ≥4.5:1, large ≥3:1. Includes **buttons over photos** (scrim/stroke), placeholders, helper/error text, focus rings.
- [ ] Visible focus state on every interactive element; keyboard-reachable nav + CTAs.
- [ ] Button text fits one line at **every width from 320 up** — not just desktop, which is the width where the problem never happens (`mobile-floor.md` M3).
- [ ] Touch targets ≥44px. Form labels above inputs (never placeholder-as-label).

## H. Performance (soft)

- [ ] Animate only `transform`/`opacity`. `will-change` sparingly.
- [ ] Heavy engines lazy-loaded. Responsive images (WebP/AVIF, `srcset`). CLS < 0.1.

---

### The four ship-tests (from overdrive thinking)

1. **wow** — would someone who hasn't seen it react?
2. **removal** — if you delete the engine, is the experience clearly worse?
3. **device** — still smooth on a phone / Chromebook?
4. **context** — does this spectacle actually serve *this* brand and audience, or is it showing off?

If "removal" or "context" fails, the spectacle is decoration, not finesse. Cut or rework it.

---

## I. Strategic Omissions (soft — but separate a prototype from a real deliverable)

These don't affect visual output but are what get noticed after launch:

- [ ] **Custom 404 page** — a framework default is not acceptable for a brand page.
- [ ] **Legal links** (Privacy Policy, Terms of Service) in the footer — required for any real launch.
- [ ] **Skip-to-content link** (`<a href="#main" class="sr-only focus:not-sr-only">`) for keyboard users — satisfies WCAG 2.4.1.
- [ ] **"Back" navigation** — every page is reachable from at least one other page. No dead ends in user flows.
- [ ] **No placeholder data left** ("Jane Doe", lorem ipsum, `email@example.com`) in shipped output.
- [ ] **Form validation wired** — client-side on blur, errors state cause + fix ("Password needs 8+ chars", not "Invalid").

---

## J. Self-Grading Loop (run last, before saying "done")

Generate 5 sharp questions about your specific output, then answer each with concrete evidence from the code/copy you wrote — not a generic "yes." If any answer reveals a failure, fix it before shipping.

**Template — fill in with your actual output:**

1. **Engine check:** "Did I ship a working `[engine type]`, or is there a gradient blob/placeholder where the hero should be?" → [evidence]
2. **Soul check:** "Is the soul I picked (`[persona name]`) actually visible in the palette, typeface, and motion — or did I drift back to a generic aesthetic?" → [evidence]
3. **HARD BAN sweep:** "Does the copy contain any em-dashes? Are there any eyebrow labels on more than 1-in-3 sections? Any fake numbers?" → [evidence]
4. **Substrate check:** "Did I apply grain, type tension (negative tracking + weight contrast), and translucent borders to every section — or just the hero?" → [evidence]
5. **Dial honesty:** "Is the page I built actually `SPECTACLE=[n]` and `DENSITY=[n]`, or did I under-deliver on what I committed to?" → [evidence]

**A "yes" with no evidence = unverified = fail.** Re-read the output, quote the specific line or value that proves it.
