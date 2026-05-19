# Configuration for homebrew
{ ... }:

{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    taps = [
      "DenzoNL/rdslink"
      "cargo-lambda/tap"
    ];

    brews = [ "cargo-lambda" "go" "gpg" "kubetail" "llvm" "mingw-w64" "rdslink" ];

    casks = [
      "1password-cli"
      "battle-net"
      "claude"
      "claude-code"
      "curseforge"
      "firefox"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "godot"
      "hot"
      "insomnia"
      "microsoft-teams"
      "multiviewer-for-f1"
      "openvpn-connect"
      "orbstack"
      "plex"
      "plexamp"
      "raycast"
      "rectangle"
      "scroll-reverser"
      "signal"
      "steam"
      "tailscale-app"
      "vlc"
      "vivaldi"
      "warp"
      "zed"
    ];
  };
}
