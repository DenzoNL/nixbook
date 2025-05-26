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
    ];

    brews = [ "cmake" "go" "gpg" "kubetail" "mingw-w64" "rdslink" ];

    casks = [
      "chatgpt"
      "firefox"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
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
      "tailscale"
      "vlc"
      "warp"
    ];
  };
}
