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

# corporate proxy
http_proxy=http://127.0.0.1:3128
https_proxy=https://127.0.0.1:3128

## Git local repository
export git_local_repo="$HOME/code/git"
git_local_repo_inhouse="$git_local_repo/inhouse"
git_local_repo_public="$git_local_repo/public"

## Dotfiles repo path
export DOTFILES="$HOME/code/git/public/anchnk/dotfiles"
export DOTBIN="$HOME/code/git/public/anchnk/dotbin"
## Node
export local_nodebin="node_modules/.bin"

## ERABLE Logger
export NODE_ENV="test"
export LOG="true"
export ERABLE_SERVICE="erable"
export NODE_DEBUG=""

## LS configuration
### lsomoige
export lsomoige="$git_local_repo_inhouse/erable/ls-omoige/"

### lsomoibp
export lsomoibp="$git_local_repo_inhouse/erable/ls-omoibp"

### lsomoiac
export lsomoiac="$git_local_repo_inhouse/erable/ls-omoiac"

### Sonarlint
# sonarlint_path="/opt/sonarlint-cli-2.0/bin"
# export PATH="$PATH:$sonarlint_path" # Add sonartlint to PATH

