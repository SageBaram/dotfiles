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

zle -N change_dir
bindkey "^f" change_dir

zle -N edit_scripts
bindkey "^g" edit_scripts
