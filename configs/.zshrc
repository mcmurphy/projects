#------------------------------
# Options for zsh
#------------------------------

autoload -U compinit; compinit

#------------------------------
# Variables
#------------------------------

# Additional exports
export PATH=$PATH:/home/rusty/.bin
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.utf8

# source some files
[ -f ~/.shell_functions ] && source $HOME/.shell_functions
[ -f ~/.shell_alias ] && source $HOME/.shell_alias

LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#------------------------------
# History stuff
#------------------------------

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=5000

#------------------------------
# Options
#------------------------------

unsetopt BEEP                   # i hate beeps
#setopt AUTOCD                   # change to dirs without cd
#setopt CDABLE_VARS              # If not a directory and does not begin with a slash, try to expand as if it were preceded by a `~'
setopt NOMATCH                  # if no match then print an error
setopt AUTO_PUSHD               # automatically append dirs to the push/pop list
setopt PUSHD_IGNORE_DUPS        # and don't duplicate them
setopt NO_CHECK_JOBS            # don't warn me about bg processes when exiting
setopt NO_HUP                   # and don't kill them, either
setopt LIST_PACKED              # compact completion lists
setopt NO_LIST_TYPES            # show types in completion
setopt EXTENDED_GLOB            # weird & wacky pattern matching - yay zsh!
setopt COMPLETE_IN_WORD         # not just at the end
setopt ALWAYS_TO_END            # when complete from middle, move cursor
setopt CORRECT                  # spelling correction
#setopt NO_PROMPT_CR             # don't add \r which overwrites output of cmds with no \n
setopt INTERACTIVE_COMMENTS     # escape commands so i can use them later
setopt REC_EXACT                # recognise exact, ambiguous matches
setopt PRINT_EXIT_VALUE         # alert me if something's failed
setopt HIST_VERIFY              # when using ! cmds, confirm first
#setopt APPEND_HISTORY          # don't overwrite history 
setopt HIST_REDUCE_BLANKS       # ?
setopt HIST_IGNORE_SPACE        # ignore commands that have a leading space
setopt HIST_IGNORE_DUPS         # ignore same commands run twice+
setopt HIST_SAVE_NO_DUPS        # older commands that duplicate are omitted
#setopt SHARE_HISTORY           # _all_ zsh sessions share the same history files
#setopt SH_WORD_SPLIT           # ?
#setopt EXTENDED_HISTORY        # timestamp history

#setopt autopushd pushdminus pushdsilent pushdtohome
#setopt CDABLE_VARS             #  If not a directory and does not begin with a slash, try to expand as if it were preceded by a `~'
#setopt IGNORE_EOF              # ?
#setopt NO_BANG_HIST            # ?
#setopt NO_CLOBBER              # ?

#------------------------------
# Prompt
#------------------------------

# PS1 and PS2
#export PS1="┌─[$(print '%{\e[0;33m%}%T%{\e[0m%}')] $(print '[%{\e[1;34m%}%d%{\e[0m%}')]
#└─> "
export PS1="[$(print '%{\e[0;33m%}%T%{\e[0m%}')] $(print '[%{\e[1;34m%}%d%{\e[0m%}')]
> "
#export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"
#RPROMPT='%?'

# Arch 32bit chroot PS1
#if [[ -f /inside_chroot ]]; then
#    export PS1="[$(print '%{\e[0;33m%}%T%{\e[0m%}')] $(print '[%{\e[1;34m%}Arch32 %d%{\e[0m%}')]
#> "
#fi

#------------------------------
# Prog & Less settings
#------------------------------

# Vars used later on by zsh
export EDITOR="vim"
export VISUAL="vim"
export BROWSER="icecat"
export PAGER="less"
export NNTPSERVER='news.madasafish.com'   # newsreader server

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#------------------------------
# Make life easier
#------------------------------

# Add colors to completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# cd not select parent dir. 
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# Ignore completion functions for commands you don't have:
zstyle ':completion:*:functions' ignored-patterns '_*'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# Group matches and Describe
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[1;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[1;34m -- %d --\e[0m'
zstyle ':completion:*:corrections' format $'\e[1;34m -- %B%d -- (errors: %e)%b --\e[0m'
zstyle ':completion:*:warnings' format $'\e[1;31m -- No Matches Found --\e[0m'

#------------------------------
# Key Bindings 
#------------------------------

# http://mundy.yazzy.org/unix/zsh.php
# http://www.zsh.org/mla/users/2000/msg00727.html

typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 

#------------------------------
# Some Aliases 
#------------------------------

# Set up auto extension stuff
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feg
alias -s gz=tar -xzvf
alias -s bz2=tar -xjvf
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR
#alias -s sxw=soffice
#alias -s doc=soffice

# Normal aliases
alias ls='ls --group-directories-first --color=auto -F'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find | grep'
alias cl='clear'
alias dir='ls -1'
#alias ..='cd ..'
alias hist='grep '$1' /home/rusty/.zsh_history'
alias irssi='irssi -c irc.freenode.net -n yyz'
alias mem='free -m'
alias paclist='sudo pacman -Qqe | grep -v "$(pacman -Qmq)" > /mnt/media/backups/pkglist'
alias repo-update='sudo repo-add /mnt/media/zen-repo/zen-repo.db.tar.gz /mnt/media/zen-repo/*.pkg.tar.gz'

# pacman alias for 32bit chroot
#alias pacman32="sudo pacman --root /opt/arch32 --cachedir /opt/arch32/var/cache/pacman/pkg --config /opt/arch32/pacman.conf"

# command L equivalent to command |less
alias -g L='| less' 

# command S equivalent to command &> /dev/null &
alias -g S='&> /dev/null &'

# type a directory's name to cd to it.
compctl -/ cd

# Auto Login to X
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
#  startx
#  logout
#fi
