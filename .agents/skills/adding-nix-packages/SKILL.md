---
name: adding-nix-packages
description: "Adds CLI and desktop packages to the Home Manager package set in this flake. Use when asked to install new software through Nix and ensure the configuration still evaluates."
---

# Adding Nix Packages

Adds packages to `home.nix` safely and verifies that the flake resolves.

## Use This Skill When

1. The user asks to install a package in this environment.
2. A tool dependency is missing from `home.packages`.

## Workflow

1. Confirm the package attribute exists with `nix search nixpkgs <name> --json`.
2. Prefer the direct package attribute from current `nixpkgs` instead of adding overlays.
3. Edit `home.nix` under `home.packages` and keep changes minimal.
4. Validate with `nix eval .#homeConfigurations.al.activationPackage.drvPath`.
5. If requested, apply with `nix run home-manager -- switch --flake .#al`.

## Guardrails

1. Do not update `flake.lock` unless the user asked to update inputs.
2. If the package is unavailable, report alternatives and stop before introducing custom packaging.
