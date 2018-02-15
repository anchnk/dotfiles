# vim: foldmethod=marker foldlevel=0

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

#if [ "$color_prompt" = yes ]; then
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]: \
  #\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || \
    eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#------------------------------------------------------------------------------
#                              CUSTOMIZATION START
#------------------------------------------------------------------------------

# PROMPT -------------------------------------------------------------------{{{
p_chroot() {
  echo "${debian_chroot:+($debian_chroot)}"
}

p_cwd() {
  bold=$(tput bold)
  blue=$'\e[34m'
  printf "\[%s\]\[%s\]\w" "$bold" "$blue"
}

p_prompt() {
  prompt_symbol="›"
  default=$'\e[00m'
  printf "\n\[%s\]%s \[%s\]" "$1" $prompt_symbol $default
}

p_git_branch() {
  branch=$(git symbolic-ref -q --short HEAD 2> /dev/null)
  if [ -n "$branch" ]; then
    local pink=$'\e[31m'
    git_branch_symbol=$(echo -e '\u2387')
  fi
  echo "$pink$git_branch_symbol  $branch"
}

p_node() {
  if [ -f 'package.json' ]; then
    node_logo=$(echo -e '\u2b22')
    node=$(node -v | sed "s/v/$node_logo\ /g")
  fi
  green=$'\e[32m'
  printf "%s%s" "$green" "$node"
}

set_cursor_color() {
  echo -ne '\e]12;#ff79c6\a'
}

export PROMPT_COMMAND=set_prompt

set_prompt() {
  local ex=$?
  local pink=$'\e[31m'
  local green=$'\e[32m'
  [[ "$ex" -ne 0 ]] && ex_color=$pink || ex_color=$green
  PS1="\$(p_chroot)$(p_cwd) \$(p_git_branch) \$(p_node)$(p_prompt $ex_color)"
  set_cursor_color
}
# --------------------------------------------------------------------------}}}

# OLD PROMPT ---------------------------------------------------------------{{{
## Prompt Configuration
# Colors
# bold=$(tput bold)
# blue=$'\e[34m'
# pink=$'\e[31m'
# default=$'\e[00m'
# green=$'\e[32m'
# space=' '

# Add git branch if its present to PS1
# parse_git_branch() {
  # local GIT_BRANCH_SYMBOL
  # GIT_BRANCH_SYMBOL=$(echo -e '\u2387')
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/'"$GIT_BRANCH_SYMBOL"'  \1/'
# }

# Returns 0 if a current folder is versionned by git, 1 otherwise
# is_git_versionned() {
  # git_branch=$(git branch &> /dev/null)
  # if [ $?  -eq 0 ]; then
    # return 0
  # else
    # return 1
  # fi
# }

# Returns 0 if current folder has package.json, 1 otherwise
# is_node_project() {
  # if [ -f 'package.json' ]; then
    # return 0
  # else
    # return 1
  # fi
# }

# Parse and pretty print active node version
# get_node_version() {
  # node_logo=$(echo -e '\u2b22')
  # node -v | sed "s/v/$node_logo\ /g"
# }

# is_exit_status_ok() {
  # if [ "$1" -eq 0 ]; then
    # return 0
  # else
    # return 1
  # fi
# }

# Custom function that change $PS1 dynamically
# PROMPT_COMMAND='
# exit="$?"
# branch="";\
# node_version="";\
# previous_exit_status_color="";\
# if is_git_versionned; then\
  # branch=$(parse_git_branch);\
# fi;\
# if is_node_project; then\
  # node_version=$(get_node_version);\
# fi;\
# if is_exit_status_ok $exit; then\
  # previous_exit_status_color=${green};\
# else\
  # previous_exit_status_color=${pink};\
# fi'

# if [ "$color_prompt" = yes ]; then
  # PS1='${debian_chroot:+($debian_chroot)}
# \[${bold}\]\[${blue}\]\w\
# \[${pink}\]$space$branch\
# \[${green}\]$space$node_version\
# \[${default}\]\[${bold}\]\n\[${previous_exit_status_color}\]›$space$cursor\[${default}\]'
# else
  # PS1='${debian_chroot:+($debian_chroot)}\u:\w $(parse_git_branch)\n\$ '
# fi
# unset color_prompt force_color_prompt
# set_cursor_color
# --------------------------------------------------------------------------}}}

# SSH ----------------------------------------------------------------------{{{
# FIXME look at old box backup to see what was in this file (system wide ?)
# . /etc/bash_completion.d/ssh
# --------------------------------------------------------------------------}}}

# NVM ----------------------------------------------------------------------{{{
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# --------------------------------------------------------------------------}}}

# FZF ----------------------------------------------------------------------{{{
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# --------------------------------------------------------------------------}}}

# AWS ----------------------------------------------------------------------{{{
  source "$HOME/code/inhouse/aws_auth/aws-functions.sh"
  source "$HOME/.app-env"
# --------------------------------------------------------------------------}}}

# SDKMAN -------------------------------------------------------------------{{{
  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  # export SDKMAN_DIR="/home/omartin/.sdkman"
  # [[ -s "/home/omartin/.sdkman/bin/sdkman-init.sh" ]] && source "/home/omartin/.sdkman/bin/sdkman-init.sh"
# --------------------------------------------------------------------------}}}
