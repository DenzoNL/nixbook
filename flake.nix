{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, home-manager, nix-darwin, nixpkgs, nixvim }:
    let
      userName = "d.bogers";
      configuration = { pkgs, ... }: 
      {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages = [ pkgs.cachix pkgs.vim ];

        nix.enable = true;

        # Allow the installation of unfree packages
        nixpkgs.config.allowUnfree = true;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Fix 'warning: Nix search path entry '/nix/var/nix/profiles/per-user/root/channels' does not exist, ignoring' error
        nix.channel.enable = false;

        # Explicitly add myself to trusted-users to prevent warnings.
        nix.settings.trusted-users = [ "root" userName ];

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true; # default shell on catalina
        programs.fish.enable = true; # enable fish shell

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        # Allow sudo using Touch ID
        security.pam.services.sudo_local.touchIdAuth = true;

        # Configure user with home directory and shell
        users.users.${userName} = {
          home = "/Users/${userName}";
          shell = pkgs.fish;
        };

        system.primaryUser = userName;

        # Always display hidden files.
        system.defaults.NSGlobalDomain.AppleShowAllFiles = true;

        # Add shell alias to rebuild this config.
        environment.shellAliases = {
          rebuild = "sudo darwin-rebuild switch --flake /Users/${userName}/nixbook";
        };
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .
      darwinConfigurations."Denniss-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          ./homebrew.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${userName} = import ./home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit userName; };
            home-manager.sharedModules = [ nixvim.homeManagerModules.nixvim ];
          }
        ];
        specialArgs = { inherit userName; };
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."svartalfheim".pkgs;
    };
}
