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
      "turbot/tap"
    ];

    brews = [
      "anchor"
      "cocoapods"
      "fastlane"
      "ncftp"
      "nss"
      "powerpipe"
      "ruby"
      "spek"
      "steampipe"
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
      "publii"
      "raycast"
      "scroll-reverser"
      "vlc"
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
