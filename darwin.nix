{
  pkgs,
  username,
  ...
}: {
  system.primaryUser = username;

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

  nix.enable = false;

  programs.zsh.enable = true;

  system.stateVersion = 5;
}
