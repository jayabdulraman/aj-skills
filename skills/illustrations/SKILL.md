---
name: illustrations
description: Generate Ian-style English article illustrations. Use when the user wants absurd, clean, hand-drawn inline illustrations, article art, blog visuals, Notion visuals, workflow visuals, methodology visuals, metaphor sketches, shot lists, or image edits/removing titles. Defaults to the Xiaohei IP character, pure white hand-drawn line art, sparse red/orange/blue English handwritten notes, generous whitespace, and a strange but readable product-sketch style.
---

# Illustrations

## Core Purpose

Design and generate 16:9 horizontal inline illustrations for English articles, essays, posts, blogs, Notion docs, workflow docs, and product-methodology writing. The goal is not commercial illustration, a PPT infographic, or a cute cartoon. The goal is to turn one key judgment, workflow, structure, state, or metaphor from the writing into a clean, absurd, memorable hand-drawn explanatory sketch.

The default visual IP is Xiaohei: a small solid-black, white-dot-eyed, thin-legged, blank-faced character doing a serious but slightly absurd job. Xiaohei must participate in the core action of the image, never stand off to the side as decoration.

## Read References As Needed

Load only the reference files needed for the task:

- `references/style-dna.md`: style DNA, color, text, and avoid rules.
- `references/xiaohei-ip.md`: Xiaohei character shape, personality, action library, and avoid rules.
- `references/composition-patterns.md`: composition types, metaphor invention method, and anti-copy rules.
- `references/prompt-template.md`: prompt template for one image.
- `references/qa-checklist.md`: post-generation checks and iteration rules.
- `references/example-prompts.md`: English usage examples for planning, generation, and editing.
- `assets/examples/`: use only for occasional visual calibration. Do not copy these compositions, objects, or labels.

## Workflow

### 1. Digest The Writing

First read the user-provided article, link, Notion page, Markdown file, screenshot, or concept. Extract:

- The core claim.
- The paragraphs where the reader's understanding changes.
- The parts that would benefit from an illustration.
- The parts that should stay as text.

Do not distribute illustrations evenly. Prioritize cognitive anchors: core judgment, two breakpoints, input-output loop, sorting/splitting, before/after contrast, reuse from one source, handoff path, common pitfalls, or a change in user/creator state.

### 2. Produce A Shot List First

If the user asks to analyze where illustrations should go, produce a shot list first. For each image, include:

- Placement after a paragraph or section.
- Illustration theme.
- Core meaning.
- Structure type.
- What Xiaohei is doing.
- Suggested elements.
- Suggested English handwritten labels.

Default to 4-8 images. For short writing, use 1-3. Even for long writing, avoid going beyond 9 unless the user explicitly asks. Enough is better than turning the article into a picture book.

### 3. Generate One Image At A Time

If the user explicitly asks to generate, output, make, or create images, do not wait for confirmation. Use the built-in `image_gen` tool and generate each image separately. Do not combine multiple illustrations into one collage.

Each image should explain one core structure. The prompt must include:

- 16:9 horizontal English article illustration.
- Pure white background.
- Black hand-drawn line art.
- Sparse red/orange/blue English handwritten notes.
- Generous whitespace.
- Xiaohei as the subject performing the core action.
- No PPT look, no commercial illustration, no childish cuteness, no complex architecture diagram, and no type/title label in the top-left corner.

Do not copy previous examples. Examples only calibrate line density, whitespace, color restraint, and Xiaohei's level of participation. Do not reuse the old conveyor-breakpoint, line-pulling, source-fish, stamp-toolbox, or pitfall-path compositions unless the user explicitly requests a remake. Invent a fresh, strange-but-valid metaphor from the current writing every time.

### 4. Check And Iterate

After generation, check `references/qa-checklist.md`. If any of these issues appear, regenerate or locally edit:

- Xiaohei is only decorative.
- The image is too full.
- It looks like a formal flowchart or PPT slide.
- There is too much text, misspelled text, or non-English text.
- The top-left corner contains a type/title label such as "workflow," "system architecture," "pitfalls," or "roadmap."
- The style is too cute, childish, stiff, or polished.
- The background is not clean white.

### 5. Save And Deliver

If the user is working in a workspace, copy final images to:

```text
assets/<article-slug>-illustrations/
```

Name them in order:

```text
01-topic-name.png
02-topic-name.png
```

Keep original generated files. Do not overwrite existing assets unless the user explicitly asks for replacement.

## Response Style

Before generation, keep strategy output short and precise. After generation, include:

- How many images were generated.
- The purpose of each image.
- Saved paths.
- Which images are strongest and which are optional.

Do not over-explain the style theory. Let the images carry it.
