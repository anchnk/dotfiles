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
### --- START CUSTOM SECTION ---
################################################################################

## Git Local Repository
export git_local_repo="/home/tvba5179/code/git"
git_local_repo_inhouse="$git_local_repo/inhouse"
git_local_repo_public="$git_local_repo/public"

## Node
export local_nodebin="node_modules/.bin"

## ERABLE Logger
export NODE_ENV="test"
export LOG="true"
export ERABLE_SERVICE="erable"
export NODE_DEBUG=

## LS configuration
### lsomoige
export lsomoige="$git_local_repo_inhouse/erable/ls-omoige/"
export lsomoige_doc="/home/tvba5179/Documents/Act/2016/Projects/Erable/omoigers/docs/exploit"

### lsomoibp
export lsomoibp="$git_local_repo_inhouse/erable/ls-omoibp"

### lsomoiac
export lsomoiac="$git_local_repo_inhouse/erable/ls-omoiac"

### RVM
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Sonarlint
# sonarlint_path="/opt/sonarlint-cli-2.0/bin"
# export PATH="$PATH:$sonarlint_path" # Add sonartlint to PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export DOTFILES_REPO_PATH="~/code/git/public/anchnk/dotfiles"