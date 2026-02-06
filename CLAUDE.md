# Dotfiles Setup Guide

This repository contains configuration files for setting up a macOS development environment.

## Repository Structure

```
.tmux.conf       - tmux configuration
.vimrc           - Vim configuration with Pathogen plugin manager
.zshenv.template - Environment variables template (copy to ~/.zshenv and fill in values)
keybindings.json - Cursor/VS Code keybindings (vim-style)
```

## Prerequisites

Install these tools before setting up dotfiles:

- **Xcode Command Line Tools**: `xcode-select --install` (includes Git)
- **Homebrew**: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Setup Instructions

### 1. Install rbenv (Ruby version manager)

First check to see if its already installed.

```bash
brew install rbenv ruby-build

# Add to shell config (~/.zshrc)
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

# Reload shell
source ~/.zshrc

# Install a Ruby version
rbenv install 3.3.0  # or desired version
rbenv global 3.3.0
```

### 2. Install nvm (Node version manager)

First check to see if its already installed.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Reload shell (nvm install script adds config to ~/.zshrc automatically)
source ~/.zshrc

# Install a Node version
nvm install --lts
nvm use --lts
```

### 3. Install dev tools

```bash
brew install tmux reattach-to-user-namespace vim fzf
```

### 4. Symlink configuration files

```bash
ln -sf ~/Code/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/Code/dotfiles/.vimrc ~/.vimrc
```

### 5. Set up environment variables

Copy the template and fill in your actual values:

```bash
cp ~/Code/dotfiles/.zshenv.template ~/.zshenv
```

Then edit `~/.zshenv` and replace the placeholder values:

| Variable | Description |
|----------|-------------|
| `GITHUB_TOKEN` | GitHub personal access token |
| `GITHUB_MCP_PAT` | GitHub MCP personal access token |
| `ARTIFACTORY_READ_USER` | Artifactory username |
| `ARTIFACTORY_READ_TOKEN` | Artifactory API token |
| `LOCALSTACK_AUTH_TOKEN` | LocalStack auth token |
| `SSH_AUTH_SOCK` | 1Password SSH agent socket |

The template also configures:
- Artifactory auth for npm, pip, poetry, and bundler
- Work directory paths
- Architecture detection (M1/Intel)

### 6. Set up Vim with Pathogen

```bash
# Create directories
mkdir -p ~/.vim/autoload ~/.vim/bundle

# Install Pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

### 7. Install Vim plugins

Clone these plugins into `~/.vim/bundle/`:

```bash
cd ~/.vim/bundle

# File navigation
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/junegunn/fzf.vim.git

# Git integration
git clone https://github.com/tpope/vim-fugitive.git

# Syntax/linting
git clone https://github.com/dense-analysis/ale.git

# JavaScript/TypeScript
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/maxmellon/vim-jsx-pretty.git
git clone https://github.com/peitalin/vim-jsx-typescript.git

# Ruby
git clone https://github.com/vim-ruby/vim-ruby.git

# Testing
git clone https://github.com/vim-test/vim-test.git
git clone https://github.com/preservim/vimux.git
git clone https://github.com/pgr0ss/vimux-ruby-test.git

# Color scheme
git clone https://github.com/dracula/vim.git dracula
```

### 8. Cursor/VS Code setup

Copy `keybindings.json` to Cursor config:

```bash
# For Cursor
cp ~/Code/dotfiles/keybindings.json ~/Library/Application\ Support/Cursor/User/keybindings.json

# For VS Code
cp ~/Code/dotfiles/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

Install the Vim extension in Cursor/VS Code for these keybindings to work.

## Quick Setup Script

Run this to set up everything at once:

```bash
#!/bin/bash
set -e

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install rbenv
brew install rbenv ruby-build
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Install dev tools
brew install tmux reattach-to-user-namespace vim fzf

# Symlink configs
ln -sf ~/Code/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/Code/dotfiles/.vimrc ~/.vimrc

# Copy env template (fill in values manually after)
cp ~/Code/dotfiles/.zshenv.template ~/.zshenv

# Set up Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Clone vim plugins
cd ~/.vim/bundle
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/dense-analysis/ale.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/leafgarland/typescript-vim.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/maxmellon/vim-jsx-pretty.git
git clone https://github.com/peitalin/vim-jsx-typescript.git
git clone https://github.com/vim-ruby/vim-ruby.git
git clone https://github.com/vim-test/vim-test.git
git clone https://github.com/preservim/vimux.git
git clone https://github.com/pgr0ss/vimux-ruby-test.git
git clone https://github.com/dracula/vim.git dracula

echo "Setup complete!"
echo "Restart your shell, then run:"
echo "  rbenv install 3.3.0 && rbenv global 3.3.0"
echo "  nvm install --lts && nvm use --lts"
```
