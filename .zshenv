# eval "$(pyenv init -)"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/version:$PATH"
# if [ -d "${PYENV_ROOT}" ]; then
#     export PATH=${PYENV_ROOT}/bin:$PATH
#     eval "$(pyenv init -)"
# fi
#
# if [ -d ${HOME/.pyenv} ]; then
#     export PATH="${HOME}/.pyenv/shims:$PATH"
#     eval "$(pyenv init -)"
# fi

case "$(uname)" in
  Darwin) # OSがMacならば
    if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
      PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
    fi
    ;;

  *) ;; # OSがMac以外ならば何もしない
esac

export PATH=${HOME}/.local/bin:$PATH
export PATH=${HOME}/.local/bin/stack-0.1.5.0-x86_64-osx:$PATH
export PATH=/usr/bin/pbcopy:/usr/bin/pbpaste:$PATH
export GOPATH=$HOME/.go
