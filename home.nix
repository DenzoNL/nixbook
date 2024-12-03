{ pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "d.bogers";

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
  home.packages = with pkgs;[
    # Nix-specific packages
    nixd
    # DevOps tools
    argocd
    awscli2
    aws-sam-cli
    bruno
    k9s
    kubectl
    kubernetes-helm
    ssm-session-manager-plugin
    terraform
    popeye
    # Development tools
    firebase-tools
    mariadb
    nodejs-18_x
    iterm2
    jdk21
    maven
    # Container tools
    dive
    # Security
    gobuster
    john
    nmap
    sqlmap
    # Communications
    discord
    slack
    # Utility apps
    slides
    # Random shell stuff
    fd
    ripgrep
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable direnv
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    syntaxHighlighting = {
      enable = true;
    };
    initExtra = ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi

      if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
        export PATH=/opt/homebrew/opt/ruby/bin:$PATH
        export PATH=`gem environment gemdir`/bin:$PATH
      fi

      if [ -d "$HOME/.cargo/bin" ]; then
        export PATH=$HOME/.cargo/bin:$PATH
      fi

      eval "$(/opt/homebrew/bin/brew shellenv)"
      export PATH="$(brew --prefix)/opt/python@3.12/libexec/bin:$PATH"
      export PATH=$HOME/.local/bin:$PATH

      export JAVA_HOME=${pkgs.jdk21.home}
    '';
    shellAliases = {
      k = "kubectl";
      tf = "terraform";
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
       }
       {
         name = "powerlevel10k-config";
         src = lib.cleanSource ./p10k-config;
         file = "p10k.zsh";
       }
    ];
  };

  # Configure my IDE, VSCode
  programs.vscode = {
    enable = true;
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
      rust-lang.rust-analyzer
      yzhang.markdown-all-in-one
      zhuangtongfa.material-theme
    ];
    userSettings = {
      "workbench.startupEditor" = "none";
      "editor.inlineSuggest.enabled" = true;
      "editor.fontFamily" = "'CaskaydiaCove Nerd Font', Menlo, Monaco, 'Courier New', monospace";
      "terminal.integrated.fontFamily" = "'CaskaydiaCove Nerd Font', Menlo, Monaco, 'Courier New', monospace";
      "terminal.integrated.defaultLocation" = "editor";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;
      "terminal.integrated.fontSize" = 15;
      "[markdown]" = {
        "editor.formatOnSave" = true;
      };
      "[rust]" = {
        "editor.formatOnSave" = true;
      };
      "editor.codeActionsOnSave" = {
        "source.fixAll.eslint" = "explicit";
      };
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
      "[yaml]" = {
        "editor.defaultFormatter" = "redhat.vscode-yaml";
      };
      "[json]" = {
        "editor.defaultFormatter" = "vscode.json-language-features";
      };
      "cSpell.userWords" = [
        "boto"
        "chargeback"
        "DATASERVICE"
        "dundle"
        "karpenter"
        "Korsit"
      ];
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
    };
  };

  programs.git = {
    enable = true;
  };

  programs.gpg = {
    enable = true;
  };
}
