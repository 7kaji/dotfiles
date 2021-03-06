# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/whitech0c0/Downloads/cocos2d-x-3.2/tools/cocos2d-console/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# rbenv
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

# brew
export PATH=/usr/local/bin:$PATH

# golang
if [ -x "`which go`" ]; then
  # export GOROOT=`go env GOROOT`
  # export GOPATH=$HOME/go
  # export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
  export GOPATH=~/go
  export PATH=$PATH:$GOPATH/bin
fi

# peco
## select history
peco-select-history() {
    BUFFER=$(\history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

## process kill
function peco-pkill() {
    for pid in `ps aux | peco | awk '{ print $2 }'`
    do
        kill $pid
        echo "Killed ${pid}"
    done
}
alias pk="peco-pkill"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# tmux automatic start
# if [ -z "$PS1" ] ; then return ; fi
# 
# if [ -z $TMUX ] ; then
#     tmuxls=`tmux ls`
#     if [ -z $tmuxls ] ; then
#             tmux
#     else
#             tmux attach
#     fi
# fi

# Docker
# インタラクティブモードでコンテナ起動($ dki base /bin/bash)
alias dki="docker run -i -t -P"

# デーモンモードでコンテナ起動($ dkd base /bin/echo hello)
alias dkd="docker run -d -P"

# 最後に起動したコンテナのIDを取得する
alias dl='docker ps -l -q'

# コンテナのIPをを取得する($ dip `dl`)
alias dip="docker inspect --format  '{{ .NetworkSettings.IPAddress }}' "

# カレントディレクトリのDockerfileをタグを指定してビルドする($ dbu tcnksm/test)
dbu() {docker build -t=$1 .;}

# 起動中の全てのコンテナを停止する
dstop() { docker stop $(docker ps -a -q);}

# 停止中の全てのコンテナを削除する．起動中のコンテナはスキップされる
drm() { docker rm $(docker ps -a -q); }

# 起動中のコンテナを全て停止して，コンテナを削除する
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# すべてのイメージを削除する．利用中のイメージはスキップされる
dri() { docker rmi $(docker images -q); }

# その他
alias di="docker images"
alias dps="docker ps"

# docker
# export DOCKER_HOST=tcp://192.168.59.103:2375
# export DOCKER_CERT_PATH=/Users/whitech0c0/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1
if [ "`boot2docker status`" = "running" ]; then
    $(boot2docker shellinit)
fi

# aliases
alias be="bundle exec"
alias bx="bundle exec"

export PATH=/usr/local/sbin:$PATH

# Google Cloud SDK
export PATH=/Users/white/google-cloud-sdk/bin:$PATH
 
# The next line updates PATH for the Google Cloud SDK.
source '/Users/white/google-cloud-sdk/path.zsh.inc'
 
# The next line enables bash completion for gcloud.
source '/Users/white/google-cloud-sdk/completion.zsh.inc'

# alias
alias git merge="git merge --no-ff"
