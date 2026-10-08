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
      {
        name = "DenzoNL/rdslink";
        trusted = true;
      }
    ];

    brews = [ "go" "gpg" "kubetail" "llvm" "mingw-w64" "rdslink" ];

    casks = [
      "1password-cli"
      "battle-net"
      "chatgpt"
      "claude"
      "claude-code@latest"
      "curseforge"
      "discord"
      "firefox"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "godot"
      "hot"
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
      "warp"
      "zed"
    ];
  };
}
