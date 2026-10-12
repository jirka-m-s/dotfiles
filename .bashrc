#
# ~/.bashrc
#

eval "$(starship init bash)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Created by `pipx` on 2026-05-12 09:37:39
export PATH="$PATH:/home/jirka/.local/bin"

fastfetch --logo-type small --structure Title:Separator:OS:Kernel:WM:Uptime:Memory:Disk
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
