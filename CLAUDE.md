# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Nix flake repository for configuring a macOS workstation using:
- **nix-darwin**: macOS system configuration management
- **home-manager**: User environment and package management
- **nixvim**: Neovim configuration as code
- **homebrew**: Managed declaratively for GUI applications and macOS-specific tools

## Key Commands

### System Rebuild
```bash
# Rebuild the entire system configuration (alias defined in flake.nix:67)
rebuild

# Full command if alias not available
sudo darwin-rebuild switch --flake /Users/d.bogers/nixbook
```

### Nix Development
```bash
# Format Nix files (nixfmt-classic is installed)
nixfmt-classic *.nix

# Update flake inputs
nix flake update

# Check flake configuration
nix flake check
```

## Architecture

### Configuration Structure
- **flake.nix**: Entry point defining the Darwin system configuration for "Denniss-MacBook-Pro"
- **home.nix**: User-specific packages and programs (DevOps tools, development environments, shell configuration)
- **homebrew.nix**: Declarative Homebrew casks and brews for GUI applications
- **nixvim.nix**: Complete Neovim IDE configuration with LSP, treesitter, and plugins

### Key Design Patterns
1. **User Configuration**: Username "d.bogers" is parameterized throughout configs
2. **Shell Setup**: Fish shell is the default with starship prompt, direnv integration
3. **Development Tools**: Pre-configured for Rust, TypeScript/JavaScript, Java, Terraform, and Nix development
4. **Editor Integration**: VS Code and Neovim both configured with consistent tooling

### Important Configuration Details
- Platform: aarch64-darwin (Apple Silicon Mac)
- Default shell: Fish with custom aliases for modern CLI replacements (eza→ls, bat→cat, dust→du)
- Touch ID enabled for sudo operations
- Homebrew auto-updates on activation with aggressive cleanup ("zap")

## Current TODO Items (from README.md)
- Manage secrets through sops-nix and/or age (SSH key, GPG key)
- IntelliJ IDEs and their configs
- More thorough VS Code configuration
- Less janky oh-my-zsh setup
- Move apps to home-manager, declarative homebrew or mas
- Find and set custom macOS settings declaratively