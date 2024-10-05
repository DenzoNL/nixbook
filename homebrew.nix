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
      "homebrew/cask-fonts"
      "turbot/tap"
    ];

    brews = [
      "cocoapods"
      "fastlane"
      "nss"
      "ruby"
      "spek"
    ];

    casks = [
      "1password"
      "anydesk"
      "firefox"
      "flutter"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "google-chrome"
      "hot"
      "insomnia"
      "microsoft-teams"
      "obsidian"
      "openvpn-connect"
      "plexamp"
      "raycast"
      "scroll-reverser"
      "steam"
      "vlc"
      "warp"
      "zed"
      "zoom"
    ];

    masApps = {
      Magnet = 441258766;
      Tailscale = 1475387142;
      "WhatsApp Messenger" = 310633997;
      Xcode = 497799835;
    };
  };
}
