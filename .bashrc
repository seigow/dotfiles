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

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias py=python

# added by travis gem
[ -f /Users/fuku/.travis/travis.sh ] && source /Users/fuku/.travis/travis.sh
