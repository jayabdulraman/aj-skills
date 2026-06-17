# QA Checklist

## Must Pass

- 16:9 horizontal composition.
- Clean white background.
- Xiaohei appears.
- Xiaohei performs the core action rather than decorating the scene.
- The image uses a fresh metaphor for the current writing instead of copying an old example.
- The image is absurd, inventive, and interesting.
- The composition is clean and spacious; the main subject uses no more than about 60% of the canvas.
- One image explains only one core structure.
- English labels are sparse, short, readable, and correctly spelled.
- Orange is used only for main paths or arrows.
- Red is used only for emphasis, problems, warnings, or results.
- Blue is used only for secondary notes, feedback, or system state.

## Failure Signals

Regenerate or locally edit if any of these appear:

- A top-left title such as "Pitfalls," "Workflow," "System Architecture," or "Roadmap."
- Xiaohei looks like a mascot, meme, or cute cartoon.
- The image looks like a PPT slide, course slide, or formal flowchart.
- Too many elements, arrows, or nodes.
- Text becomes paragraph-length explanation.
- Background has paper texture, shadows, gradients, beige tone, or noise.
- Real UI screenshots or futuristic tech UI.
- Non-English labels, misspelled labels, or unreadable labels.
- The image is stiff and lacks an absurd metaphor.
- The composition is too similar to old examples in `assets/examples/`.

## Iteration Methods

- Too ordinary: make Xiaohei the subject of the action and add one strange-but-valid metaphor.
- Too complex: delete nodes and keep only one action plus 3-5 short labels.
- Too cute: emphasize deadpan, blank serious expression, not cute, not mascot.
- Too PPT-like: remove titles, frames, rigid grids, and excess arrows; turn it into a hand-drawn scene.
- Too similar to an old example: keep the meaning but replace the main object and Xiaohei's action.
- Text is wrong: prefer local editing; if many labels are wrong, regenerate with fewer labels.

## Delivery Judgment

A high-quality image should feel a little strange first, then become structurally clear within one second.

If the first impression is a tutorial slide rather than an absurd product sketch on white paper, it fails.
