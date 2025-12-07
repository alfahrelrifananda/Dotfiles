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
- **Editor**: [Neovim](https://neovim.io/) - Hyperextensible Vim-based text editor
- **Audio Visualizer**: [Cava](https://github.com/karlstav/cava) - Console-based audio visualizer
- **Music Player**: [musikcube](https://github.com/clangen/musikcube) - Terminal-based music player
- **Media Player**: [mpv](https://mpv.io/) - Lightweight media player / [Celluloid](https://celluloid-player.github.io/) - GTK frontend for mpv
- **File Manager**: [Ranger](https://github.com/ranger/ranger) - Console file manager / [Thunar](https://docs.xfce.org/xfce/thunar/start) - Modern file manager
- **Wallpaper Manager**: [waypaper](https://github.com/anufrievroman/waypaper) - GUI wallpaper setter for Wayland
- **IRC Client**: [WeeChat](https://weechat.org/) - Extensible chat client
- **Bluetooth Manager**: [bluetuith](https://github.com/darkhz/bluetuith) - TUI-based Bluetooth manager

### Prerequisites

Make sure you have the following installed:
- Hyprland
- Hyprlock
- Waybar
- Wofi
- Kitty
- Fastfetch
- Neovim
- Cava
- musikcube
- mpv / Celluloid
- Ranger / Thunar
- waypaper
- WeeChat
- bluetuith
- Python 3 (for custom Waybar modules)

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
cp -r ~/.config/nvim ~/.config-backup/ 2>/dev/null
cp -r ~/.config/cava ~/.config-backup/ 2>/dev/null
cp -r ~/.config/musikcube ~/.config-backup/ 2>/dev/null
cp -r ~/.config/mpv ~/.config-backup/ 2>/dev/null
cp -r ~/.config/ranger ~/.config-backup/ 2>/dev/null
cp -r ~/.config/weechat ~/.config-backup/ 2>/dev/null
```

3. Copy the configuration files:
```bash
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r wofi ~/.config/
cp -r kitty ~/.config/
cp -r fastfetch ~/.config/
cp -r nvim ~/.config/
cp -r cava ~/.config/
cp -r musikcube ~/.config/
cp -r mpv ~/.config/
cp -r ranger ~/.config/
cp -r waypaper ~/.config/
cp -r weechat ~/.config/
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

## Customization

Feel free to modify any configuration files to suit your preferences. Key files:
- `hypr/hyprland.conf` - Main Hyprland configuration and keybindings
- `waybar/config` - Waybar modules and layout
- `waybar/style.css` - Waybar appearance
- `wofi/style.css` - Application launcher styling
- `kitty/kitty.conf` - Terminal emulator settings
- `nvim/` - Neovim configuration
- `btop/btop.conf` - System monitor settings
- `cava/config` - Audio visualizer configuration
- `ranger/rc.conf` - File manager settings

## Credits

- Hyprland community for the amazing compositor
- All the open-source projects that make this setup possible

*Last updated: December 2025*
