# EdPlus at ASU — Design System
**Version:** 1.0 (POC)
**Status:** Draft
**Maintained by:** EdPlus Design Team
**Umbrella brand:** Arizona State University (ASU)

> This document defines the design system for EdPlus at ASU digital products. We operate under the ASU umbrella brand and must comply with all ASU Brand and Marketing Guide standards. Where this document adds guidance beyond ASU's base standards, those additions are specific to EdPlus products and take precedence for our team.

---

## Table of Contents

1. [Brand Context](#1-brand-context)
2. [Color](#2-color)
3. [Typography](#3-typography)
4. [Spacing & Layout](#4-spacing--layout)
5. [Iconography](#5-iconography)
6. [Accessibility](#6-accessibility)
7. [Components](#7-components)
8. [Content & Voice](#8-content--voice)
9. [Claude Design Usage Guide](#9-claude-design-usage-guide)

---

## 1. Brand Context

### 1.1 Who We Are

EdPlus at ASU is a university enterprise unit focused on the design, development, and scalability of digital learning. We build digital products — learning platforms, student-facing tools, operational dashboards, and marketing experiences — that serve ASU's mission to advance access, excellence, and impact.

### 1.2 Brand Hierarchy

```
Arizona State University (ASU)
└── Unity Design System (UDS) — enterprise web standards
    └── EdPlus at ASU
        └── This design system — EdPlus-specific guidance
```

- **ASU brand guide** is the source of truth for all brand decisions: [brandguide.asu.edu](https://brandguide.asu.edu)
- **Unity Design System (UDS)** governs all asu.edu digital experiences: [unity.web.asu.edu](https://unity.web.asu.edu)
- **This document** provides additional guidance specific to EdPlus products and is layered on top of, not in replacement of, ASU/UDS standards

### 1.3 EdPlus Design Principles

These principles guide design decisions across all EdPlus digital products:

| Principle | What it means in practice |
|-----------|---------------------------|
| **Learner-first** | Every interface decision considers the learner experience above all — especially for students with varying technical access and abilities |
| **Accessible by default** | Accessibility is not a checklist item; it is designed in from the start |
| **Consistent within ASU** | We visually cohere with ASU's enterprise design — users should feel they are in the ASU ecosystem |
| **Clarity over cleverness** | Clear, plain language and obvious UI patterns over creative novelty |
| **Scalable** | Components and patterns must be reusable across EdPlus products, not built for a single context |

---

## 2. Color

### 2.1 ASU Primary Colors (Required)

These are ASU's official brand colors. All EdPlus digital products must use these as primary colors. They anchor brand recognition and must always be present.

| Token | Name | Hex | RGB | Use |
|-------|------|-----|-----|-----|
| `--color-asu-maroon` | ASU Maroon | `#8C1D40` | 140, 29, 64 | Primary brand color, primary CTAs, header elements |
| `--color-asu-gold` | ASU Gold | `#FFC627` | 255, 198, 39 | Accent, highlights, secondary CTAs |
| `--color-black` | Black | `#000000` | 0, 0, 0 | Use sparingly; UDS uses Gray 1 instead |
| `--color-white` | White | `#FFFFFF` | 255, 255, 255 | Backgrounds, text on dark surfaces |

### 2.2 ASU Secondary Colors (Use as Accents Only)

Secondary colors must not overpower the primary palette. They add meaning and variety but must appear alongside ASU Maroon or ASU Gold.

| Token | Name | Hex | Use |
|-------|------|-----|-----|
| `--color-asu-green` | ASU Green | `#78BE20` | Success states, positive indicators |
| `--color-asu-blue` | ASU Blue | `#00A3E0` | Links (contextual), informational states |
| `--color-asu-orange` | ASU Orange | `#FF7F32` | Warnings, attention, highlights |
| `--color-asu-gray` | ASU Gray | `#747474` | Body text, secondary text, borders |
| `--color-asu-copper` | ASU Copper | `#AF674B` | Decorative, marketing contexts only |

### 2.3 UDS Grayscale

The Unity Design System uses a 7-step grayscale developed from ASU Maroon and ASU Gold values. Gray 1 serves as functional black; Gray 7 serves as functional white on asu.edu.

| Token | Label | Hex | Use |
|-------|-------|-----|-----|
| `--color-gray-1` | Gray 1 (functional black) | `#191919` | Body text, headings |
| `--color-gray-2` | Gray 2 | `#333333` | Secondary text |
| `--color-gray-3` | Gray 3 | `#4D4D4D` | Tertiary text, disabled states |
| `--color-gray-4` | Gray 4 | `#BFBFBF` | Social icons, subtle borders |
| `--color-gray-5` | Gray 5 | `#D0D0D0` | Borders, dividers |
| `--color-gray-6` | Gray 6 | `#E8E8E8` | Subtle backgrounds, cards |
| `--color-gray-7` | Gray 7 (functional white) | `#F5F5F5` | Page backgrounds |

### 2.4 EdPlus Color Usage Rules

These rules apply to all EdPlus digital products in addition to ASU's base color standards:

- **Maroon is the primary action color.** Use `#8C1D40` for primary buttons, key CTAs, and active navigation states.
- **Gold is the accent, not the lead.** Gold should never be the dominant color on a screen. Use it to highlight, draw attention, or reinforce brand moments.
- **Never place gold text on a white background.** This fails WCAG AA contrast. Use maroon or Gray 1 for text instead.
- **Never place maroon text on a black background.** This also fails accessibility contrast requirements.
- **Blue (`#00A3E0`) is the default link color** in body content contexts within EdPlus products.
- **Green (`#78BE20`) is reserved for success/completion states** — do not repurpose it for decorative use.
- **Test all color combinations** for WCAG 2.1 AA contrast using tools like Siteimprove or the WAVE browser extension before shipping.

---

## 3. Typography

### 3.1 The ASU Web Standard: Arial Only

ASU's Unity Design System mandates **Arial as the only web font** for asu.edu properties. No alternative typefaces — including serif, script, or decorative fonts used in images or video — are permitted.

```css
font-family: Arial, Helvetica, "Nimbus Sans L", "Liberation Sans", FreeSans, sans-serif;
```

This is a firm ASU web standard. EdPlus does not deviate from it on asu.edu digital products.

### 3.2 Type Scale

All body copy must be at minimum **16px / 1rem**. Text must not extend beyond **700px wide** for readability.

| Level | Size | Weight | Letter Spacing | Use |
|-------|------|--------|----------------|-----|
| H1 | 48px / 3rem | Bold (700) | -0.035em | Page titles, hero headings |
| H2 | 36px / 2.25rem | Bold (700) | -0.035em | Section headings |
| H3 | 28px / 1.75rem | Bold (700) | -0.035em | Subsection headings |
| H4 | 22px / 1.375rem | Bold (700) | -0.035em | Component headings |
| H5 | 18px / 1.125rem | Bold (700) | -0.035em | Small labels, callout headings |
| Body (large) | 18px / 1.125rem | Regular (400) | normal | Introductory paragraphs |
| Body (base) | 16px / 1rem | Regular (400) | normal | Default body copy |
| Body (small) | 14px / 0.875rem | Regular (400) | normal | Captions, metadata, helper text |
| Label | 14px / 0.875rem | Bold (700) | normal | Form labels, UI labels |

### 3.3 EdPlus Typography Rules

- **All text is left-aligned** — center-alignment is not used for body content (ASU web standard)
- **Italics are not used** — ASU writing style prohibits italics on asu.edu
- **Line height for body text:** 1.5 minimum for readability
- **Maximum content width:** 700px for prose; layout containers may be wider
- **Bold is used for emphasis** — never use ALL CAPS for emphasis in body text (use sparingly for labels/UI only)

---

## 4. Spacing & Layout

### 4.1 Spacing System

ASU's web standard uses **multiples of 8px** for all spacing decisions. EdPlus follows this convention.

| Token | Value | Use |
|-------|-------|-----|
| `--space-1` | 4px | Micro spacing (icon gaps, tight labels) |
| `--space-2` | 8px | Base unit — tight internal spacing |
| `--space-3` | 16px | Default padding, gap between inline elements |
| `--space-4` | 24px | Standard component padding |
| `--space-5` | 32px | Large padding, section gaps |
| `--space-6` | 48px | Section separation |
| `--space-7` | 64px | Page-level section breaks |
| `--space-8` | 96px | Hero and large section vertical rhythm |

### 4.2 Grid System

EdPlus follows the UDS column grid, built on **Bootstrap 4** conventions:

- **12-column grid**
- **Gutter:** 24px (1.5rem)
- **Container max-width:** 1200px
- **Responsive breakpoints:** (Bootstrap 4 standard)
  - `xs`: < 576px
  - `sm`: ≥ 576px
  - `md`: ≥ 768px
  - `lg`: ≥ 992px
  - `xl`: ≥ 1200px

### 4.3 EdPlus Layout Rules

- All layouts must be **responsive** — design mobile-first, then expand
- Components and content areas should not require horizontal scrolling at any breakpoint
- **Content column width:** Body text content should not exceed 700px
- **Card grids:** Default to 3-column on desktop, 2-column on tablet, 1-column on mobile
- **Section vertical padding:** 96px top and bottom for all full-width sections

---

## 5. Iconography

### 5.1 Icon Library

ASU mandates **Font Awesome (free version)** for all web icons. Custom icons must be built from Font Awesome elements to maintain visual consistency across ASU's ecosystem.

- Source: [Font Awesome Free](https://fontawesome.com/icons?m=free)
- Do not introduce custom icon sets or icons from other libraries

### 5.2 Icon Color Rules

| Context | Color |
|---------|-------|
| Icons in body content used as links | ASU Maroon (`#8C1D40`) |
| Icons in buttons | Matches button text color |
| Social icons in footer | ASU Gray 4 (`#BFBFBF`) |
| Informational icons | ASU Blue (`#00A3E0`) |
| Success icons | ASU Green (`#78BE20`) |
| Warning icons | ASU Orange (`#FF7F32`) |
| Error icons | Error Red (`#B72A2A`) |

### 5.3 EdPlus Icon Usage Rules

- Icons must always be accompanied by a visible text label or an accessible `aria-label` — icons alone are not sufficient for interactive elements
- Minimum touch target for icon buttons: 44×44px (WCAG 2.5.5)
- Decorative icons must have `aria-hidden="true"`

---

## 6. Accessibility

### 6.1 Standard

ASU requires compliance with **WCAG 2.1 Level AA** across all asu.edu digital products. EdPlus enforces this standard across all digital products — including internal tools, not just public-facing sites.

### 6.2 Key Requirements

| Area | Requirement |
|------|-------------|
| **Color contrast** | Text on backgrounds must meet 4.5:1 ratio (normal text) or 3:1 (large text, ≥ 18px or 14px bold) |
| **Focus indicators** | All interactive elements must have a visible focus state |
| **Keyboard navigation** | All functionality must be operable by keyboard alone |
| **Screen readers** | All images require descriptive alt text; decorative images use `alt=""` |
| **Form labels** | Every form field must have a programmatically associated label |
| **Error messages** | Errors must be described in text, not by color alone |
| **Animations** | Respect `prefers-reduced-motion`; all motion must be disableable |
| **Captions** | All video content must include accurate closed captions |
| **Accessible third-party tools** | External tools must meet WCAG 2.1 AA before inclusion in EdPlus products |

### 6.3 Testing Protocol

- **Automated:** Run Siteimprove or WAVE browser extension on all new pages/components
- **Manual:** Use ASU's Web Accessibility Audit Tool for step-by-step manual review
- **Note:** Automated tests catch fewer than 25% of issues — manual testing is required
- **ASU prohibits accessibility overlays** — do not use tools like AccessiBe or UserWay as substitutes for genuine remediation

---

## 7. Components

This section documents component patterns used across EdPlus products. All components are built on or compatible with the ASU Unity Design System component library.

### 7.1 Buttons

All EdPlus buttons are **pill-shaped** — `border-radius: 9999px` applies to all button variants and sizes, including small buttons.

Reference: [EdPlus Button Component (Storybook)](https://master.d34gtp7q60k178.amplifyapp.com/?path=/docs/components-button-buttons--docs)

#### Primary Button
- **Background:** ASU Maroon (`#8C1D40`)
- **Text:** White (`#FFFFFF`)
- **Border-radius:** 9999px (pill)
- **Hover:** 10% darkened maroon
- **Use:** Primary CTAs — one per view where possible

#### Secondary Button
- **Background:** Transparent
- **Border:** 2px solid ASU Maroon
- **Text:** ASU Maroon
- **Border-radius:** 9999px (pill)
- **Hover:** Filled with Maroon, white text

#### Gold Accent Button
- **Background:** ASU Gold (`#FFC627`)
- **Text:** Gray 1 (`#191919`) — never white (fails contrast)
- **Border-radius:** 9999px (pill)
- **Use:** Marketing/promotional contexts only; not for functional UI

#### Disabled State
- **Background:** Gray 5 (`#D0D0D0`)
- **Text:** Gray 3 (`#4D4D4D`)
- **Border-radius:** 9999px (pill)
- **Cursor:** `not-allowed`
- **Always include** `aria-disabled="true"` and `disabled` attribute

#### EdPlus Button Rules
- **All button sizes use pill shape** — this includes small, default, and large button variants
- Minimum button height: 44px (touch target); small buttons: 32px minimum
- Minimum button padding: 12px 24px (small: 8px 16px)
- Buttons must never be used for navigation — use links styled as buttons only when the action triggers a state change or form submission
- Button labels must be action-oriented: "Start course", "Download report", "Submit application"

### 7.2 Form Elements

- All inputs have a minimum height of 44px
- **Border-radius:** 0 (rounded none) — applies to all inputs, textareas, selects, modals, and tooltips
- Labels appear above the input, never inside as placeholder-only
- Required fields are marked with an asterisk (*) and a legend explaining the notation
- Error messages appear below the input in `#B72A2A` with an error icon
- Placeholder text is supplemental only — it disappears on focus and is not the label

### 7.3 Cards

Cards are the primary content container pattern in EdPlus products (course cards, resource tiles, dashboard items).

Reference: [EdPlus Card Component (Storybook)](https://master.d34gtp7q60k178.amplifyapp.com/?path=/docs/components-card-cardicon--docs)

- **Background:** White or Gray 7
- **Border:** 1px solid Gray 5
- **Border-radius:** 0 (rounded none) — no rounded corners on cards or any container elements
- **Shadow:** Subtle box shadow: `0 2px 8px rgba(0,0,0,0.08)`
- **Hover (if interactive):** Shadow deepens to `0 4px 16px rgba(0,0,0,0.14)`; cursor: pointer
- **Padding:** 24px internal padding
- **Image area:** 16:9 aspect ratio for course imagery

#### Eyebrow / Highlighted Text

Reference: [EdPlus Highlight Component (Storybook)](https://master.d34gtp7q60k178.amplifyapp.com/?path=/story/components-highlight-highlightapollo--examples)

- Eyebrow labels and highlighted text containers use **border-radius: 0** (rounded none) — no rounded or pill shapes
- This applies to all label chips, category tags, and highlight banners used alongside cards or content blocks

#### Decorative Icon Containers

When a card or step component includes a decorative container for an icon or a step number (e.g., numbered steps, icon feature cards), use a **circle shape** (`border-radius: 50%`), not a square or rounded-square.

- Circle containers are the only exception to the rounded-none rule — they are intentionally circular for decorative/illustrative use
- Do not use rounded rectangles (`border-radius: 4px`, `8px`, etc.) for icon or number containers

### 7.4 Navigation

EdPlus products on asu.edu must use the **UDS Header and Footer** components — these are mandatory for all asu.edu domains and subdomains.

Reference live implementation: [asuonline.asu.edu](https://asuonline.asu.edu/)
Storybook — Header: [HeaderStandard](https://master.d34gtp7q60k178.amplifyapp.com/?path=/story/sections-header-headerstandard--primary)
Storybook — Footer: [FooterStandard](https://master.d34gtp7q60k178.amplifyapp.com/?path=/story/sections-footer-footerstandard--primary)

#### Header

- **Background:** ASU Maroon (`#8C1D40`)
- **Logo — Desktop:** ASU vertical logo (white), left-aligned
  `https://www.asu.edu/profiles/contrib/webspark/modules/asu_brand/node_modules/@asu/component-header-footer/dist/assets/img/arizona-state-university-logo-vertical.png`
- **Logo — Tablet/Mobile:** ASU horizontal logo (white), left-aligned
  `https://www.asu.edu/profiles/contrib/webspark/modules/asu_brand/node_modules/@asu/component-header-footer/dist/assets/img/arizona-state-university-logo.png`
- Logo must always be white (`#FFFFFF`) — no full-color or modified variants
- Unit name (e.g., "ASU Online" or "EdPlus at ASU") appears as a text link beside or below the logo
- Utility navigation (My ASU, Sign in, etc.) sits in the top utility bar
- Primary navigation links are white on maroon background

#### Footer

- **Background:** Dark (Gray 1 / `#191919`)
- **Unit logo:** White, left-aligned, with "Contact us" link below
- **Repeatedly Ranked graphic:** Included in footer for public-facing EdPlus/ASU Online properties
  `https://cms.asuonline.asu.edu/sites/g/files/litvpz1971/files/footer-rank.png`
- **Footer links:** Standard ASU footer links required — Maps and Locations, Jobs, Directory, Contact ASU, My ASU
- **Legal links:** Copyright and Trademark, Accessibility, Privacy, Terms of Use, Emergency
- **Social icons:** Font Awesome, colored ASU Gray 4 (`#BFBFBF`)

### 7.5 Alerts & Notifications

| Type | Background | Icon | Border |
|------|-----------|------|--------|
| Info | Light Blue (`#E5F5FB`) | `fa-info-circle` (Blue) | Left border: ASU Blue (`#00A3E0`) |
| Success | Light Green (`#EBF6DC`) | `fa-check-circle` (Green) | Left border: ASU Green (`#78BE20`) |
| Warning | Light Orange (`#FFF0E5`) | `fa-exclamation-triangle` (Orange) | Left border: ASU Orange (`#FF7F32`) |
| Error | Light Red (`#FBEAEA`) | `fa-times-circle` (`#B72A2A`) | Left border: `#B72A2A` |

> **Note:** The error state uses `#B72A2A` (not ASU Maroon `#8C1D40`) for both the border and icon color to maintain clear visual distinction between brand elements and system error states.

---

## 8. Content & Voice

### 8.1 ASU Writing Style Alignment

All EdPlus content must align with the ASU Writing Style Guide. Key principles:

- **Plain language first** — write for a broad audience, including non-native English speakers
- **Active voice preferred** over passive constructions
- **Second person ("you")** for learner-facing content
- **No italics** — emphasis is achieved through bold, sentence structure, or layout
- **No ALL CAPS in body copy** — acceptable for UI labels/abbreviations only

### 8.2 EdPlus Content Principles

- **Be direct.** Learners are busy. Get to the point. Avoid preamble.
- **Use learner-centric language.** Say "you'll learn" not "the course teaches."
- **Avoid jargon.** Internal terms like "LMS," "modality," and "synchronous" should be explained or replaced.
- **Reference accessible formats.** When linking to PDFs or video, note the format: "Download the syllabus (PDF)" or "Watch the intro video (3 min)."

### 8.3 Alt Text & Image Guidelines

- All informational images require descriptive alt text that conveys meaning, not just appearance
- Images of people should describe relevant context, not enumerate physical features
- Decorative images use empty `alt=""`
- Do not embed text in images — text in images cannot be resized or read by screen readers

---

## 9. Claude Design Usage Guide

This section helps EdPlus team members get the most out of Claude Design using our design system.

### 9.1 What Claude Design Is

Claude Design is a tool by Anthropic Labs that lets you create designs, interactive prototypes, presentations, and more by having a conversation with Claude. When set up with our EdPlus design system, it will automatically reference these guidelines when generating UI.

### 9.2 Getting Started

When you create a project, it automatically inherits your organization's design system. You don't need to upload brand assets or configure anything — your brand colors, fonts, and components are already in place.

### 9.3 Writing Good Prompts for EdPlus Work

A prompt that works well for EdPlus products includes:

1. **The product context** — Is this a learner-facing tool, an internal dashboard, a marketing page?
2. **The audience** — Students, instructors, EdPlus staff, prospective learners?
3. **The goal** — What should a user accomplish on this screen?
4. **Layout hints** — Mobile or desktop priority? Dashboard, form, landing page?
5. **Component callouts** — Reference specific components by name when you know them

**Examples of strong EdPlus prompts:**

- "Create a course enrollment confirmation screen for a mobile learner. Use ASU Maroon for the primary action button. Show course name, start date, and next steps."
- "Design an internal instructor dashboard showing active course enrollments by week, with filtering by department. Use the card pattern for summary metrics."
- "Build a marketing landing page for an EdPlus micro-credential program. Hero section with a CTA, followed by an outcomes section, then a card grid of related programs."

### 9.4 Iterating on Designs

Use chat for broad changes that affect the overall design. Use inline comments for targeted, component-level changes — clicking directly on a specific part of the canvas to request a fix is faster than describing the location in chat.

### 9.5 Referencing This Design System in Prompts

When generating work in Claude Design, reference this document to ground the output:

- "Use our EdPlus design system — ASU Maroon for primary actions, Arial font, 8px spacing grid."
- "Apply the UDS card pattern with 24px internal padding and a subtle box shadow."
- "Primary button should be ASU Maroon (#8C1D40) with white text."
- "Make sure this meets WCAG 2.1 AA contrast requirements."

### 9.6 Exporting & Handoff

When your design is ready, use the Export button in the upper right corner to choose from formats including: download as .zip, export as PDF, export as PPTX, export as standalone HTML, or handoff to Claude Code. For developer handoff, use "Handoff to Claude Code" to send production-ready work directly to engineering.

### 9.7 Design System Source Materials

When uploading assets to configure your Claude Design organization, use these EdPlus/ASU resources as source material:

- ASU Brand Guide: [brandguide.asu.edu](https://brandguide.asu.edu)
- Unity Design System: [unity.web.asu.edu](https://unity.web.asu.edu)
- UDS Figma UI Kit: accessible via ASU's shared Adobe XD/Figma library (request via UDS Slack channel)
- EdPlus course design standards: [edl.asu.edu/design-standards](https://edl.asu.edu/design-standards)
- ASU web standards checklist: [brandguide.asu.edu/execution-guidelines/web/standards-checklist](https://brandguide.asu.edu/execution-guidelines/web/standards-checklist)

---

## Appendix: Quick Reference Card

### Colors at a Glance
| Use | Color | Hex |
|-----|-------|-----|
| Primary actions, brand | ASU Maroon | `#8C1D40` |
| Accent, highlight | ASU Gold | `#FFC627` |
| Links | ASU Blue | `#00A3E0` |
| Success | ASU Green | `#78BE20` |
| Warning | ASU Orange | `#FF7F32` |
| Error (border, icon) | Error Red | `#B72A2A` |
| Body text | Gray 1 | `#191919` |
| Subtle backgrounds | Gray 7 | `#F5F5F5` |

### Accessibility Checklist
- [ ] Color contrast ≥ 4.5:1 for normal text
- [ ] All images have alt text
- [ ] All form fields have labels
- [ ] All interactive elements have focus states
- [ ] Keyboard navigation tested
- [ ] No accessibility overlays used
- [ ] Captions on all video
- [ ] `prefers-reduced-motion` respected

### Don'ts
- ❌ Don't use fonts other than Arial on asu.edu
- ❌ Don't use gold text on white backgrounds
- ❌ Don't use maroon text on black backgrounds
- ❌ Don't center-align body text
- ❌ Don't use italics
- ❌ Don't introduce custom icon sets
- ❌ Don't use accessibility overlays
- ❌ Don't embed text in images
- ❌ Don't use border-radius on cards, containers, inputs, modals, or tooltips (rounded none)
- ❌ Don't use square or rounded-square shapes for decorative icon containers (use circles)
- ❌ Don't use ASU Maroon (`#8C1D40`) for error states — use `#B72A2A` instead

---

*EdPlus at ASU Design System v1.0 — POC Draft*
*Source of truth for brand: [brandguide.asu.edu](https://brandguide.asu.edu)*
*Questions? Contact the EdPlus Design Team*
