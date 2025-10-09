# Dotfiles

A collection of my personal dotfiles for Arch Linux, managed using GNU Stow.

## Requirements

Make sure the following are installed:

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation & Configuration

Clone the repository and navigate into it. You can use SSH:

```
git clone git@github.com:GoLab18/dotfiles.git
cd dotfiles
```

Use GNU Stow to create symlinks for the configuration packages specified. For example, to install the Kitty configuration:

```
stow kitty
```

Repeat for any other packages to set them up.
