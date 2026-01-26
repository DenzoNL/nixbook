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
      "battle-net"
      "claude"
      "claude-code"
      "curseforge"
      "firefox"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "heroic"
      "hot"
      "insomnia"
      "microsoft-teams"
      "multiviewer-for-f1"
      "openvpn-connect"
      "orbstack"
      "plex"
      "plexamp"
      "private-internet-access"
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
