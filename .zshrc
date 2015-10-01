# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
bindkey -v
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/moogtrain/.zshrc'

autoload -U colors
colors

autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

prompt suse

[[ -t 1 ]] || return
case $TERM in
    *xterm*|*rxvt*|(dt|k|E|a)term)
    preexec () {
        #print -Pn "\e]2;[%l] [%n@%m] <$1>\a"                # original code (see above)
        print -Pn "\e]2;%l [${COLUMNS}x${LINES}] :: $1\a"    # edited; %n@%m omitted, as I know who and where I am
    }
    ;;
    screen*)
        preexec () {
        print -Pn "\e\"$1\e\134"
    }
  ;;
esac

lr_PATH=/home/moogtrain/Code/Root

alias lr_PKG_CONFIG_PATH='PKG_CONFIG_PATH=$lr_PATH/lib/pkgconfig'
alias lr_LD_LIBRARY_PATH='LD_LIBRARY_PATH=$lr_PATH/lib'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias aura='sudo aura --color=auto'
alias pacman='sudo pacman --color=auto'
alias wine32env='WINEARCH=win32 WINEPREFIX=~/.wine32'
alias wine32='wine32env wine'

alias ncmpcpp='/usr/local/bin/ncmpcpp'

alias scrb0='su -c "echo 0 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb1='su -c "echo 1 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb2='su -c "echo 2 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb3='su -c "echo 3 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb4='su -c "echo 4 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb5='su -c "echo 5 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb6='su -c "echo 6 > /sys/class/backlight/acpi_video0/brightness"'
alias scrb7='su -c "echo 7 > /sys/class/backlight/acpi_video0/brightness"'
