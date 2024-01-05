function _list_dir() {
  if [[ $argv -gt 0 ]]; then
    fzf --layout=reverse --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    fzf --layout=reverse |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  fi

  if [ $foo ]; then
    builtin cd $foo && printf "Moved to directory %s\n" "${foo}"
  fi
  zle reset-prompt
}

function _list_scripts() {
  if [[ $argv -gt 0 ]]; then
    fzf --layout=reverse --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    fzf --layout=reverse |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  fi

  if [ $foo ]; then
    vim $foo
  fi
  zle reset-prompt
}

function list_directories() {
    echo $XDG_CONFIG_HOME
    echo ~/workspace/self/scripts/
    \ls -ad $XDG_CONFIG_HOME/nvim/lua/*/*/* |grep -v \.git
    \ls -ad $XDG_CONFIG_HOME/nvim/lua/*/* |grep -v \.git
}

function list_scripts() {
    \ls -ad ~/workspace/self/scripts/*
}

function edit_scripts() {
  list_scripts | sed -e 's/\/$//' | awk '!a[$0]++' | _list_scripts $argv
}

function change_dir() {
  list_directories | sed -e 's/\/$//' | awk '!a[$0]++' | _list_dir $argv
}

lg()
{
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
            rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

function ghpr(){
   GH_FORCE_TTY=100% gh pr list | fzf --ansi --preview 'GH_FORCE_TTY=100% gh pr view {1}' --preview-window down --header-lines 3 | awk '{print $1}' | xargs gh pr checkout
}

function openapp() {
        local apps_dir="/Applications"
        local selected_app

	selected_app=$(find "$apps_dir" -name "*.app" -type d -maxdepth 1 | sed 's/\/Applications\///' | fzf --preview "open '$apps_dir/{}'")


        if [ -n "$selected_app" ]; then
                open "$apps_dir/$selected_app"
        fi
}

zle -N change_dir
bindkey "^f" change_dir

zle -N edit_scripts
bindkey "^g" edit_scripts

zle -N openapp
bindkey "^o" openapp
