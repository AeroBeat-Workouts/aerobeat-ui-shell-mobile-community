# AeroBeat UI Shell - Mobile Community Edition

This is the community mobile **UI Shell** for the AeroBeat platform.

🚧 **Future / second-wave platform path:** AeroBeat's locked v1 release priority is **PC community first**, then **mobile**, then **VR**. This repo exists as a future-facing mobile shell surface and should not be read as the current primary v1 delivery target.

## 📋 Repository Details

- **Type:** UI Shell
- **Release Positioning:** Future / second-wave mobile shell for the Community Edition
- **License:** **GNU GPLv3** (Strict Copyleft)
- **Canonical shared dependencies:**
  - `aerobeat-ui-core` (required shared UI logic contract)
  - `aerobeat-ui-kit-community` (pinned community visual layer)
  - additional lane/core repos only when this shell actually consumes them

## GodotEnv development flow

This repo uses the AeroBeat GodotEnv UI shell convention.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`

The repo root remains the package/published boundary for downstream consumers. Day-to-day development, debugging, and validation happen from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

### Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

That restores this repo's current dev/test manifest into `.testbed/addons/`. Canonically, this mobile shell should describe itself around `aerobeat-ui-core`, `aerobeat-ui-kit-community`, and only the extra repos it truly consumes.

### Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and bugfinding surface for future mobile shell work.

### Import smoke check

From the repo root:

```bash
godot --headless --path .testbed --import
```

### Run unit tests

From the repo root:

```bash
godot --headless --path .testbed --script addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit
```

### Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The manifest intentionally stays narrow: `aerobeat-ui-core` plus `aerobeat-ui-kit-community`, then any additional repos only when the shell actually consumes them.
- Repo-local unit tests live under `.testbed/tests/`.
- The current package shape is consumed from the repo root (`subfolder: "/"`) for downstream installs.
- Scope language in this repo should remain consistent with the downscoped docs truth: PC community first, mobile second, VR third.
