# dotfiles

My personal configuration files for macOS development environment.

## What's Included

- **Neovim**: Full LazyVim configuration with custom plugins and settings
- **Oh My Zsh**: Shell framework with Powerlevel10k prompt

## Prerequisites

Before installing, ensure you have the following installed:

- [Neovim](https://neovim.io/) (>= 0.9.0)
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt
- Tmux
- Zsh shell
- Git

### macOS Installation

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required packages
brew install neovim powerlevel10k

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
export ZSH="$HOME/.oh-my-zsh"
plugins=(git colored-man-pages sudo z zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Enable color support
autoload -Uz colors && colors

# Set completion style
zstyle ':completion:*' menu select

# Initialize Powerlevel10k prompt
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```

Clone `zsh-syntax-highlighting` and `zsh-autosuggestions` into `$ZSH_CUSTOM/plugins/` (default: `~/.oh-my-zsh/custom/plugins/`) so Oh My Zsh can load them:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
