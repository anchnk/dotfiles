alias cd.='cd $dotfiles'
alias cd~='cd ~'
alias cd..='cd ..'
alias gaso='git commit --amend --signoff'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls.='ls -ld .?*'
alias lsd="jq '.dependencies' package.json"
alias lsdd="jq '.devDependencies' package.json"
alias lsdot='ls -ld .?*'
alias n='nautilus .'
alias nv='nvim'
alias nv.='nv .'
alias ngrep='grep -R --exclude-dir={coverage,node_modules,test}'
alias tm='tmux'
alias tmns='tmux new -s $(get-last-and-parent-folder.sh)'
alias nrp='npx nrp'
alias x='exit'

source "$HOME/.bash_inhouse_aliases"
