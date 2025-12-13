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
```

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.config
```

### 2. Zsh Configuration

Add the following to your `~/.zshrc`:

```bash
# Source custom zsh configurations
if [ -f ~/.config/zsh/functions.zsh ]; then
    source ~/.config/zsh/functions.zsh
fi

if [ -f ~/.config/zsh/prompt.zsh ]; then
    source ~/.config/zsh/prompt.zsh
fi

# Initialize Starship prompt
eval "$(starship init zsh)"
```
