export PATH=$HOME/Binaries:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh

ZSH_THEME="eastwood"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git sudo zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias df='df -H'
alias sudo='sudo -E'
alias cd..='cd ..'
alias cd.='cd .'
alias cd-='cd -'
alias cd/='cd /'
alias vim='nvim'
alias vi='nvim'
alias ll='ls -halF'
alias top='htop'

if [[ $UID != 0 ]]; then
    alias shutdown='sudo shutdown'
    alias reboot='sudo reboot'
fi

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export MAKEFLAGS='-j10'

export GIT_AUTHOR_NAME="Dénes Fintha"
export GIT_AUTHOR_EMAIL="denes.fintha@gmail.com"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

title() {
    echo -n "\033]0;$@\007"
}

getmusic() {
    NAME="$2 - $3.mp3"
    CONVERT="-codec:a libmp3lame -b:a 320k"
    METADATA="-metadata title=$3 -metadata artist=$2"

    if [ -f $NAME ]; then
        echo "!! $NAME Already Exists"
        return
    fi

    echo "-> Downloading from YouTube"
    youtube-dl -x --audio-quality 320K --audio-format mp3           \
               -o TEMP.mp3 https://www.youtube.com/watch\?v\=$1     \
               > /dev/null 2>&1

    if [ ! -f TEMP.mp3 ]; then
        echo "!! Invalid ID"
        return
    fi

    echo "-> Processing Metadata and Codec"
    ffmpeg -i TEMP.mp3 -codec:a libmp3lame -b:a 320k        \
           -metadata title=$3 -metadata artist=$2 $NAME  \
           > /dev/null 2>&1
    rm TEMP.mp3

    echo "-> Done!"
}

