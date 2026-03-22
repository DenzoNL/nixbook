{ pkgs, prev ? pkgs }:

{
  argonaut = pkgs.callPackage ./argonaut { };
  azahar = pkgs.callPackage ./azahar { azahar = prev.azahar; };
}
