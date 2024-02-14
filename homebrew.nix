# Configuration for homebrew
{ ... }: 

{
  homebrew.enable = true;

  # List of Homebrew formula repositories to tap.
  homebrew.taps = [
    "homebrew/cask-fonts"
  ];

  # List of Homebrew formulae to install.
  homebrew.brews = [
    "cocoapods"
    "fastlane"
    "ruby"
  ];

  # List of Homebrew casks to install.
  homebrew.casks = [
    "flutter"
    "font-caskaydia-cove-nerd-font"
    "insomnia"
    "plexamp"
    "warp"
  ];

  # List of App Store apps to install
  homebrew.masApps = {
    Magnet = 441258766;
    Tailscale = 1475387142;
    "WhatsApp Messenger" = 310633997;
    Xcode = 497799835;
  };
}