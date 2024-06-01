# Dotfiles

Welcome to my dotfiles repository! This repository contains my configuration files for various applications and tools.

## Requirements

Ensure you have the following installed on your system. Use your package manager to install following packages. I use Arch BTW so I'll use pacman for this.

### Git

```
sudo pacman -S git
```

### Stow

```
sudo pacman -S stow
```

## Installation

1. **Clone the repository:**

   Open your terminal and run the following commands:

   ```sh
   $ git clone https://github.com/SanzEev17/dotfiles.git
   $ cd dotfiles

   ```
   
2. **Modify gitconfig:**
   
   Make sure to update the user details in the .gitconfig file using your preferred text editor:
   
   ```sh
   [user]
      name = Your Name
      email = your.email@example.com
   ```
3. **Use GNU stow to create symlinks:**

   ```
   $ stow .
   ```
