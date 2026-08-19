{ pkgs, lib, userName, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userName;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    argocd
    argocd-autopilot
    awscli2
    bat # Enhanced cat with syntax highlighting
    bun
    clang-tools
    cmake
    comma
    datadog-pup
    delta # Better Git diff viewer
    devenv
    discord
    dust # Modern du replacement
    eza # Modern replacement for ls
    fd
    gh
    glab
    graphviz
    inetutils
    k9s
    kubectl
    kubectx
    kubernetes-helm
    kustomize
    legendary-gl
    maven
    nixd
    nixfmt
    nodejs_22
    pnpm
    ripgrep
    rustup
    slack
    ssm-session-manager-plugin
    terraform
    opentofu
  ];
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable direnv
  programs.direnv = {
    enable = true;
    config = { hide_env_diff = true; };
    nix-direnv = { enable = true; };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      # Add ~/.local/bin to PATH
      fish_add_path -p $HOME/.local/bin
      ${lib.optionalString pkgs.stdenv.isDarwin ''
        eval (/opt/homebrew/bin/brew shellenv)
      ''}
    '';
    shellAliases = {
      # Kubernetes aliases
      k = "kubectl";
      kc = "kubectx";
      kn = "kubens";
      tf = "terraform";

      # Modern CLI tool replacements
      cat = "bat -pp";  # Plain output, no paging, but with syntax highlighting
      du = "dust";      # Better disk usage display

      # Modern replacements for ls
      ls = "exa --icons";
      ll = "exa -l --icons --git";
      la = "exa -la --icons --git";
      lt = "exa --tree --level=2 --icons";
      lta = "exa --tree --level=2 --icons --all";
    };
  };

  # Enable starship prompt
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      # Increase command timeout to prevent Java detection issues
      command_timeout = 2000;
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  # nh: nicer wrapper around darwin-rebuild (build output via nix-output-monitor).
  # Sets NH_FLAKE so `nh darwin switch` needs no arguments.
  programs.nh = {
    enable = true;
    flake = "/Users/${userName}/nixbook";
  };

  programs.git = { enable = true; };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      light = false;
      side-by-side = true;
    };
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk25_headless;
  };

  programs.gpg = { enable = true; };
}
