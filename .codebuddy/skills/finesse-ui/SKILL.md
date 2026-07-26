---
name: finesse-ui
description: 'Build never-cheap, high-craft web interfaces — brand surfaces (landing pages, brand sites, launches, portfolios, hero pages with real WebGL/Three.js/Canvas/GSAP engines), product UI (dashboards, admin panels, analytics, data tables, app shells), workflow UI (merchant/admin consoles, publish & create wizards, config and settings pages, review queues), and commerce pages (product detail pages, listing/category pages, cart, checkout). Routes by register: brand → soul + spectacle engine; product → palette + component system + density (split further into pages you READ = dashboards, and pages you OPERATE = consoles/wizards); commerce → PDP/PLP skeletons + anti-dark-pattern rules. Ships a product color library (tinted neutral ramps + 16 accents + 12 paste-ready sets) so dashboards stop defaulting to blue. Always reads the brief first and audits against an anti-slop cheapness blacklist. Ships an anti-sameness layer (divergence) that composes a soul from five orthogonal axes instead of picking from a persona list, so repeat runs stop converging on one look. Routes single-element briefs to a component flow (8 mandatory states + a preview file) instead of the page apparatus. Carries a cross-run build log so rotation is enforced rather than narrated, and a mobile floor covering the six ways a crafted page breaks on a phone. Supports verb commands (audit · bolder · quieter · soul · diverge · animate · densify · redesign) for targeted iteration. Triggers on "make this look premium", "landing page", "personal site", "portfolio", "个人主页", "落地页", "lookbook", "dashboard", "admin panel", "商家后台", "工作台", "back-office", "console", "publish flow", "发布流程", "wizard", "settings page", "analytics UI", "data table", "app UI", "product page", "PDP", "listing page", "checkout", "dashboard colors", "give it a soul / a vibe", "anti-slop", "hero animation", "feels generic", "every page looks the same", "每次都差不多", "make me a button", "just this component", "按钮", "单个组件", "component states", "breaks on mobile", "手机端错位", "/finesse".'
version: 0.15.0
user-invocable: true
argument-hint: "[craft · audit · bolder|quieter|soul|diverge · animate|depth|densify · redesign · init|document] [target]"
license: MIT
---

# finesse — Technically Spectacular · Soul-Distinct · Never Cheap

> **finesse builds two kinds of interface and routes by register (§0):**
> - **brand** — design IS the product: landing pages, brand sites, launches, portfolios, hero pages. Optimize for **spectacle + soul + first impression** — a real visual engine, an opinionated personality.
> - **product** — design SERVES the product: dashboards, admin panels, analytics, data tables, app shells, settings. Optimize for **clarity + density + usability** — and still never cheap.
>
> The through-line is identical: **high craft, zero AI-slop.** What applies to **both** is the **universal craft floor** (tinted neutrals, no `#fff`/`#000`, translucent/hairline borders, tinted shadows, contrast floors), the cheapness blacklist (§6), and the pre-flight (§8). What **forks** is the *substrate above that floor* and the middle: **brand** lays the §3 brand substrate (`design-dna.md` — grain, vignette, display type) and reaches for a hero engine (§4); **product** lays its **own** substrate (`product-ui.md` §0 — surfaces, cards, KPI tiles, density) and reaches for a component system + data viz. A dashboard is a **different design language**, not a brand page with charts — it does **not** inherit grain / vignette / giant hero type / dark-default / a hero engine.
>
> Every rule below is **contextual**. Nothing fires automatically. Read the brief, set the register, then pull only what fits. A skill that produces the same page for every brief has failed.

---

## How to use this skill

0. **Check the scope before anything else.** If the brief is a **single element** — a button, an input, a card, a modal, a toast — go to `references/component-scope.md` and follow it instead; steps 1–6 below are page apparatus and are wrong for one component. Detection and the ambiguity question live in that file.
1. Run **§0 Brand Read** — read `.finesse/log.json` (the rotation memory, `divergence.md` §4), then infer **register** (brand vs product) + soul before touching code. Output the Design Read: the coordinate line, **a plain `You'll see:` line the user can actually veto**, its two most likely objections, and the rotation as a sentence (§0.B).
2. Set the **§1 Three Dials** (SOUL · SPECTACLE · DENSITY). Product register pins SPECTACLE low, DENSITY high.
3. **Lay the substrate — the right one for the register.** Both share the **universal craft floor** (tinted neutrals, no `#fff`/`#000`, translucent/hairline borders, tinted shadows, contrast floors — `references/design-dna.md` §1). Above that floor the substrate forks:
   - **brand** → the **§3 brand substrate** (`references/design-dna.md`): grain, vignette, `clamp()` display type, dark-default, layered hero depth.
   - **product** → the **product substrate** (`references/product-ui.md` §0): premium surfaces/cards, KPI tiles, floating panels, fixed type scale, feedback-only motion. **Never** pour grain / vignette / giant hero type / dark-default / a hero engine into a dashboard — that's brand grammar, not product grammar.
4. **Then the paths fork further:**
   - **brand** → pick a **§2 Soul** (`references/style-personas.md`) and build **one §4 Hero Engine** (`references/hero-engines.md`).
   - **product** → **pick a palette from `references/product-palettes.md` first** (the neutral ramp is 80% of the pixels; skipping this step is how every dashboard comes out blue). Then split by the page's job:
     - **pages you read** — dashboards, analytics, monitoring → `references/product-ui.md` (density, tables, charts, interaction states). **Before writing, open the closest dashboard in `examples/`** (index: `examples/EXAMPLES.md`) to see `product-ui.md` §0 applied in shipped code — lift patterns, not whole files.
     - **pages you operate** — publish/create wizards, merchant & admin consoles, config, settings, review queues → `references/workflow-ui.md` **on top of** `product-ui.md` (workflow shell, numbered sections, radio-card choices, live preview, pre-submit check, derived totals, draft/commit). There is **no form-workflow page in `examples/`** — build from the reference, and do **not** force-fit a dashboard example onto a form.
5. **Assemble the skeleton — again, the right one for the register.** **brand** → pick one of the four **§5 brand skeletons** (landing · portfolio · lookbook · studio) by what the page has to *do*. **product** → the skeleton is the **shell morphology** in `product-ui.md` §1 (sidebar · floating panel · bento · triptych …), **not** §5. Motion-motivated only, in both.
6. Run the **§6 Cheapness Blacklist** (`references/anti-cheap.md`), the **mobile floor** (`references/mobile-floor.md`), and **§8 Pre-Flight** (`references/preflight.md`) before shipping. Then **record the build** — append to `.finesse/log.json` and stamp the CSS (`divergence.md` §4.3). An unrecorded build is one the next run will collide with.

The `references/*.md` files are the deep material. Load the one you need for the current phase — do not inline all of them.

| Reference | When to load |
|-----------|-------------|
| `component-scope.md` | **Before the Brand Read, when the brief is one element, not a page** — a button, an input, a card, a modal. Routes to the component flow: keeps the register + craft floor + existing tokens, skips the skeleton / hero engine / rotation, and enforces the one gate that decides whether a component is well-made — **all eight states shipped**, plus a preview file that makes them visible instead of claimed |
| `divergence.md` | **At §0, before the Design Read — the anti-sameness layer.** Load it when output keeps converging, when the user says "feels generic / like every other AI site", or before *any* soul decision: the five-axis composition method (compose a soul, don't select one from a list), the anti-default two-altitude check, the die roll that breaks the model's argmax, and the assert-then-confirm direction proposal. **§4 is the memory** — `.finesse/log.json` + the CSS stamp, with a defined read step (§0) and write step (§8); without it "don't repeat" is a rule with nothing behind it. **Read its §0 register boundary first** — divergence is a goal for brand and a *bounded* tactic for product (never diverge on dashboard navigation conventions) |
| `design-dna.md` | Laying the **brand** substrate (grain, vignette, display type, color tokens, palette families). Product/dashboard inherits only its **universal craft floor** (§1: tinted neutrals, translucent borders, contrast floors) — the surfaces/cards/type/motion of a dashboard come from `product-ui.md` §0, not here |
| `theming.md` | Brief asks for a light/dark toggle or multiple swappable named themes — the token-role and hardcoded-color pitfalls of a runtime palette switch (not the single-locked-palette default) |
| `hero-engines.md` | Building the hero engine (brand register); also covers a secondary motion vocabulary (split-char reveal, magnetic buttons, curtain wipe, scan-line, per-card fly-in) for non-hero moments elsewhere on the page — the **decision** layer (which engine) |
| `page-crafting.md` | **The brand implementation layer** — what `chart-crafting.md` is to `dataviz.md`. Load it when you stop choosing and start writing: the **motion gate** (`REDUCE`/`FINE` probes + terminal states — universal, product too), canvas **DPR** + cyclic palettes + amplitude envelopes, `mask-image` photo dissolve, the **photographic-hero scrim stack**, container-query panels, nav **scroll-spy** over alternating sections, zero-dependency **sticky horizontal pin**, **exploded-view** scrub, colorway **pin+snap**, `clip-path` wipes, hand-written **FLIP** lightbox, **generative** (guillotine-split) layouts, CSS-only **geometric collage**, full-page engine + section scrims, and the Fibonacci→KNN→traversal 3D recipe |
| `mobile-floor.md` | **Any build that will be seen on a phone** — i.e. nearly all of them. The six mechanical causes of a broken phone layout, with the fix for each: `overflow-x: clip` vs `hidden` (and why `hidden` kills your sticky nav), `minmax(0,1fr)` on image-bearing grid tracks, clickable text that never wraps at *any* width, `overflow-wrap: anywhere` on display headings, one sticky at `top:0`, and the **all-caps `line-height` floor** that overrides §3's `.86–.95` for uppercase display type. `preflight.md` asks whether it breaks; this file says why it breaks |
| `3d-effects.md` | Adding a 3D moment — CSS tilt/flip/coverflow/depth-parallax or Three.js model/displacement |
| `style-personas.md` | Picking a soul (brand register) |
| `inspiration-catalog.md` | Persona picked but you want a wider menu of proven techniques for that soul, or the brief doesn't fit any of the 10 personas cleanly |
| `plain-words.md` | **Any time you are writing text the *user* reads** — the §0.B Design Read, `audit` findings, the memory-lock notice. finesse's whole vocabulary (`register`, `SPECTACLE`, `grain`, `scrim`, `eyebrow`, `hairline`) is load-bearing internally and opaque externally, and it leaks out at exactly the moments the user is supposed to make a decision. One-clause observable glosses, plus the list of internal terms (five-axis coordinates, axis letters, reference filenames) that must **never** reach a user |
| `anti-cheap.md` | Before any delivery — cheapness scan |
| `product-ui.md` | Dashboard / admin / data app — pages you **read** (product register) |
| `workflow-ui.md` | Pages you **operate** (product register): publish/create wizards, merchant & admin consoles, config, settings, review queues — the workflow shell, numbered section cards, radio-card choices, live-preview aside, pre-submit check, derived budget panels, draft/commit |
| `product-palettes.md` | **Any product-register page** — the color layer `design-dna.md` §6 doesn't cover: 5 tinted neutral ramps, 16 accents with light/dark + text-on-accent contrast, 12 paste-ready sets, the known-SaaS palettes (Linear/Stripe/Supabase/Grafana…). Load it **before** picking a color, or you will reach for blue |
| `examples/EXAMPLES.md` | The positive-reference corpus — real shipped pages (5 brand + 4 dashboards) with a per-file "what to study" table. **Open the closest one before building**, especially for dashboards (lift patterns, not whole files) |
| `dataviz.md` | Chart-heavy product UI beyond the starter table — full 25-type selection matrix, a11y grade + mandatory fallback, library picks (the **decision** layer) |
| `chart-crafting.md` | **Any** hand-built dashboard chart in a single self-contained file (mandatory for bars — the barcode-chart trap) — the no-library **implementation** layer: the value→height rule, `div height:value/max%` bar recipe, SVG coordinate normalization, line/area draw-in, donut/gauge grow, stacked bars, sparklines, the three animations × reduced-motion pairing, slider-driven live update |
| `commerce-ui.md` | Product detail page (PDP), listing/category page (PLP), cart, checkout — commerce register |
| `asset-sourcing.md` | Brief implies real imagery but no assets provided — generate vs. real stock vs. placeholder fallback, with the authorization step for each |
| `preflight.md` | Final checklist before saying "done" |
| `design-model.md` | Multi-page projects — token consistency |
| `redesign-mode.md` | Upgrading an existing page — audit-first protocol |
| `audit.md` | Read-only diagnostic — cheapness + spectacle + preflight scan |
| `init.md` | New project — write `PRODUCT.md` (the persistent brief) |
| `document.md` | Existing codebase — extract `design-model.yaml` from real code |

---

## Commands

finesse runs as a full build by default, but supports **verb commands** for targeted iteration on an existing page — so you don't re-run the whole Brand Read for a single complaint. Each command loads one reference and does one job.

| Command | Category | Does | Reference |
|---------|----------|------|-----------|
| `craft [brief]` | Build | The full flow: Brand Read → Dials → substrate → engine → assemble (the default) | all |
| `init` | Setup | New project: write `PRODUCT.md` (register, soul, locked dials, anti-references) — the brief every later task reads | `init.md` |
| `document` | Setup | Existing codebase: extract the built design system into `design-model.yaml`; report drift | `document.md` |
| `audit [target]` | Evaluate | **Read-only** diagnostic: run the cheapness blacklist + spectacle-shown + pre-flight, output a findings list. **Changes nothing.** | `audit.md` |
| `bolder [target]` | Refine | Raise SPECTACLE +2, upgrade the engine (e.g. Canvas → Three.js) | `hero-engines.md` |
| `quieter [target]` | Refine | Lower SPECTACLE −2, step down to GSAP / CSS-only; calm an overloaded page | `hero-engines.md` |
| `soul [target]` | Refine | Re-pick the persona / soul when **this page** is the wrong vibe | `style-personas.md` |
| `diverge [target]` | Refine | **Every page comes out the same.** The systemic fix, not the per-page one: recompose the soul from the five orthogonal axes, run the two-altitude anti-default check, roll against the model's argmax, and check the used-list. Use when the user says "feels generic / like every other AI site / 每次都差不多" | `divergence.md` |
| `animate [target]` | Enhance | Add or swap the hero engine in isolation; motion only | `hero-engines.md` |
| `depth [target]` | Enhance | Add **one** 3D moment — CSS pseudo-3D (tilt · flip · coverflow · depth-parallax) or Three.js (model viewer · image displacement) | `3d-effects.md` |
| `densify [target]` | Enhance | Adjust DENSITY ± — add/remove content, tune information-per-viewport | `product-ui.md` |
| `redesign [target]` | Iterate | Upgrade an existing page, audit-first; never full-rebuild for one complaint | `redesign-mode.md` |

### Routing rules

1. **First word matches a command** → load that command's reference and follow it. Everything after the command name is the target. Lay the **§3 substrate** and run the relevant **§6/§8 checks**, but skip the parts of §0–§5 that don't apply to that single action (e.g. `quieter` doesn't re-pick a soul).
2. **First word doesn't match, but intent clearly maps to one command** ("too plain / boring" → `bolder`; "too flashy" → `quieter`; "wrong vibe *for this page*" → `soul`; "**feels generic / every page looks the same / 每次都差不多**" → `diverge`; "make it pop" → `animate`; "add depth / make it 3D / tilt / parallax" → `depth`; "too sparse / too dense" → `densify`; "improve / fix this page" → `redesign`) → route to that command and proceed as if invoked. If two fit, ask once which.
3. **No argument at all** (bare `/finesse`) → the user is asking *"what should I do here?"* Don't dump the static menu. Read a few cheap signals and **lead with the 2-3 highest-value commands**, each with a one-line reason, then offer the full table as fallback. Never auto-run — recommend, the user confirms. Signal → pick:
   - **no `PRODUCT.md`** and there's real code/pages → lead with `document` (capture what's built) and/or `init` (write the brief). Brand-new empty project → `init` then `craft`.
   - **`PRODUCT.md` exists, has built pages, never audited** → lead with `audit <surface>` (read-only health check).
   - **git working tree points at one page/file** → scope `audit` or `redesign` to those files, naming them.
   - **a recent `audit` found P0/P1** → lead with `redesign` (fix the backlog) or the specific refine verb the findings point to (gradient-text/eyebrows → `quieter`/`soul`; flat motion → `animate`).
   - **nothing built yet, clear brief** → `craft`.
   Keep it to 2-3 pointed picks with the exact command to type. The menu is the fallback, not the lede.
4. **A target but no command, building something new** → **check the scope first.** If the brief names a *single element* (a button, an input, a card, a modal), route to `references/component-scope.md` — the page flow's skeleton, engine, and rotation are all wrong for one component, and the thing that actually decides its quality (all eight states shipped) isn't checked anywhere in the page flow. Otherwise run the full `craft` flow (§0 → §8) — the default for "build me a landing page / dashboard".
5. **`audit` is read-only.** It only reports findings; it never edits code. Every other command is allowed to modify the target.

> Auto-trigger is unchanged: finesse still activates from natural language via its `description`. Commands are an **added** precision entry-point (`/finesse quieter page.html`), not a replacement — both routes lead to the same references.

After any command that modified the page, run the relevant **§8 Pre-Flight** gates before declaring done.

---

## 0. BRAND READ (Before Anything Else)

Most AI design output is bad because the model jumps to a default aesthetic instead of reading the brief. Don't.

### 0.A Determine the Register (this forks every later decision)

- **brand** — design IS the product: landing page, brand site, launch, portfolio, campaign, hero page. Be bold, opinionated, spectacular. Goes the soul + hero-engine route (§2, §4).
- **product** — design SERVES the product: dashboard, admin, analytics, data table, app shell, settings, tool. Optimize for clarity, density, usability. Goes the component-system route (`references/product-ui.md`). Still never cheap — it inherits the **universal craft floor** (§3's last three bullets) + the cheapness blacklist (§6), and builds on the **product substrate** (`product-ui.md` §0), **not** the brand substrate's grain/vignette/hero-type/dark-default.
  - **Split it once more by the page's job — read vs. operate.** A dashboard you *read* fails by being unreadable; a console you *operate* fails by being **unfinishable** (abandoned at step 3, or submitted wrong). If the primary action is a **consequential commit** (发布 / 上线 / 提交 / 保存配置) — a merchant publishing a campaign, an admin configuring a rule, a long form that produces a real thing — it's a **workflow page**: load `references/workflow-ui.md` on top of `product-ui.md`. Login forms and search filters don't count; `product-ui.md` §4 covers those.
  - **Color is not optional here.** Pick from `references/product-palettes.md` before writing CSS. "Dashboard" predicts blue; the *product* predicts a color.
- **commerce** — a third, hybrid case: product detail pages (PDP), category/listing pages (PLP), cart, checkout. It doesn't cleanly fit either bucket above, so don't force it — route by which job the specific page is doing:
  - A **PDP selling one hero item** (a single SKU, a launch, a flagship product) leans **brand**: pick a soul (§2), but keep DENSITY up for specs/reviews/trust signals — see `references/commerce-ui.md` for the PDP skeleton.
  - A **PLP / marketplace with many SKUs** (filters, sort, grid of many products) leans **product**: DENSITY high, SPECTACLE low, same as a dashboard — see `references/product-ui.md` for grid/filter patterns plus `references/commerce-ui.md` for commerce-specific rules (price/CTA placement, cart, checkout, dark-pattern bans).
  - When unsure which it is, ask: *"is this page trying to sell the vibe of one product, or help someone compare/filter many?"*

**Read project memory first — all three files, they answer different questions.**

| File | Answers | Written by |
|---|---|---|
| `PRODUCT.md` | *What must stay the same?* — register, users, brand personality, locked dials, anti-references. **Overrides your guesses.** | `init` |
| `design-model.yaml` | *What is already built?* — locked palette / type / substrate, so this page matches its siblings. | `document` |
| `.finesse/log.json` | *What must change?* — the last 20 builds' five-axis coordinates. The rotation memory. | every completed build (§8) |

The first two lock **consistency**; the third forces **difference**. They are opposite goals and deliberately live in separate files — see `divergence.md` §4. If `.finesse/log.json` is absent, grep the codebase for a `/* finesse ·` CSS stamp and infer one entry from it; if neither exists, this is the first run and there is no rotation constraint.

- **No `PRODUCT.md`, multi-page or repeat project, thin brief** → offer to run `init` first (one `PRODUCT.md` keeps every later page consistent). Don't force it on a one-off page.
- **Existing codebase, no `design-model.yaml`** → offer `document` to capture what's there before adding to it.
- If memory exists but the new request contradicts it, surface the conflict — don't silently override the lock.

### 0.B Output a "Design Read" before generating — assert a direction, don't poll for one

Name the rejected default **first** (§0.D), then the direction — then **say what the page will look like in words the user can picture**, and give them two concrete ways to object:

```
Lazy default (rejected): {the obvious aesthetic for this category}
Design Read: {industry} · {soul in 2-3 words} · register={brand|product} · SPECTACLE={n} ·
             layout={dominant layout family} · engine={type}
You'll see: {what appears on screen, in plain observable terms — color, motion, type size, structure}
Not right? Most likely one of these: ① {the most probable objection} ② {the second}
Rotation: {plain sentence — which recent direction this deliberately avoids}
```

Example:
```
Lazy default (rejected): dark page, violet glow, floating 3D render, three feature cards.
Design Read: deep-space astronomy · cinematic + reverent · register=brand · SPECTACLE=8 ·
             layout=full-page engine + scrimmed sections · engine=Three.js particle galaxy
You'll see: a near-black page with slow-drifting star dust behind everything, a very large
            headline sitting on top of it, and the galaxy rotating as you scroll.
Not right? Most likely one of these: ① you don't want a moving background
            ② near-black is too heavy and you want this light.
Rotation: deliberately steering clear of the last three builds (machined metal / paper press /
          phosphor terminal) — this one is water and drift.
```

**`You'll see:` is the line the user actually answers.** The `Design Read:` line is a coordinate for *you* — `SPECTACLE=8`, `scrimmed sections`, and `Three.js particle galaxy` are three things a non-designer cannot picture, cannot rank, and therefore cannot veto. A gate only one answer can pass is not a gate. Write what renders: color, whether anything moves, how big the type is, what the structure is. No jargon — `references/plain-words.md` if a term is unavoidable.

**`Not right?` must name real forks, not invite open-ended feedback.** "Let me know what you think" returns nothing. Two specific, likely, *mutually different* objections give the user something to point at, and each one has to be a thing you would genuinely build differently — usually the theme and the motion, since those are the two decisions the whole page hangs off.

**The rotation line is not optional, and it is not decoration.** Rotation you perform in your head is indistinguishable — afterwards, to you and to the user — from rotation you merely narrated. Writing it down before any code exists is what makes a bad rotation catchable while it's still free to fix. **Write it as a sentence, not as axis letters:** `differs on E + C + A (3/5 ✓)` is unfalsifiable *to the user* — they can't tell what E is, so they can't object that they actually wanted machined metal. The five-axis coordinates still get recorded, in `.finesse/log.json` and the CSS stamp (§8.0), which is where an audit reads them from. Threshold and format: `divergence.md` §4.4. Omit the line only on the first build of a project (no log, no stamp) — and say that's why.

**STOP after the Design Read. Do not generate any code yet.** Wait for confirmation or redirect.

**Assert, don't poll.** State the direction you're going and invite a veto. Do **not** hand the user a three-option menu of adjectives — *nobody can choose a design from words they can't see*, so they'll pick the first one and you'll have learned nothing. A menu is theater when the answer is already clear. Note that `You'll see:` + `Not right?` is **not** a menu: it asserts one direction and pre-names its two most likely failure modes, which is what makes the veto usable instead of ceremonial.

> **When the user can't evaluate the assertion at all, that's Mode 2.** If the brief carried no directional information — only undirected praise-words ("好看", "高级", "有质感", "premium", "clean"), or an explicit "I can't really say" — then `You'll see:` will get a rubber-stamp no matter how plainly it's written, because the user has no basis for comparison. Build three real variants instead (`divergence.md` §7 Mode 2 + the squint test). Undirected adjectives are as strong a fork signal as a genuinely ambiguous brief.

**The exception — when the brief genuinely forks** (a "premium" brand that could be austere-Nordic *or* maximal-baroque; a personal site that could be a portfolio *or* a manifesto): don't describe the options, **build them**. Three low-fidelity but *real*, screenshot-able pages, each moving on a **different axis**, then let the user look. See `references/divergence.md` §7 — including the **squint test** that stops the three variants from collapsing into one.

> If output keeps coming out samey across projects, the fix is not a better adjective in this line — it's `references/divergence.md` (compose the soul from five axes instead of picking from a list; roll a die to break the model's default; keep a used-list so "don't repeat" can actually fire).

### 0.C If the brief is ambiguous, ask ONE question — do not guess blind

One sharp question beats five rounds of wrong defaults. Ask the thing that most changes the output: *"Is this meant to feel restrained-editorial or maximal-spectacle?"* / *"What should a visitor remember 10 seconds after leaving?"* Then commit. **Wait for the answer before proceeding.**

### 0.C.1 Say it in words the user can act on

finesse's vocabulary is internal. `register`, `SPECTACLE`, `grain`, `scrim`, `eyebrow`, `hairline`, `layout family` all earn their place in the reasoning and none of them are answerable by the person reading. They leak out in exactly three places, and all three are places where the user is supposed to decide something:

| Where | What breaks without a gloss |
|---|---|
| §0.B Design Read | the confirmation gate — he can only say "go ahead" |
| `audit` findings | he can't tell which finding to fix first |
| the memory-lock notice (`init.md`) | he doesn't know what got locked, or how to unlock it |

**The rule: first time a term appears in user-facing text, follow it with a one-clause gloss in observable terms; after that use it bare.** Table of glosses, plus the internal terms that must never reach a user at all: `references/plain-words.md`. This applies to output only — reason in whatever vocabulary you like.

### 0.D Anti-Default Discipline

Name the lazy default for this brief, then beat it. "Coffee brand → the default is warm-beige + brass serif. I'm rejecting that for {x}." The single most-tested AI tell is reaching for the obvious aesthetic of the category. (Reflex-reject lists live in `references/anti-cheap.md`.)

### 0.E Quick-Start Dial Mapping

If the brief contains these cues, use these presets as a starting point before refining in §1:

| User says | SOUL | SPECTACLE | DENSITY |
|-----------|------|-----------|---------|
| "premium", "luxury", "high-end" | 8 | 5 | 3 |
| "minimal", "clean", "understated" | 6 | 3 | 3 |
| "bold", "striking", "impactful" | 7 | 7 | 4 |
| "editorial", "magazine", "publication" | 8 | 4 | 6 |
| "tech", "AI", "SaaS" marketing | 6 | 7 | 5 |
| "corporate", "B2B", "enterprise" | 4 | 3 | 6 |
| "playful", "vibrant", "creative" | 7 | 6 | 5 |
| "data-heavy", "dashboard", "analytics" | 4 | 2 | 9 |
| "商家后台", "工作台", "admin console", "back-office" | 5 | 2 | 7 |
| "发布/创建流程", "wizard", "publish flow", "配置", "settings" | 4 | 1 | 7 |
| "landing page" (no other cues) | 7 | 6 | 4 |
| "portfolio" | 8 | 6 | 3 |
| "product page", "PDP", "product detail" | 6 | 4 | 6 |
| "商品列表", "PLP", "category page", "marketplace" | 3 | 2 | 8 |

Override these immediately if the brief provides stronger or contradicting signals.

---

## 1. THE THREE DIALS

Set these explicitly from the Design Read. They drive everything downstream.

| Dial | 1–3 | 4–6 | 7–10 |
|------|-----|-----|------|
| **SOUL** — how opinionated / branded the personality is | neutral, safe, system-default | a clear vibe | unmistakable, one-of-a-kind identity |
| **SPECTACLE** — how technically-ambitious the visual engine is *(finesse's signature dial)* | static + CSS only | GSAP scroll, Canvas 2D accents | Three.js / GLSL / WebGL-FBO hero, generative, scroll-pinned cinema |
| **DENSITY** — information per viewport | airy, one idea per screen | balanced | editorial, data-rich |

### 1.A Dial inference (Design Read → values)

- Astronomy / music / game / crypto / fashion-tech → **SPECTACLE 7–10** (the genre rewards a real engine).
- Law / finance / healthcare / B2B SaaS marketing → **SPECTACLE 3–5** (craft over fireworks; one restrained motion moment).
- Heritage / luxury / editorial / publication → **SOUL 8–10, SPECTACLE 4–6** (the type and substrate carry it, not WebGL).
- **Any product register** (dashboard / admin / analytics / app) → **SPECTACLE 1–4, DENSITY 6–9** — clarity beats fireworks. Skip §2/§4 and go to `references/product-ui.md`.

### 1.B "Spectacle claimed, spectacle shown" (mandatory)

If `SPECTACLE ≥ 7`, the page MUST actually contain a working visual engine (a real Three.js/Canvas/GLSL/scroll-pinned moment), degrade gracefully, and hold 60fps on a mid-range device. A page that claims SPECTACLE 8 but ships a gradient blob is **broken**. If you cannot ship working spectacle in scope, drop the dial to 4 and ship an impeccably-crafted static page instead. Never half-build an engine that janks or cuts off.

---

## 2. PICK A SOUL (Industry → Persona) · brand register

> **Product register:** soul still matters (brand accent, one type system, the substrate), but skip the spectacle personas below — go to `references/product-ui.md`. The rest of §2 and §4 are for **brand**.

finesse's job is **soul diversity**: the same method must yield visually unrelated pages for different briefs.

> **Compose the soul — don't select it from a list.** A closed table of ten personas yields ten pages; a model picking from ten options lands on the same two or three every time, weighted by what it has seen most. `references/divergence.md` §3 gives the fix: draw one value each on **five orthogonal axes** — palette structure · type relationship · dominant layout family · engine · material/metaphor — and let the *combination* be the soul. Five axes with a handful of values each is thousands of combinations, not ten. **The persona table below is the set of combinations already validated — calibration, not the ballot.**

Reach into `references/style-personas.md` for the industry→persona map (palette family, type pairing, hero-engine fit, signature effect). Examples of the *range* you must be able to hit:

- **Cinematic tech** (cyan/magenta, Inter + JetBrains Mono, Three.js particles) — astronomy, AI, crypto.
- **Phosphor terminal** (single neon-green, mono-forward, Canvas data viz) — quant/fintech, security.
- **Editorial publication** (cream/ink, Playfair + Spectral, GSAP scroll-reveal, grayscale photography) — magazines, film, journals.
- **Warm heritage** (amber/copper/ember, Fraunces/EB Garamond, Canvas fire/particles) — whisky, coffee, craft.
- **Brutal typographic** (bone/black + one hot accent, Anton/Bebas, mix-blend-mode) — fashion week, music, culture.
- **Quiet luxury minimal** (off-white/forest, Raleway 100–900, CSS-only mask/parallax) — architecture, hotels, fragrance.

Rules:
- **One soul per page.** Don't fluctuate warm and cool greys, or swap accent colors mid-scroll. Lock it (see §3, color lock).
- **Rotate, don't repeat — and make it *executable*.** "Don't reuse the last brief's lane" is a rule you **cannot follow from memory: you have none across sessions.** It has never once fired. Give it teeth: keep the used-list in `references/divergence.md` §4 (a table of the last N builds' axis coordinates), **read it before you draw**, and require the new page to differ on **≥3 of the 5 axes**. Saturated lanes (editorial-typographic, beige-brass craft, AI-purple-glow) are banned as *defaults* — earn them or avoid them (`references/anti-cheap.md`).
- **Break the tie with a die, not with willpower.** When two directions are equally defensible, the model will silently take the one it has seen most. Roll for it (`divergence.md` §6) — and if you override the roll, write down why. An unexamined default is the whole disease.

> Once a persona is picked, `references/inspiration-catalog.md` has a wider bench of real pages per persona (48 beyond the 5 in `examples/`) — technique notes, not files, for when you want a second reference point beyond the persona table's single description.

---

## 3. THE PREMIUM SUBSTRATE (Why It Reads as Expensive)

The difference between a cheap page and an expensive one is mostly a thin physical layer, applied consistently. Full recipes and exact values in `references/design-dna.md`. The non-negotiables below are the **brand** substrate.

> **Register note.** The last three bullets — **translucent borders**, **no pure `#fff`/`#000`**, **color lock** — are the *universal craft floor*: they hold for **product/dashboard** too. The first four — **grain, vignette, `clamp()` type tension, layered hero z-index** — are **brand-only**; a dashboard replaces them with the product substrate in `references/product-ui.md` §0 (premium surfaces/cards, KPI tiles, fixed type scale, feedback motion). Don't apply brand grain/vignette/giant-type to a dashboard.

- **Grain** — a fixed SVG `feTurbulence` noise layer at `opacity .025–.05`. Static, but kills the flat "vector slop" look. (Light pages too, lower opacity.)
- **Vignette** — a radial-gradient darken on dark heroes to create an optical focal point.
- **Type tension** — display headings at `clamp()` with **negative tracking** (`-.02 to -.045em`) and `line-height .86–.95`; extreme weight contrast against a light body (e.g. 900 against 300). Tight, large, confident.
  - **Conditional — all-caps display is the exception, and it is not a rare one.** `.86–.95` is correct for **mixed case**, where descenders (g, y, p) hold consecutive lines apart. All-caps has no descenders: cap-tops sit at the top of the line box, so at `.86` the caps of line 2 collide with the baseline and commas of line 1 and the two lines fuse into one band of ink. On a wide screen the headline sits on one line and you never see it; **on a phone it wraps and the collision is guaranteed.** This hits the brutal-typographic souls in §2 (Anton, Bebas) hardest — condensed faces have the tallest caps relative to their em box. So: whenever `text-transform: uppercase` is on display type, the `line-height` **floor is `1.0`, recommended `1.02–1.08`**. Raise the leading or drop the uppercase — one or the other, not a compromise at `.98`. Full reasoning: `references/mobile-floor.md` M6.
- **Layered z-index** — engine(0) · grain(1) · vignette · content(5). Depth, not flatness.
- **Translucent borders** — `rgba(255,255,255,.07–.22)` on dark, `rgba(0,0,0,.06–.08)` on light. Never a hard `#333` line.
- **No pure `#fff` / `#000`.** Tint every neutral a few points toward the brand hue.
- **Color lock (mandatory):** once an accent is chosen, it owns the whole page. No surprise teal badge on a rose page. Audit every component before shipping. If the brief actually asks for a swappable/multi-theme experience instead of one locked palette, see `references/theming.md` — the token-role and hardcoded-color pitfalls there are different from a single-palette build.

> Internally reason in **OKLCH** for palettes (perceptual consistency, easy light/dark pairing), even if you emit hex. Design light and dark together; test contrast in each — never just invert.

---

## 4. THE HERO ENGINE (finesse's Differentiator) · brand register

> **Product register:** no hero engine — reach for a data-viz + component system instead (`references/product-ui.md`). This section is for **brand**.

A finesse page earns its name with **one** technically-spectacular moment — usually the hero. Not five. One, done at 100%. Pick the engine that fits the soul; full mount/render/scroll skeletons + reduced-motion fallbacks live in `references/hero-engines.md`.

| Engine | Use when | Cost |
|--------|----------|------|
| **Three.js + GLSL** | 3D depth, particle systems (galaxies, networks, DNA), metaballs, bloom | heavy; lazy-load `three`, gate on SPECTACLE ≥ 7 |
| **Canvas 2D** | particles, fields, real-time data (K-lines, waveforms, fire), flow | light; DPR-adapt for retina |
| **WebGL FBO shader** | fluid (Navier-Stokes), reaction-diffusion, ray-marching, iridescence | heavy; one fullscreen quad, multi-pass |
| **GSAP ScrollTrigger** | scroll-pinned story, horizontal pan, parallax, reveal stagger | medium; the single most reusable engine |
| **CSS-only** | dual-layer mask, 3D transforms, variable-font morph, scroll-driven `animation-timeline` | free; no JS, best perf |

> **Component-level 3D ≠ hero engine.** The table above is for the one full-bleed hero moment. For *reusable, in-page* 3D — pointer-tilt cards, flip cards, coverflow, depth-parallax layers, or a Three.js product/model viewer — reach for `references/3d-effects.md` (the `depth` command). Default to its CSS tier; it ships in any page at zero cost and rarely janks. One 3D moment per page still applies: don't stack a hero engine *and* a tilt grid *and* a coverflow.

**Engine discipline (mandatory):**
- **Progressive enhancement.** The page must be readable and complete with the engine removed. The engine is a fixed background or a hero accent, never load-bearing for content.
- **60fps or simplify.** Animate only `transform` / `opacity`. Test on a mid-range device, not your machine. Below ~50fps, cut particle count or resolution.
- **`prefers-reduced-motion` is mandatory** — freeze the engine to a still frame (or hide it and show a composed static hero). Never ship motion with no fallback.
- **Motivated motion only.** Every ScrollTrigger / marquee / pinned section needs a one-sentence reason (hierarchy, storytelling, feedback, state). "It looked cool" is not a reason. Max **one** marquee per page.

---

## 5. PAGE SKELETON — four brand skeletons, not one

> **A single canonical sequence is itself a source of sameness.** If every brand page is `HERO → MARQUEE → MANIFESTO → GRID → CTA → FOOTER`, then every brand page *is* the same page, no matter how well the colors were chosen. A landing page argues; a portfolio proves; a lookbook seduces; a studio site demonstrates. **Those are four different arguments, so they are four different structures.** Pick by what the page has to *do*, then diverge inside it (`references/divergence.md` §3, axis C).

### 5.A Landing / launch — *a thing exists, and it must be understood*

```
HERO (the engine moment)  →  SPEC BAND (4-col hairline, real numbers)  →
THE ARGUMENT (exploded view · demo · full-page engine — SHOW the thing working)  →
ASYMMETRIC PRODUCT GRID (1.4fr 1fr — never 4 identical cards)  →
TECH / DEPTH (dark-panel inversion, numbered only if the numbering means something)  →
CTA (oversized)  →  FOOTER
```
The load-bearing section is **the argument** — an exploded-view scrub, a live console, a working demo (`page-crafting.md` §5.B). A landing page that only *asserts* quality and never *shows* it is a brochure. If the product is physical or layered, take it apart on scroll.

### 5.B Portfolio / personal — *the work is the argument; you are not*

```
INTRO (a full-bleed image or a statement — not a headshot-and-tagline)  →
THE WORK (filmstrip accordion · generative grid · list-rows with thumbnails)  →
MANIFESTO (one statement, one column)  →  CAPABILITIES (list, not cards)  →
SELECTED DETAIL (one project, deep)  →  CONTACT (oversized type)  →  FOOTER
```
Rules that are specific to a personal site, and that AI gets wrong every time:
- **The work comes before the words.** An "About me" section above the first project is a résumé, not a portfolio.
- **A grid of 6 identical project cards is the failure mode.** Reach for a **list with rows** (`64px 1fr auto 90px` + a small thumbnail), a **hover-expand filmstrip** (`page-crafting.md` §3), or a **generative split grid** (§8). The layout should already say what kind of designer you are.
- **No "skills" bar charts.** A percentage on "creativity" is the single cheapest thing a personal page can contain.
- **One project shown deeply beats six shown shallowly.**

### 5.C Lookbook / collection — *the mood is the product*

```
HERO (split: type | image, ragged)  →  BRAND STATEMENT (dark inversion, one quote, 100vh)  →
HORIZONTAL LOOKBOOK (pinned track, ragged heights, bottom-aligned)  →
MATERIALS (clip-path wipe cards)  →  COLLECTION (gap:2px grid — a spread, not a card wall)  →
ATELIER (1fr 1fr, image + CTA)  →  FOOTER
```
Light/dark alternation is the structure here, which forces a **nav that adapts to what's under it** (`page-crafting.md` §4 — scroll-spy, not `mix-blend-mode`). Density comes from *rhythm* (ragged heights, tight gutters), not from adding sections. Hierarchy is carried by an **opacity ladder on 3-4 tokens**, not by more colors.

### 5.D Agency / studio — *the capability is the product*

```
HERO (composition — geometric collage · type-as-image · CSS-only)  →
PROOF BAND (stats with real provenance)  →  CRAFT (split, one idea)  →
SERVICES (≤4, and they must differ from each other visually)  →
DARK INVERSION (offers · bento · a change of key)  →
TESTIMONIAL RAIL (scroll-snap, autoplay off on interaction)  →  CTA  →  FOOTER
```
The trap: **services as four identical icon-cards** — icon, title, two lines, ×4. That is the #1 tell (`anti-cheap.md`), and it's endemic to agency pages. If four services must appear, make the cards structurally different (varying spans, one with an image, one with a number), or use a numbered list with real typographic weight instead.

### Rules that hold across all four

- **Nav:** single line, ≤80px. Over alternating light/dark sections use a **scroll-spy class toggle** (`page-crafting.md` §4). `mix-blend-mode: difference` only over *high-contrast* imagery — it goes muddy over mid-tones.
- **Layout diversification:** once a layout family is used (3-col cards, full-width quote, split image+text), it appears **at most once more**. Max 2 consecutive image+text zigzags. **A page with 8 sections uses ≥4 layout families** — count them before shipping.
- **Eyebrow restraint:** the tiny-uppercase-tracked label above every headline is the #1 AI tell. Max **1 eyebrow per 3 sections** — `≤ ceil(sections / 3)`, counted, not felt. Usually the headline alone is enough.
- **Theme lock:** one theme per page — *except* where the skeleton above calls for a deliberate dark inversion (5.C, 5.D), which is a structural device, not a drift.
- **Numbering (`01 · 02 · 03`) must be motivated by the material** — film frame codes, plate numbers, movement parts. As default architecture it is a tell.

---

## 6. THE CHEAPNESS BLACKLIST

Before declaring done, scan against `references/anti-cheap.md` — the merged anti-slop list (AI tells + absolute bans + reflex-reject fonts/palettes/aesthetics). The headline offenders:

- **em-dashes** in copy as a flourish — banned outright (the single most-violated tell).
- **gradient text**, default **glassmorphism**, side-stripe card borders, **AI-purple glow**.
- **eyebrow on every section**, numbered `01 · 02 · 03` markers as default architecture.
- **identical card grids** (icon + title + text × 6), div-based fake screenshots / fake dashboards.
- **fake-precise numbers** (`92%`, `4.1×`) with no real source.
- **default-category palette** (beige+brass for craft, purple-glow for AI/SaaS) — name it, reject it.
- **`Inter`/`Fraunces`/`Instrument Serif` as unexamined defaults** — fine if chosen with a reason, a tell if reached for blindly.
- **zero imagery** on an image-implied brief (food, hotel, fashion, travel) — that's a bug, not minimalism.

---

## 7. PERFORMANCE & ACCESSIBILITY GUARDRAILS

- Animate `transform`/`opacity` only; never `top/left/width/height`. `will-change` sparingly.
- `prefers-reduced-motion`: stop canvas loops, freeze grain, swap to static. **Mandatory on every animated page — no exceptions, decorative motion included.** A page that animates without a reduced-motion terminal state is shipping broken.
  - **Capability-probe pattern (the ship-ready shape):** read the probes once at the top — `const RM = matchMedia('(prefers-reduced-motion:reduce)').matches; const FINE = matchMedia('(hover:hover) and (pointer:fine)').matches;` — then branch **per effect**: `if (RM) <set final state> else <animate>`. Gate pointer-dependent motion (magnetic buttons, cursor followers, hover accordions) behind `FINE` so it never fires on touch. Pair with the CSS backstop `@media (prefers-reduced-motion:reduce){*{animation-duration:.01ms!important;transition-duration:.01ms!important}}`. Every hand-built chart draw-in ships its terminal state the same way (`chart-crafting.md` §6).
- Color contrast WCAG AA: body ≥ 4.5:1, large text ≥ 3:1. Includes buttons over photos (add scrim/stroke), placeholders, focus rings.
- Visible focus states on every interactive element. Nav and CTAs reachable by keyboard.
- Core Web Vitals: lazy-load heavy engines, `min-h-dvh` over `100vh` on mobile, responsive images (WebP/AVIF), CLS < 0.1.
- Mobile collapse declared explicitly per multi-column section. Touch targets ≥ 44px.
- **The mobile floor — six hard rules, full reasoning in `references/mobile-floor.md`.** Test at **320 · 375 · 414 · 768**, not by dragging a desktop window until it looks off. **M1** `overflow-x: clip` on both `html` and `body` — never `hidden`, which makes a scroll container and silently kills every sticky descendant. **M2** image-bearing grid tracks are `minmax(0,1fr)`, never bare `1fr` (whose `auto` minimum is the image's intrinsic width); flex children get `min-width: 0`. **M3** clickable text never wraps at **any** width — shorten the label first, `nowrap` second. **M4** display headings carry `overflow-wrap: anywhere; min-width: 0`. **M5** exactly one sticky at `top: 0`; others offset by `--nav-h`, with `--z-nav` above `--z-sticky`. **M6** all-caps display type has a `line-height` floor of `1.0` (see §3). `scripts/detect.mjs` catches M1/M2/M5/M6 mechanically; M3 and M4 need a rendered page at 320px.

---

## 8. PRE-FLIGHT CHECK

Run the full checklist in `references/preflight.md` before saying "done." It merges the substrate check, the cheapness scan, the spectacle-claimed verification, the mobile floor, and the a11y gates. If any hard rule fails, it is shipping broken work — fix before delivery.

### 8.0 Record the build (after Pre-Flight passes, before you say "done")

Two writes. They cost about thirty seconds and they are the only reason the next run can rotate off this one.

1. **Stamp the CSS.** The first non-empty line of the page's stylesheet (or the top of the inline `<style>`) carries the five-axis coordinates:
   ```css
   /* finesse · register=brand · A=mono+acid-lime · B=900/300 · C=pinned-h-track
    * D=GSAP-scrub · E=machined-metal · SOUL=8 SPECTACLE=7 DENSITY=4 */
   ```
2. **Append to `.finesse/log.json`** — prepend the entry to the array, trim to the last 20. Schema in `divergence.md` §4.1. Create the directory and file if they don't exist.

**Component-scope builds do neither of these** — they use the component stamp and are never logged (`component-scope.md` §5). Components don't rotate; a project's buttons should look like siblings.

---

## 8.A POST-DELIVERY ITERATION GUIDE

After the user receives the initial output, map their feedback to the correct targeted fix. **Never rebuild from scratch for a single complaint** — identify the dial or module responsible and adjust only that. The **Command** column is the verb to route through (see `## Commands`); if the user typed the command, you're already there.

| User says | Command | Action |
|-----------|---------|--------|
| "too plain / boring" | `bolder` | Raise SPECTACLE +2; consider upgrading the engine type (e.g. Canvas → Three.js) |
| "too flashy / overwhelming" | `quieter` | Lower SPECTACLE −2; simplify or swap to Engine D (GSAP) or E (CSS-only) |
| "wrong vibe / feels off" | `soul` | Re-run §2 with a different persona from `references/style-personas.md` |
| "too much whitespace" | `densify` | Raise DENSITY +2; add one content section |
| "too cluttered" | `densify` | Lower DENSITY −2; cut a section, increase section padding |
| "more personality / bolder" | `bolder` | Raise SOUL +2; push color commitment level up one step in `references/design-dna.md` |
| "feels generic / like every other AI site" | `diverge` | **Systemic, not per-page.** Recompose the soul from the five axes (`divergence.md` §3), run the two-altitude anti-default check (§2), roll against the argmax (§6), check the used-list (§4). Reaching for `soul` here just picks a *different* row from the same ten-row table — which is the problem, not the fix |
| "every page you make looks the same" | `diverge` | Same as above. Then **write the used-list** (`divergence.md` §4) — without it, "don't repeat" is a rule with no memory behind it and it will never fire |
| "change the colors" | `soul` | Re-run color strategy in `references/design-dna.md`; maintain the accent lock rule |
| "different animation" | `animate` | Swap engine type in §4; re-run `references/hero-engines.md` for that engine's skeleton |
| "add depth / make it 3D / tilt / parallax" | `depth` | Add **one** 3D moment from `references/3d-effects.md` — default to the CSS tier (tilt/flip/coverflow/depth-parallax); Three.js only for a real rendered object |
| "remove a section" | `redesign` | Remove it, then re-audit §5 layout families (ensure ≥4 families remain) |
| "feels slow / heavy" | `quieter` | Lower SPECTACLE; switch to Engine E (CSS-only) or reduce particle count/FBO resolution |
| "needs to work on mobile" | `redesign` | Declare mobile layout per multi-column section; `min-h-dvh`, touch targets ≥44px |
| "is this any good? / review it" | `audit` | Read-only: run the blacklist + spectacle-shown + pre-flight, report findings |

---

## 9. OUT OF SCOPE

finesse covers **both** brand and product UI, so its scope is wide. Hand off only when the work is a **pure backend / API / data task with no interface**, or a brief that explicitly wants a **generic, conventional, zero-craft page** (finesse always brings craft — if the user truly wants bland, that's a different tool). Everything from a spectacle landing page to a dense admin dashboard is in scope: set the register in §0 and route accordingly.
