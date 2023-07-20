# Luke's config for the Zoomer Shell
# I stole this and made some minor changes

#------------------------------
# Window title
#------------------------------
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|st-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;zsh\a"
    } 
    preexec () { print -Pn "\e]0;$1\a" }
    ;;
  screen|screen-256color)
    precmd () { 
      vcs_info
      #print -Pn "$1" 
      #print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
	  print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" 
    }
    preexec () { 
      #print -Pn "$1" 
      #print -Pn "$1" 
	  printf "\033]0;%s\a" "$1"
    }
    ;; 
esac

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[blue]%}[%{$fg[blue]%}%~%{$fg[blue]%}]%{$blue%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

autoload -Uz vcs_info

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

cleanup() {
    exec 3>&-
	rm "$FIFO_UEBERZUG"
}

# Use lf to switch directories
lfcd () {
	#LF_TEMPDIR="$(mktemp -d -t lf-tempdir-XXXXXX)"
	#LF_TEMPDIR="$LF_TEMPDIR" lf-run -last-dir-path="$LF_TEMPDIR/lastdir" "$@"
	#if [ "$(cat "$LF_TEMPDIR/cdtolastdir" 2>/dev/null)" = "1" ]; then
	#	cd "$(cat "$LF_TEMPDIR/lastdir")"
	#fi
	#rm -r "$LF_TEMPDIR"
	#unset LF_TEMPDIR
	tmp="$(mktemp)"
	lfub -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		if [ -d "$dir" ]; then
			if [ "$dir" != "$(pwd)" ]; then
				cd "$dir"
			fi
		fi
	fi
}

bindkey -s '^u' 'lfcd\n'

bindkey '^[[P' delete-char

# aliases
alias lf="lfcd"
#alias vim="nvim"
alias xorg_testing="Xephyr -ac -br -noreset -screen 1920x1080 :1"
alias ls='ls --color=auto'

if [ "$START_LF" = "true" ]; then
	lfcd
fi
