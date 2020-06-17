# source ~/.oh-my-zsh/oh-my-zsh.sh

export NVIM_TUI_ENABLE_TRUE_COLOR=1

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/pmensik/.local/bin"
#
# History
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
export NODE_PATH=$NODE_PATH:/home/pmensik/.nvm/versions/node/v8.12.0/lib/node_modules
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:/home/pmensik/tools/kafka_2.13-2.5.0/bin

export PGHOST=localhost

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!*.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export LC_ALL=en_US.UTF-8

# ZSH Vim mode plugin 
# export MODE_CURSOR_VICMD="green block"
# export MODE_CURSOR_VIINS="#20d08a blinking bar"
# export MODE_CURSOR_SEARCH="#ff00ff steady underline"
# export KEYTIMEOUT=1 # Set pressing Esc timeout to 0.1s

export LANG=en_US.UTF-8

bindkey "^R" history-incremental-search-backward
bindkey -v


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias python3="/usr/bin/python3.8"
alias zshrc="nvim ~/dotfiles/zshrc"
alias vimperatorrc="nvim ~/dotfiles/vimperatorrc"
alias initvim="nvim ~/dotfiles/init.vim"
alias sclip='xclip -selection c'
alias gclip='xclip -selection clipboard -o'

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
