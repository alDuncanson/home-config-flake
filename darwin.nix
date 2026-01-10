{
  pkgs,
  username,
  ...
}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
    };
    brews = [
      # Add Homebrew formulae here
      # "formula-name"
    ];
    casks = [
      # Add Homebrew casks here
      # "app-name"
    ];
  };

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = 5;
}
