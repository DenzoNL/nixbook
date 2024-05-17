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
      "anchordotdev/tap"
      "homebrew/cask-fonts"
      "robusta-dev/homebrew-krr"
      "turbot/tap"
    ];

    brews = [
      "anchor"
      "cocoapods"
      "fastlane"
      "krr"
      "ncftp"
      "nss"
      "powerpipe"
      "ruby"
      "steampipe"
    ];

    casks = [
      "1password"
      "epic-games"
      "firefox"
      "flutter"
      "font-caskaydia-cove-nerd-font"
      "gitkraken"
      "google-chrome"
      "hot"
      "insomnia"
      "librewolf"
      "microsoft-teams"
      "openvpn-connect"
      "plexamp"
      "raycast"
      "scroll-reverser"
      "warp"
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
