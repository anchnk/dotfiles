# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

################################################################################
#                             START CUSTOM SECTION
################################################################################
## Bash Built-in
export PROMPT_DIRTRIM=3
## Git local repository
export git_local_repo="$HOME/code"
export inhouse_repos="$git_local_repo/inhouse"
export public_repos="$git_local_repo/public"

## Dotfiles repo path
export dotfiles="$public_repos/anchnk/dotfiles"
export bin="$HOME/bin"

## Node
export local_nodebin="node_modules/.bin"

## termcap
export LESS_TERMCAP_mb=$'\e[01;31m'        # enter blinking mode
export LESS_TERMCAP_md=$'\e[01;34;74m'     # double-bright mode
export LESS_TERMCAP_me=$'\e[0m'           # turn off all appearance mode

export LESS_TERMCAP_so=$'\e[30;42m'       # enter standout mode
# export LESS_TERMCAP_so=$'\e[38;246m'      # begin standout-mode - info box
export LESS_TERMCAP_se=$'\e[0m'           # end standout mode

export LESS_TERMCAP_us=$'\e[04;32;146m'    # begin underline
export LESS_TERMCAP_ue=$'\e[0m'           # end underline

## Rust
export PATH="$HOME/.cargo/bin:$PATH"
