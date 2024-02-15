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
    ];

    brews = [
      "cocoapods"
      "fastlane"
      "ruby"
    ];

    casks = [
      "1password"
      "anydesk"
      "epic-games"
      "firefox"
      "flutter"
      "font-caskaydia-cove-nerd-font"
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
    ];

    masApps = {
      Magnet = 441258766;
      "WhatsApp Messenger" = 310633997;
      Xcode = 497799835;
    };
  };
}
