# .bashrc
alias chromium='chromium --ozone-platform=wayland'
alias jam='tty-clock -c -C 7 -f "%A %B %d %Y" -s -S -b'
alias vim='nvim'
alias vi='nvim'
alias codeoss='code-oss'
# Set .NET 9 as default
export DOTNET_ROOT=/opt/dotnet
export PATH="/opt/dotnet:$PATH"

# Function to switch to .NET 8 when needed
dotnet8() {
  export DOTNET_ROOT=/opt/dotnet
  export PATH="/opt/dotnet:$(echo $PATH | sed 's|/opt/dotnet9:||')"
  echo "Switched to .NET 8"
  dotnet --version
}

# Function to switch back to .NET 9
dotnet9() {
  export DOTNET_ROOT=/opt/dotnet9
  export PATH="/opt/dotnet9:$(echo $PATH | sed 's|/opt/dotnet:||')"
  echo "Switched to .NET 9"
  dotnet --version
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# XDG Runtime Directory
# if [ -z "$XDG_RUNTIME_DIR"]; then
#	export XDG_RUNTIME_DIR="/run/user/$(id -u)"
# fi

#Wayland specific
#export XDG_SESSION_TYPE=wayland
#export XDG_CURRENT_DESKTOP=Hyprland
#export XDG_SESSION_DESKTOP=Hyprland
eval "$(starship init bash)"
export PATH="$HOME/development/flutter/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/chromium
export PATH=$PATH:/opt/dotnet
export DOTNET_ROOT=/opt/dotnet
