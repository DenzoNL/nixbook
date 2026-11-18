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
      {
        name = "ricardobroeders/convert";
        clone_target = "https://github.com/Ricardobroeders/convert";
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
      "ricardobroeders/convert/convert"
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
      "stablyai/orca/orca"
      "steam"
      "tailscale-app"
      "vlc"
      "warp"
      "zed"
    ];
  };
}
