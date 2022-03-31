#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

export GPG_TTY=$(tty)
export LASTFM_API_KEY=069b66ee4d6a7f5e860db3af52c19ab0
export homeplaylistfile="$HOME/.config/mpd/playlists/liked_songs.m3u"
export piplaylistfile="$HOME/Documents/liked_tracks/liked_songs_pi.m3u"

alias SS="sudo systemctl"
alias v="vim"
alias sv="sudo vim"
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias sr="sudo ranger"
alias mkd="mkdir -pv"

alias ls='ls -hl --color=auto --group-directories-first'
alias grep="grep --color=auto" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

alias yt="yt-dlp --add-metadata -ic" # Download video link
alias yta="yt-dlp -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"

alias vimrc="v ~/.vimrc"
alias bashrc="v ~/.bashrc"
alias nf="neofetch"
alias space="df -h | grep -e "Filesystem" -e "sda6" -e "sdb1""
alias redshift="redshift -l 44.80401:20.46513 -t 6500:3000"
alias apt="sudo apt"
alias python="python3"
alias notify-send="dunst; notify-send"
alias rsyncweb="rsync -auvP ~/Documents/website/ root@lazic.xyz:/var/www/lazic --exclude='.git/'"
alias xcp='xclip -selection clipboard'
#alias gpick='gpick -ops | xcp; notify-send "Copied color to clipboard."'
alias shuffle='mpv "$(find ~/links/ -type f -name "*.mp4" | shuf -n1)"'
alias shufflecur='mpv "$(find . -type f -name "*.mp4" | shuf -n1)"'
alias :q='exit'
alias findsort='find . -type f -printf "%T@ %Tc %p\n" | sort -n'
alias asp='cd /home/vojislav/Documents/fax/II_godina/3_Semestar/Algoritmi_i_Strukture_Podataka'
#alias rsynckino='sudo rsync -avh --exclude=".git/*" ~/Documents/repos/kinoteka_kalendar/ kinoteka@lazic.xyz:~/kinoteka_kalendar/'
alias homeplaylist='head ~/.config/mpd/playlists/liked_songs.m3u'
alias piplaylist='head ~/Documents/liked_tracks/liked_songs_pi.m3u'
alias xres='vim ~/.Xresources'
alias pgrep='pgrep -lfa'
alias homeplaylistedit='vim ~/.config/mpd/playlists/liked_songs.m3u'
alias piplaylistedit='vim ~/Documents/liked_tracks/liked_songs_pi.m3u'
alias mpv='mpv --input-ipc-server=/tmp/mpvsocket'
alias a1='/home/vojislav/Documents/fax/I_godina/2_Semestar/Analiza\ 1'
alias genius='trackinfo -c -u'

source ~/.shortcuts

sf () { fd -t f -t l . $HOME/.scripts | fzf | xargs -o -r $EDITOR ;}
sl () { rgdir ~/.lyrics ;}
copylast () { fc -ln -1 | sed 's/^\s*//g' | xclip -selection clipboard ;}

bind '"\e[13~":"rgdir .\n"'

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#export FZF_PREVIEW="--preview '(highlight -O ansi -l {} 2> /dev/null || batcat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_PREVIEW="--preview 'batcat --color=always {} | head -20'"
export FZF_DEFAULT_COMMAND="fd . . -E Music"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border $FZF_PREVIEW"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . ."
export FZF_CTRL_T_OPTS="$FZF_PREVIEW"

# open file from vim history with fzf
vim_hist() {
    hist="$HOME/.vim/viminfo"
    n=$(sed -n "s|~|$HOME|; s|^> \(.*\)|\"\1\"|p" "$hist" |
        xargs -n 1 ls -d 2>/dev/null | # filters all non-existing files
        fzf -m |
        sed "s/\(.*\)/'\1'/"
        tr '\n' ' ')

    [ ! -z "$n" ] && [ "$n" != "." ] &&
        printf -- "$n\n" | xargs -o vim
    zle -I
}

# The following three lines have been added by IBM DB2 instance utilities.
if [ -f /home/db2inst1/sqllib/db2profile ]; then
    . /home/db2inst1/sqllib/db2profile
fi
alias dots='/usr/bin/git --git-dir=$HOME/.git/ --work-tree=$HOME'
