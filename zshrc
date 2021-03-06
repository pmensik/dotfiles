# Path to your oh-my-zsh installation.
#antigen bundle soimort/translate-shell

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(git git-open command-not-found common-aliases debian git-extras mvn python vi-mode web-search lein)

# User configuration
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/pmensik/.local/bin:/usr/local/eosio/bin"
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export HISTFILESIZE=10000

export ZSH=/home/pmensik/.oh-my-zsh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export NODE_PATH=$NODE_PATH:/home/pmensik/.nvm/versions/node/v8.12.0/lib/node_modules

export PGHOST=localhost

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!*.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source $ZSH/oh-my-zsh.sh

bindkey "^R" history-incremental-search-backward


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
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias zshrc="nvim ~/dotfiles/zshrc"
alias initvim="nvim ~/dotfiles/init.vim"
alias sclip='xclip -selection c'
alias gclip='xclip -selection clipboard -o'
#For Vim column selection
alias disable-paste="gsettings set org.pantheon.terminal.settings natural-copy-paste false"
alias enable-paste="gsettings set org.pantheon.terminal.settings natural-copy-paste true"

alias my-ip="curl 'https://api.ipify.org'"
alias gch="git checkout ."
alias glo="git log"
alias gloo="git log --oneline"
alias gss="git stash"
alias gsp="git stash pop"
alias gdi="git diff"
alias gdic="git diff --cached"
alias gst="git status"
alias gad="git add ."
alias gco="git commit"
alias gcoa="git commit -a"
alias gpu="git push origin `git branch | grep -e "^*" | cut -d' ' -f 2`"
alias refresh="source ~/.zshrc"
alias listp="ps -aux"
alias vi="vim"
alias mvni="mvn-color clean install"
alias mci="mvn-color clean install -DskipTests=true"
alias weather="curl wttr.in"
alias mvn-new="mvn archetype:generate \
    -DarchetypeGroupId=org.codehaus.mojo.archetypes \
    -DarchetypeArtifactId=pom-root \
    -DarchetypeVersion=RELEASE"
alias mvn-add="mvn archetype:generate \
    -DarchetypeGroupId=org.apache.maven.archetypes \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DarchetypeVersion=RELEASE"
alias mvn-single="mvn archetype:generate -DgroupId=com.konicaminolta.servicehub
   -DartifactId=authentication-library
   -DarchetypeArtifactId=maven-archetype-quickstart
   -DinteractiveMode=false"
alias pkg-list='dpkg-query --show --showformat='"'"'${Package;-50}\t${Installed-Size}\n'"'"' | sort -k 2 -n | grep -v deinstall | awk '"'"'{printf "%.3f MB \t %s\n", $2/(1024), $1}'"'"'"'
alias get-instances="aws ec2 describe-instances --output text --query 'Reservations[].Instances[].Tags[?Key==\`Name\`].Value'"
