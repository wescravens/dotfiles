# Path to your oh-my-zsh installation.
export ZSH=/Users/wescravens/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda"

zstyle ':completion:*' use-cache yes

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
plugins=(git grunt)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# User functions
function mkdir_and_cd () {
  mkdir -p "$@" && eval cd "\"\$$#\"";
}

function pgrep_and_kill () {
  procs=$( pgrep -l "$@" )

  if [[ -z $procs ]]; then
    printf "No processes found for \"${@}\"\n"
    return
  fi

  printf "Kill the following process(es)?\n${procs}\n[yn] "
  read yn </dev/tty

  if [[ -z "$yn" ]]; then
        yn="y"
    fi

    case $yn in
        [Yy]* ) printf "test"; pgrep "$@" | xargs sudo kill;;
    esac
}

function ps_aux_and_grep () {
  ps aux | grep "$@";
}


export C2FO_HOME=/Users/wescravens/Code/c2fo
export NODE_ENV=dockerdev
export GOPATH=/Users/wescravens/go
export GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
export PATH=/Users/wescravens/Code/go_appengine:$PATH

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias c2foconfig="subl ~/c2fo/configs/config.json"
alias c2focreatemarket="grunt refresh_db setup_db test_market:3:0:3:1000 add_feature_to_org:enterprise create_taker_offers create_market_clears:1:30 create_stats set_users_passwords::all"
alias onboarding="cd ${C2FO_HOME} && grunt create_onboarding_experiment taker_verification:user1@c2fo.com"
alias rmorig="rm ./**/*.orig"
alias zshrc="subl ~/.zshrc"
alias zsrc="source ~/.zshrc"

alias mkd="mkdir_and_cd"
alias killgrep="pgrep_and_kill"
alias psgrep="ps_aux_and_grep"
alias psg="ps_aux_and_grep"
