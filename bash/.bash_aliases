alias cd..='cd ..'
alias cd.='cd $dotfiles'
alias cd~='cd ~'
alias gaso='git commit --amend --signoff'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls.='ls -ld .?*'
alias lsd="jq '.dependencies' package.json"
alias lsdd="jq '.devDependencies' package.json"
alias lsdot='ls -ld .?*'
alias n='nautilus .'
alias ngrep='grep -R --exclude-dir={coverage,node_modules,test}'
alias nok='npx nok'
alias npm-nxt='npm i -g npm@latest'
alias nrc='npm run commit'
alias nv='/opt/neovim/nvim.appimage'
alias nvim='nv'
alias nv.='nv .'
alias tm='tmux'
alias tmns='tmux new -s $(get-last-and-parent-folder.sh)'
alias x='exit'

source "$HOME/.bash_inhouse_aliases"
