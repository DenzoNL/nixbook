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

    brews = [
      "gpg"
    ];

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
      "signal"
      "steam"
      "tailscale"
      "vlc"
      "warp"
    ];
  };
}
