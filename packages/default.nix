{ pkgs }:

{
  argonaut = pkgs.callPackage ./argonaut { };

  # Add more custom packages here as needed
  # example = pkgs.callPackage ./example { };
}
