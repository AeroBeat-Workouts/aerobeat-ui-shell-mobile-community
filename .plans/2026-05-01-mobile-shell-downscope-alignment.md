# aerobeat-ui-shell-mobile-community

**Date:** 2026-05-01  
**Status:** In Progress  
**Agent:** Chip 🐱‍💻

---

## Goal

Align `aerobeat-ui-shell-mobile-community` with the locked AeroBeat v1 downscope so it truthfully presents itself as a future/second-wave community shell, not the current primary v1 shell.

---

## Overview

This repo is part of the AeroBeat UI shell layer follow-up from the parent coordination plan in `openclaw-chip`. The work stayed intentionally narrow: inspect README/package/testbed/manifest/dependency surfaces, remove stale scope claims, and ensure this shell's positioning matches the downscoped docs truth.

The repo turned out to be a very small GodotEnv shell with no package manifest beyond the root plugin metadata and the hidden `.testbed/` workbench contract. The main drift was repo truthfulness, not implementation depth: the README partially reflected future scope, but the manifest still pinned legacy `aerobeat-core`, the plugin metadata read like a present-tense platform shell, and the unit test was only boilerplate instead of checking repo-local scope truth.

---

## REFERENCES

| ID | Description | Path |
| --- | --- | --- |
| `REF-01` | Parent AeroBeat coordination plan | `/home/derrick/.openclaw/workspace/projects/openclaw-chip/.plans/2026-05-01-aerobeat-ui-shell-downscope-pass.md` |
| `REF-02` | Downscoped docs source of truth | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs` |
| `REF-03` | Owning repo | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-ui-shell-mobile-community` |
| `REF-04` | Mobile shell docs page | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/api/ui/shell-mobile-community/index.md` |
| `REF-05` | Locked v1 concept / release-order wording | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/gdd/concept.md` |
| `REF-06` | Community release-order wording | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/gdd/releases/community.md` |
| `REF-07` | Architecture overview wording for future-facing shells | `/home/derrick/.openclaw/workspace/projects/aerobeat/aerobeat-docs/docs/architecture/overview.md` |

---

## Tasks

### Task 1: Audit and align repo truth

**Bead ID:** `oc-wkt`  
**SubAgent:** `primary`  
**Role:** `coder`  
**References:** `REF-01`, `REF-02`, `REF-03`, `REF-04`, `REF-05`, `REF-06`, `REF-07`  
**Prompt:** Claim the assigned bead, audit the repo against the downscoped AeroBeat docs truth, implement the required alignment changes, run relevant validation, commit/push to `main`, and leave concise handoff notes for QA.

**Folders Created/Deleted/Modified:**
- `.plans/`
- `.testbed/`

**Files Created/Deleted/Modified:**
- `README.md`
- `plugin.cfg`
- `.testbed/addons.jsonc`
- `.testbed/project.godot`
- `.testbed/tests/test_example.gd`
- `.testbed/tests/test_example.gd.uid`
- `.plans/2026-05-01-mobile-shell-downscope-alignment.md`

**Status:** ✅ Complete

**Results:**
- Audited the repo against the locked v1 docs and confirmed the intended truth is: **PC community first, mobile second, VR third**, with mobile documented as a future platform path rather than the active primary shell (`REF-04`, `REF-05`, `REF-06`, `REF-07`).
- Rewrote `README.md` so the repo explicitly presents itself as a **future / second-wave mobile shell**, keeps the dev/test flow intact, and removes the stale “legacy core pin drift” explanation in favor of the now-correct manifest truth.
- Updated `plugin.cfg` description so the published plugin metadata no longer reads like a current primary v1 shell.
- Removed the stale `aerobeat-core` pin from `.testbed/addons.jsonc`, leaving the manifest aligned with the current shared shell dependency truth: `aerobeat-ui-core`, `aerobeat-ui-kit-community`, and `gut` only.
- Renamed the hidden workbench in `.testbed/project.godot` to `AeroBeat UI Shell Mobile Future Testbed` so the testbed surface itself reflects future-scope positioning.
- Replaced the boilerplate test with repo-truth assertions that verify README wording, plugin metadata, and manifest dependencies stay aligned with the downscoped shell contract.
- No additional repo-local or cross-repo implementation work was uncovered that needed a follow-up bead during this pass.

**Validation:**
- `cd .testbed && godotenv addons install`
- `godot --headless --path .testbed --import`
- `godot --headless --path .testbed --script addons/gut/gut_cmdln.gd -gdir=res://tests -ginclude_subdirs -gexit`
- Result: **3/3 tests passed**.

**Commit:** `1619022262c3c68d142a62aa579180f461ed5fd9`

**QA Handoff:**
- Verify the repo root README and plugin metadata consistently label mobile as future / second-wave scope.
- Confirm `.testbed/addons.jsonc` no longer carries `aerobeat-core` and only pins the current shell-level shared dependencies plus GUT.
- Re-run the documented headless import + GUT test commands; expected result is `3/3 passed`.

---

## Final Results

**Status:** ⚠️ Partial

**What We Built:** Completed the coder-side downscope alignment pass for the mobile community shell, updating repo truth surfaces and validation so the repo now documents itself as a future / second-wave mobile shell instead of an active primary v1 shell.

**Reference Check:**
- `REF-04` satisfied: repo wording matches the docs page's “future platform path” positioning.
- `REF-05` and `REF-06` satisfied: README/testbed wording now reflects the locked release order of PC first, mobile second, VR third.
- `REF-07` satisfied: future-facing shell surfaces remain documented without overstating current parity.

**Commits:**
- `1619022262c3c68d142a62aa579180f461ed5fd9` - Downscope-align mobile shell repo truth

**Lessons Learned:** In these minimal shell repos, the highest-value downscope work is often metadata, manifest cleanup, and turning placeholder tests into scope-truth guardrails.

---

*Completed on 2026-05-01 (coder handoff; QA/audit pending)*
