#!/bin/bash

export MOZ_USE_XINPUT2=1

export SHELL=bash
export BROWSER=firefox
export EDITOR=vim
export READER=zathura
export FILE=lf
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath '/home/user/.local/bin'
appendpath '/home/user/.local/bin/Discord'
unset appendpath

export PATH

export LF_ICONS="di=:\
fi=󰈙:\
ln=󰌹:\
ex=:\
ow=:\
or=:\
*.text=󰈙:\
*.mom=󰈙:\
*.ms=󰈙:\
*.me=󰈙:\
*.pdf=:\
*.png=:\
*.webp=:\
*.ico=:\
*.gif=:\
*.tif=:\
*.tiff=:\
*.svg=:\
*.jpg=󰄀:\
*.jpe=󰄀:\
*.jpeg=󰄀:\
*.html=:\
*.mp4=󰨘:\
*.mkv=󰨘:\
*.webm=󰨘:\
*.avi=󰨘:\
*.mov=󰨘:\
*.mpg=󰨘:\
*.wmv=󰨘:\
*.m4b=󰨘:\
*.mpeg=󰨘:\
*.flv=󰨘:\
*.zip=:\
*.rar=:\
*.7z=:\
*.tar=:\
*.gz=:\
*.stl=󰆧:\
*.mp3=:\
*.opus=:\
*.ogg=:\
*.m4a=:\
*.blend=󱥎:\
*.z64=󰊴:\
*.v64=󰊴:\
*.n64=󰊴:\
*.gba=󰊴:\
*.nes=󰊴:\
*.gdi=󰊴:\
*.py=󰌠:\
*.doc=:\
*.docx=:\
*.xls=:\
*.xlsx=:\
*.ppt=:\
*.pptx=:\
*.info=󰋼:\
*.nfo=󰋼:\
*.1=󰋼:\
"
