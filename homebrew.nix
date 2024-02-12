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
}