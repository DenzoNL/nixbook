{ pkgs, lib, userName, ... }:

{
  imports = [
    ./nixvim.nix
  ];

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
    argonaut
    awscli2
    bat # Enhanced cat with syntax highlighting
    comma
    d2
    delta # Better Git diff viewer
    devenv
    discord
    dust # Modern du replacement
    eza # Modern replacement for ls
    fd
    graphviz
    inetutils
    k9s
    kubectl
    kubectx
    kubernetes-helm
    kustomize
    maven
    mysql80
    nixd
    nixfmt-classic
    nodejs_22 
    pnpm
    ripgrep
    rustup
    slack
    ssm-session-manager-plugin
    terraform
    usbutils
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

  # Configure my IDE, VSCode
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        dbaeumer.vscode-eslint
        eamodio.gitlens
        gitlab.gitlab-workflow
        hashicorp.terraform
        jnoortheen.nix-ide
        mkhl.direnv
        ms-azuretools.vscode-docker
        octref.vetur
        redhat.vscode-yaml
        yzhang.markdown-all-in-one
        zhuangtongfa.material-theme
      ];
      userSettings = {
        "workbench.startupEditor" = "none";
        "editor.inlineSuggest.enabled" = true;
        "editor.fontFamily" =
          "'CaskaydiaCove Nerd Font', Menlo, Monaco, 'Courier New', monospace";
        "terminal.integrated.fontFamily" =
          "'CaskaydiaCove Nerd Font', Menlo, Monaco, 'Courier New', monospace";
        "terminal.integrated.defaultLocation" = "editor";
        "terminal.integrated.defaultProfile.osx" = "fish";
        "terminal.integrated.profiles.osx" = {
          "fish" = {
            "path" = "/etc/profiles/per-user/${userName}/bin/fish";
          };
        };
        "editor.fontLigatures" = true;
        "editor.fontSize" = 16;
        "terminal.integrated.fontSize" = 15;
        "[markdown]" = { "editor.formatOnSave" = true; };
        "[rust]" = { "editor.formatOnSave" = true; };
        "editor.codeActionsOnSave" = { "source.fixAll.eslint" = "explicit"; };
        "[javascript]" = {
          "editor.defaultFormatter" = "vscode.typescript-language-features";
        };
        "typescript.updateImportsOnFileMove.enabled" = "never";
        "editor.accessibilitySupport" = "off";
        "security.workspace.trust.untrustedFiles" = "open";
        "[dockerfile]" = {
          "editor.defaultFormatter" = "ms-azuretools.vscode-docker";
        };
        "search.maxResults" = 20000;
        "workbench.editor.showTabs" = "single";
        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "azureFunctions.showCoreToolsWarning" = false;
        "checkov.token" = "a4c99388-7243-4846-ac67-51437920fb6a";
        "window.commandCenter" = false;
        "editor.multiCursorLimit" = 15000;
        "workbench.activityBar.location" = "hidden";
        "[yaml]" = { "editor.defaultFormatter" = "redhat.vscode-yaml"; };
        "[json]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
        };
        "cSpell.userWords" =
          [ "boto" "chargeback" "DATASERVICE" "dundle" "karpenter" "Korsit" ];
        "files.autoSave" = "afterDelay";
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "javascript.updateImportsOnFileMove.enabled" = "never";
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "workbench.colorTheme" = "One Dark Pro Darker";
        "[jsonc]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
        };
        "[html]" = {
          "editor.defaultFormatter" = "vscode.html-language-features";
        };
        "gitlab.duoCodeSuggestions.enabled" = true;
        "editor.stickyScroll.enabled" = false;
        "yaml.customTags" = [ "!reference sequence" ];
        "sops.defaults.ageKeyFile" = "/Users/${userName}/.config/sops/age/keys.txt";
        "files.exclude" = {
          "**/.git" = true;
          "**/.svn" = true;
          "**/.hg" = true;
          "**/CVS" = true;
          "**/.DS_Store" = true;
          "**/tmp" = true;
          "**/node_modules" = true;
          "**/bower_components" = true;
          "**/dist" = true;
        };
        "files.watcherExclude" = {
          "**/.git/objects/**" = true;
          "**/.git/subtree-cache/**" = true;
          "**/node_modules/**" = true;
          "**/tmp/**" = true;
          "**/bower_components/**" = true;
          "**/dist/**" = true;
        };
      };
    };
  };

  programs.git = { 
    enable = true;
    delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
      };
    };
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk25_headless;
  };

  programs.gpg = { enable = true; };
}
