# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
COMPLETION_WAITING_DOTS="true"

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
plugins=(macports svn git colored-man colorize command-not-found compleat copydir copyfile cp dircycle dirpersist tmux vi-mode autojump jump repo osx brew common-aliases dircycle docker brew-cask go)

source $ZSH/oh-my-zsh.sh

# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/vladimirskipor/Development/LibsAndTools/gradle-1.10/bin:/opt/local/bin/:/opt/local/sbin"
export MANPATH="/usr/local/man:$MANPATH:/opt/local/share/man:/Library/TeX/Distributions/.DefaultTeX/Contents/Man"

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


# Development
export DEVELOPMENT="YES"

#ssh
export SSH_KEY_PATH="~/.ssh/id_mac_rsa"

#nvim
#export VIM=/usr/share/vim/

#golang
GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION/libexec
#export GOROOT="/usr/local/Cellar/go/1.4.2"
export GOPATH="$HOME/Development/Go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"


#nix
source ~/.nix-profile/etc/profile.d/nix.sh

export NIX_CFLAGS_COMPILE="-idirafter /usr/include" #haskell math.h problem solve
export NIX_CFLAGS_LINK="-L/usr/lib"

#homebrew

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim  ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias livetex="latexmk -pvc -silent"
#alias killnginx="sudo kill -QUIT `cat /usr/local/nginx/logs/nginx.pid`"
alias nginx="sudo /usr/local/nginx/sbin/nginx"
alias vimgo="vim -u ~/.vimrc.go"
alias start-docker-machine='eval "$(docker-machine env default)"'
alias sdm='eval "$(docker-machine env default)"'
alias matlab='/Applications/MATLAB_R2015a.app/bin/matlab -nodisplay -nosplash'
alias vim-geeknote="vim -c Geeknote"
alias provision="vagrant provision"
