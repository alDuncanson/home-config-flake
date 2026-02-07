# Default: list all commands
default:
    @just --list

# Switch to the new configuration
switch:
    nix run home-manager -- switch --flake .#al

# Update flake inputs
update:
    nix flake update

# Update and switch
upgrade: update switch
