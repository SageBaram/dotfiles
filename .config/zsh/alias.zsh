### ALIASES ###
alias ..="cd .."
alias ...="cd ../.."

alias g='git'
alias v='vim'
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log"

alias findfile="find . -type f -name"
alias loc='local extensions; extensions=$(echo -e "js\njsx\npy\njava\ncpp\nhtml\ncss\nsh\nbash\nzsh\nlua" | fzf --multi --preview "find . -type f -name *{} | xargs wc -l"); if [ -n "$extensions" ]; then find . -type f \( -name "*.$extensions" \) -exec wc -l {} +; fi'


alias l='exa -F --oneline --icons'                                                        # short list
alias ls='exa -lF --no-time --no-user --no-filesize --icons --git'
alias ll='exa -laF --no-time --no-user --no-filesize --icons --git --group-directories-first'
alias la='exa -laF --no-time --no-user --no-filesize --icons --git'
alias lm='exa -lhamF --time-style=long-iso --no-user --no-filesize --icons --git'
alias lt='exa --tree --level=2 --icons'                                         # tree view

alias src="source $ZDOTDIR/.zshrc"
alias erc="vim $ZDOTDIR/.zshrc"
alias fig='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vimf='GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME nvim'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias tldrf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias pbe='open /Applications/League\ of\ Legends\ \(PBE\).app'
alias league='open /Applications/League of Legends.app'
