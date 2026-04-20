# dotfiles

My personal configuration files for macOS development environment.

## What's Included

- **Neovim**: Full LazyVim configuration with custom plugins and settings
- **Starship**: Cross-shell prompt configuration
- **Zsh**: Custom shell functions and prompt configurations

## Prerequisites

Before installing, ensure you have the following installed:

- [Neovim](https://neovim.io/) (>= 0.9.0)
- [Starship](https://starship.rs/) prompt
- Tmux
- Zsh shell
- Git

### macOS Installation

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required packages
brew install neovim starship

# Install maccy (better clipboard)
brew install --cask maccy

# Tmux Package Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.config
```

### 2. Zsh Configuration

Add the following to your `~/.zshrc`:

```bash
for file in ~/.config/zsh/*.zsh; do
  [ -f "$file" ] && source "$file"
done

# Add Plugins
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# Enable color support
autoload -Uz colors && colors

# Set completion style
zstyle ':completion:*' menu select

# Initialize Starship prompt
 eval "$(starship init zsh)"
```
