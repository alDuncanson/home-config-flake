---
name: searching-repo
description: "Finds code, configs, and command references in this repository using fast local search tools. Use when asked where something is defined, how a flow works, or what files need changes."
---

# Searching Repo

Locates relevant files and code paths quickly using the lowest-cost search method first.

## Use This Skill When

1. The user asks where a setting, command, or config lives.
2. The user asks for all places a pattern appears.
3. The task requires mapping a behavior across multiple files.

## Workflow

1. List candidate files with `rg --files` when file names are unknown.
2. Run exact or regex text searches with `rg -n "<pattern>"`.
3. Narrow by file type or path with `rg -n --glob "*.nix" "<pattern>"`.
4. Use `finder` only for multi-step, behavior-level discovery spanning modules.
5. Return results with concrete file paths and line numbers.

## Output Standard

1. Prioritize direct hits first.
2. Include the minimal snippet needed to prove relevance.
3. If no matches exist, state that clearly and list what was searched.
