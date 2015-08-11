case "$(uname)" in

  Darwin) # OSがMacならば
    if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
      alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
      #alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app "$@"'
      # alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
      alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/MacVim "$@" &'
    fi
    ;;

  *) ;; # OSがMac以外ならば何もしない
esac

alias geeknote="/Users/fuku/.pyenv/versions/2.7.8/bin/python /Users/fuku/.pyenv/versions/2.7.8/lib/python2.7/site-packages/geeknote-0.2a-py2.7.egg/geeknote/geeknote.py"

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias py=python
