# Hyprland Dotfiles

My personal configuration files for a minimal and efficient Wayland desktop environment.

## Screenshot

![Desktop Screenshot](./ss.png)

## Components

- **Window Manager**: [Hyprland](https://hyprland.org/) - A dynamic tiling Wayland compositor
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) - Highly customizable Wayland bar
- **Application Launcher**: [Wofi](https://hg.sr.ht/~scoopta/wofi) - A launcher/menu program for wlroots compositors

## Features

- Clean and minimal aesthetic
- Optimized keybindings for productivity
- Custom Waybar modules and styling
- Wofi configuration for quick application launching
- Smooth animations and transitions

## Installation

### Prerequisites

Make sure you have the following installed:
- Hyprland
- Waybar
- Wofi
- A Wayland-compatible terminal emulator

### Setup

1. Clone this repository:
```bash
git clone https://github.com/alfahrelrifananda/dotfiles.git
cd dotfiles
```

2. Backup your existing configs (if any):
```bash
mkdir -p ~/.config-backup
cp -r ~/.config/hypr ~/.config-backup/
cp -r ~/.config/waybar ~/.config-backup/
cp -r ~/.config/wofi ~/.config-backup/
```

3. Copy the configuration files:
```bash
cp -r .config/hypr ~/.config/
cp -r .config/waybar ~/.config/
cp -r .config/wofi ~/.config/
```

4. Reload Hyprland or log out and log back in

## Configuration

### Hyprland
Main configuration: `~/.config/hypr/hyprland.conf`

### Waybar
- Config: `~/.config/waybar/config`
- Style: `~/.config/waybar/style.css`

### Wofi
- Config: `~/.config/wofi/config`
- Style: `~/.config/wofi/style.css`

*Last updated: November 2025*
