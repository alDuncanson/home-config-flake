# Repository Agent Guide

## Purpose

This repository manages a macOS Home Manager environment using a Nix flake.

## Source Of Truth

1. `home.nix` is the main Home Manager module for packages, shell setup, and editor config.
2. `flake.nix` defines inputs and `homeConfigurations.al`.
3. `flake.lock` pins exact input revisions.

## Home Manager Operations

1. Evaluate config: `nix eval .#homeConfigurations.al.activationPackage.drvPath`
2. Build config without switching: `nix run home-manager -- build --flake .#al`
3. Switch to new generation: `nix run home-manager -- switch --flake .#al`
4. Update flake inputs: `nix flake update`
5. Upgrade (update + switch): run update, then switch.

## Environment Maintenance

1. List generations: `nix run home-manager -- generations`
2. Expire old generations (example): `nix run home-manager -- expire-generations "-14 days"`
3. Collect garbage: `nix-collect-garbage -d`

## Neovim With NVF

1. `programs.nvf` in `home.nix` is the canonical Neovim configuration.
2. Add plugins, language support, LSP behavior, and UI options through `programs.nvf.settings`.
3. Keep NVF changes declarative in Nix rather than ad-hoc runtime config files.

## Change Expectations

1. Prefer minimal, targeted edits.
2. After changing Nix files, run at least config evaluation before committing.
3. Do not add task-runner wrappers for core repo operations; use direct `nix` and Home Manager commands.
