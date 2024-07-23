# Dotfiles

Welcome to my dotfiles repository! This repository contains my configuration files for various applications and tools.

## Requirements

Ensure you have the following installed on your system. Use your package manager to install the following packages. I use Arch BTW, so I'll use pacman for this.

### CLI tools

```sh
sudo pacman -S git zsh fzf zoxide alacritty neovim lazygit
```

### Stow

```sh
sudo pacman -S stow
```

### Hyprland, Mako, Waybar, Wlogout, and Rofi

You will need the following packages for the configurations included in this repository. Use an AUR helper of your choice.

```sh
yay -S hyprland hypridle hyprlock mako waybar wlogout rofi
```

### Additional packages

```sh
yay -S swww imagemagick python3 libnotify brightnessctl pavucontrol
```

## Installation

1. **Clone the repository:**

   Open your terminal and run the following commands:

   ```sh
   git clone https://github.com/SanzEev17/dotfiles.git
   cd dotfiles
   ```

2. **Modify gitconfig:**

   Make sure to update the user details in the .gitconfig file using your preferred text editor:

   ```sh
   [user]
      name = Your Name
      email = your.email@example.com
   ```

3. **Use GNU stow to create symlinks:**

   ```sh
   stow .
   ```

## Configurations

This repository includes configurations for the following:

- **Hyprland**: A highly customizable dynamic tiling Wayland compositor.
- **Mako**: A lightweight notification daemon for Wayland.
- **Waybar**: A highly customizable bar for wlroots-based compositors.
- **Wlogout**: A logout menu for Wayland.
- **Rofi**: A window switcher, application launcher, and dmenu replacement.

Feel free to explore the individual configuration files and customize them to your liking.
