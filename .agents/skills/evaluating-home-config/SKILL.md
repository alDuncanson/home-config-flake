---
name: evaluating-home-config
description: "Evaluates and builds the Home Manager flake for this repository. Use when validating Nix changes before commits, switches, or troubleshooting evaluation/build failures."
---

# Evaluating Home Config

Runs fast and reliable checks for this Home Manager configuration.

## Use This Skill When

1. Any Nix file has been edited.
2. The user asks to verify configuration health.
3. A build or switch failed and needs diagnosis.

## Validation Steps

1. Run `nix eval .#homeConfigurations.al.activationPackage.drvPath` for quick evaluation.
2. Run `nix run home-manager -- build --flake .#al` to ensure the generation builds.
3. Report warnings and failures with the exact failing command.

## Troubleshooting

1. For missing package attributes, re-check package names with `nix search nixpkgs`.
2. For lock/input issues, inspect `flake.nix` and `flake.lock` before changing inputs.
3. Avoid switching generations during validation unless explicitly requested.
