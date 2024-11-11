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

    casks = [
      "firefox"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "hot"
      "insomnia"
      "microsoft-teams"
      "openvpn-connect"
      "plexamp"
      "orbstack"
      "raycast"
      "rectangle"
      "scroll-reverser"
      "steam"
      "tailscale"
      "vlc"
      "warp"
    ];
  };
}
