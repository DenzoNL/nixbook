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
      "firefox"
      "flutter"
      "font-caskaydia-cove-nerd-font"
      "hot"
      "insomnia"
      "openvpn-connect"
      "plexamp"
      "raycast"
      "scroll-reverser"
      "warp"
    ];

    masApps = {
      Magnet = 441258766;
      Tailscale = 1475387142;
      "WhatsApp Messenger" = 310633997;
      Xcode = 497799835;
    };
  };
}
