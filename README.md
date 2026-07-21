# dotfiles

My personal configuration files for macOS / Linux environments.

## What's Included

- **Neovim**: Full LazyVim configuration with custom plugins and settings
- **Oh My Zsh**: Shell framework with Powerlevel10k prompt
- **Tmux**: Config with TPM-managed plugins (cpu/ram status, session persistence, prefix highlighting)
- **Ghostty**: Terminal emulator settings (`ghostty_settings` — copy/symlink into Ghostty's config location; see below)

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/sidtuladhar/dotfiles.git ~/.config
```

### 2. Install Packages

**macOS:**

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required packages
brew install neovim tmux

# Install maccy (better clipboard)
brew install --cask maccy
```

**Linux (Debian/Ubuntu; use dnf/pacman for other distros):**

```bash
sudo apt update
sudo apt install neovim tmux zsh git
```

### 3. Install Oh My Zsh and Powerlevel10k

```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k as an Oh My Zsh custom theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh-syntax-highlighting and zsh-autosuggestions as Oh My Zsh custom plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### 4. Zsh Configuration

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
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```

### 5. Tmux Plugins

Install TPM (Tmux Plugin Manager) into the cloned config, then let it install the rest:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Start tmux, then press `prefix + I` (capital I) to fetch and install all plugins listed in `tmux/tmux.conf`.

### 6. Ghostty (optional)

Copy or symlink `ghostty_settings` to Ghostty's config location:

```bash
# macOS
ln -sf ~/.config/ghostty_settings "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# Linux
mkdir -p ~/.config/ghostty
ln -sf ~/.config/ghostty_settings ~/.config/ghostty/config
```
