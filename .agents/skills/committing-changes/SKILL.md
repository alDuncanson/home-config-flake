---
name: committing-changes
description: "Stages and commits repository updates with verification-first discipline. Use when asked to create a commit after configuration or skill changes in this repo."
---

# Committing Changes

Creates clean commits after confirming the repository is in a valid state.

## Use This Skill When

1. The user asks to commit current work.
2. A change set is complete and validated.

## Workflow

1. Inspect changed files with `git status --short` and `git diff --stat`.
2. Run required validation for changed Nix files before committing.
3. Stage only intended files with `git add <paths>`.
4. Commit with a concise imperative message.
5. Confirm commit hash and summarize what was committed.

## Guardrails

1. Do not amend existing commits unless explicitly requested.
2. Do not include unrelated work in the commit.
3. Do not use destructive git operations.
