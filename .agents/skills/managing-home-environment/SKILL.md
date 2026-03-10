---
name: managing-home-environment
description: "Performs routine Home Manager lifecycle operations for this flake, including update, switch, generation cleanup, and garbage collection. Use when maintaining or upgrading the local environment."
---

# Managing Home Environment

Runs operational commands for day-to-day maintenance of this Home Manager setup.

## Use This Skill When

1. The user asks to update or upgrade the environment.
2. The user asks to switch to the current configuration.
3. The user asks to clean up old generations or reclaim disk space.

## Standard Operations

1. Evaluate first: `nix eval .#homeConfigurations.al.activationPackage.drvPath`.
2. Build without switching: `nix run home-manager -- build --flake .#al`.
3. Switch to current config: `nix run home-manager -- switch --flake .#al`.
4. Update flake inputs: `nix flake update`.
5. Upgrade sequence: update inputs, then switch.

## Cleanup Operations

1. List generations: `nix run home-manager -- generations`.
2. Expire generations (example): `nix run home-manager -- expire-generations "-14 days"`.
3. Collect garbage: `nix-collect-garbage -d`.

## Safety Rules

1. Report command output highlights and any warnings.
2. Avoid running update commands unless explicitly requested.
3. Prefer build/eval before switch to catch errors early.
