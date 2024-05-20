# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

for sd_cmd in systemctl systemd-analyze systemd-run; do
	alias $sd_cmd='DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus" '$sd_cmd
done

# Extra config 
setopt no_bare_glob_qual

XDG_DOWNLOAD_DIR=~/Descargas
JAVA_HOME=/usr/lib/jvm/java-17-jdk

# Environment
export GTK_USE_PORTAL=1
export GDK_DEBUG=portals
export XDG_OPEN_USE_PORTAL=1
export EDITOR=vim
export BROWSER=firefoxdeveloperedition
export BAT_THEME="Catppuccin-mocha"
export POWERLEVEL9K_LEGACY_ICON_SPACING=true

# End of lines configured by zsh-newuser-install
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set up the prompt
#autoload -Uz promptinit
#promptinit

#setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Functions
# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# Node Version Manager
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# Manual aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias hdd='cd /run/media/criptorockstar/9283fac6-bf3a-4952-8757-95def77cc21e/'
alias music='ncmpcpp'
alias pirate='noglob pirate'
alias gitui='gitui -t mocha.ron'
alias npm ='pnpm'
alias vim='nvim'
alias gvim='nvim'

# User Configs
#
# Zsh Plugins
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-auto-notify/auto-notify.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-extract/extract.plugin.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Vars
export CDPATH=.,**

# ~/.local/bin
export PATH=~/.local/bin:$PATH

# nnn
NNN_PLUG='p:preview-tabbed;f;fzopen;i;imgview;1;wall;2;wall2'
export NNN_FIFO=/tmp/nnn.fifo
typeset -A key

# Delete key fix on ST
key[Delete]=${terminfo[kdch1]}
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Rust
source "$HOME/.cargo/env"

# Android
export ANDROID_HOME=$HOME/.config/android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
