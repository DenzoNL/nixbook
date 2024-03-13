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
      "robusta-dev/homebrew-krr"
      "turbot/tap"
    ];

    brews = [
      "cocoapods"
      "fastlane"
      "krr"
      "powerpipe"
      "ruby"
    ];

    casks = [
      "1password"
      "anydesk"
      "epic-games"
      "firefox"
      "flutter"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "google-chrome"
      "hot"
      "insomnia"
      "microsoft-teams"
      "openvpn-connect"
      "plexamp"
      "raycast"
      "scroll-reverser"
      "tailscale"
      "warp"
      "zoom"
    ];

    masApps = {
      Magnet = 441258766;
      "WhatsApp Messenger" = 310633997;
      Xcode = 497799835;
    };
  };
}
