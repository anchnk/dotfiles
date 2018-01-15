alias cd.='cd $dotfiles'
alias cd~='cd ~'
alias cd..='cd ..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias n='nautilus .'
alias nv='nvim'
alias nv.='nv .'
alias ngrep='grep -R --exclude-dir={coverage,node_modules,test}'
alias tm='tmux'
alias tmns='tmux new -s $(get-last-and-parent-folder.sh)'

source "$HOME/.bash_inhouse_aliases"
