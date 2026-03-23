{ pkgs, prev ? pkgs }:

{
  argonaut = pkgs.callPackage ./argonaut { };
}
