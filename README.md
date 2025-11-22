# Hyprland Dotfiles

My personal configuration files for a minimal and efficient Wayland desktop environment.

## Screenshot

![Desktop Screenshot](./ss.png)

## Components

- **Window Manager**: [Hyprland](https://hyprland.org/) - A dynamic tiling Wayland compositor
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) - Highly customizable Wayland bar with custom modules
- **Application Launcher**: [Wofi](https://hg.sr.ht/~scoopta/wofi) - A launcher/menu program for wlroots compositors
- **Terminal**: [Kitty](https://sw.kovidgoyal.net/kitty/) - A fast, feature-rich GPU-based terminal emulator
- **System Info**: [Fastfetch](https://github.com/fastfetch-cli/fastfetch) - A neofetch-like tool with multiple presets

## Features

- Clean and minimal aesthetic
- Optimized keybindings for productivity
- **Custom Waybar modules**:
  - Real-time internet speed monitor
  - CPU usage graph with sparkline visualization
  - Weather information with OpenWeatherMap integration
  - VPN status and toggle functionality
  - Power menu
- Wofi configuration for quick application launching
- Multiple Fastfetch presets and custom ASCII art
- Smooth animations and transitions
- Hypridle and Hyprlock for idle management and screen locking
- Custom fonts (JetBrains Mono Nerd Font, SF Pro Display)

## Installation

### Prerequisites

Make sure you have the following installed:
- Hyprland
- Waybar
- Wofi
- Kitty
- Fastfetch
- Python 3 (for custom Waybar modules)
- hypridle and hyprlock (optional, for idle management)

### Setup

1. Clone this repository:
```bash
git clone https://github.com/alfahrelrifananda/dotfiles.git
cd dotfiles
```

2. Backup your existing configs (if any):
```bash
mkdir -p ~/.config-backup
cp -r ~/.config/hypr ~/.config-backup/ 2>/dev/null
cp -r ~/.config/waybar ~/.config-backup/ 2>/dev/null
cp -r ~/.config/wofi ~/.config-backup/ 2>/dev/null
cp -r ~/.config/kitty ~/.config-backup/ 2>/dev/null
cp -r ~/.config/fastfetch ~/.config-backup/ 2>/dev/null
```

3. Copy the configuration files:
```bash
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r kitty ~/.config/
cp -r fastfetch ~/.config/
```

4. Make Waybar scripts executable:
```bash
chmod +x ~/.config/waybar/*.py
chmod +x ~/.config/waybar/*.sh
```

5. Configure custom modules:
   - Edit `~/.config/waybar/weather.py` and add your OpenWeatherMap API key
   - Adjust city name and other settings as needed

6. Install fonts (optional):
```bash
mkdir -p ~/.local/share/fonts
cp -r hypr/Fonts/* ~/.local/share/fonts/
fc-cache -fv
```

7. Reload Hyprland or log out and log back in

## Waybar Custom Modules

### Internet Speed Monitor
Real-time network speed display showing combined download/upload in MB/s.

### CPU Graph
Live CPU usage with a sparkline graph showing the last 10 readings.

### Weather
Current weather information using OpenWeatherMap API. Requires free API key from [OpenWeatherMap](https://openweathermap.org/api).

### VPN Status & Toggle
Monitor and control VPN connection status.

### Power Menu
Quick access to power options (shutdown, reboot, logout, etc.).

## Fastfetch Presets

Multiple preset configurations available in `fastfetch/presets/`:
- `minimal.jsonc` - Minimalist system info
- `full-info.jsonc` - Comprehensive system details
- `ascii-art.jsonc` - Custom ASCII art display
- `arch.jsonc` - Arch Linux themed
- `hypr.jsonc` - Hyprland themed
- `nyarch.jsonc` - Nyarch themed

## Customization

Feel free to modify any configuration files to suit your preferences. Key files:
- `hypr/hyprland.conf` - Main Hyprland configuration and keybindings
- `waybar/config` - Waybar modules and layout
- `waybar/style.css` - Waybar appearance
- `wofi/style.css` - Application launcher styling
- `kitty/kitty.conf` - Terminal emulator settings

## Credits

- Hyprland community for the amazing compositor
- All the open-source projects that make this setup possible

*Last updated: November 2025*
