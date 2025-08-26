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

    brews = [ "cargo-lambda" "cmake" "go" "gpg" "kubetail" "mingw-w64" "rdslink" ];

    casks = [
      "claude"
      "claude-code"
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
      "plexamp"
      "private-internet-access"
      "raycast"
      "rectangle"
      "scroll-reverser"
      "signal"
      "steam"
      "tailscale-app"
      "vlc"
      "warp"
      "zed"
    ];
  };
}
