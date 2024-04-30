# Dotfiles

My collection of dotfiles managed by [chezmoi](https://www.chezmoi.io/). Feel free to take things you like at your own risk.

## Installation

First install chezmoi
```bash
# for macos with Homebrew installed
brew install chezmoi

# or using curl
sh -c "$(curl -fsLS get.chezmoi.io)"
```

Then install my dotfiles with

```bash
chezmoi init --apply https://github.com/jacksongross/dotfiles.git
```

That's it! Everything should then be setup to be productive.
