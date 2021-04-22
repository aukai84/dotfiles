# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR='nvim'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="manny-theme"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.  # HYPHEN_INSENSITIVE="true"

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
plugins=(git npm github node zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
function newGithubRepo() {
   local json="{\"name\":\"$1\"}"
   mkdir $1
   cd $1
   touch .gitkeep
   git init
   git add .gitkeep
   git remote add origin "git@github.com:aukai84/$1.git"
   git commit -m "initial commit"
   curl -u 'aukai84' https://api.github.com/user/repos -d "$json"
   git push --set-upstream origin master
}




#terminal config alias
alias rtmux="tmux source-file ~/.tmux.conf"
alias szsh="source ~/.zshrc"
alias tmuxconfig="vim ~/.tmux.conf"
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"
alias nr=newGithubRepo
alias ohmyzsh="vim ~/.oh-my-zsh"

#shell scripts alias
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias my-start="sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"
alias my-stop="sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"
alias jenkins-start="sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist"
alias jenkins-stop="sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist"
alias jenkins-docker="~/scripts/jenkins-docker.sh"
alias rmt-connect="ssh -i ~/.pem/056-RMT.pem ec2-user@rmthost"
alias docker-restart="docker-compose build && docker-compose down && docker-compose up"
alias docker-expres="docker exec -it express-container sh -c"
alias docker-client="docker exec -it client-container sh -c"
alias vim="nvim"

#tmux alias
alias tmux-webmocha="tmux attach -t webmocha"
alias tmux-readiness-roadmap="tmux attach -t readiness-roadmap"

#git alias
alias gclean="git branch --merged| egrep -v '(^\*|master|production)' | xargs git branch -d"

#Dynamics Integration
alias sync-dynamics="rsync -rave 'ssh -i ~/.pem/056-RMT.pem' ~/Projects/S2S-Dynamics-Integration ec2-user@rmthost:/jenkins/"

#set gitlab vpn hosts
alias use-vpn="~/scripts/use-vpn.sh"
alias close-vpn="~/scripts/close-vpn.sh"

#brand central ssh commands
alias bc-tunnel-production="ssh -N -L 27020:localhost:27017 bc-production"
alias bc-tunnel-staging="ssh -N -L 27021:localhost:27017 bc-staging"
alias bc-tunnel-dev="ssh -N -L 27022:localhost:27017 bc-dev"
alias rr-tunnel-staging="ssh -N -L 27023:localhost:27017 rr-staging"
alias hpe-labs-tunnel-prod="ssh -N -L 27024:localhost:2017 hpe-labs"
alias pathfinder-tunnel-itg="ssh -N -L 27025:localhost:27017 pathfinder-itg"
alias pathfinder-tunnel-prod="ssh -N -L 27026:localhost:27017 pathfinder-prod"

function testEncrypt() {
    echo "First Parameter $1"
    echo "Second Parameter $2"
    echo "Edited param $1.aes"
}

#openssl encryption
function encrypt() {
  openssl aes-256-cbc -salt -in "$1" -out 'encrypted.aes' && mv 'encrypted.aes' "$1.aes" 
}

function decrypt() {
  openssl aes-256-cbc -d -salt -in "$1" -out "$2" && rm "$1";
}

#secrets/keys
alias generatekey="head /dev/urandom | shasum -a 512"

# Frequent directories
alias v='cd ~/Projects/visionair;ls'
alias h='cd ~;ls'
alias dl='cd ~/DevLeague;ls'
alias hd='cd ~/Webmocha/honeydesk;ls'

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
#prompt spaceship

# Set zsh auto suggest and syntax highlighting
#$source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# adding flutter to PATH
export PATH=~/bin/flutter/bin:$PATH
export PATH=~/Desktop/Applications:$PATH

# adding Android Environment Variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/matthewtirrell/Webmocha/MochaPets/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/matthewtirrell/Webmocha/MochaPets/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/matthewtirrell/Webmocha/MochaPets/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/matthewtirrell/Webmocha/MochaPets/node_modules/tabtab/.completions/sls.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/matthewtirrell/Desktop/Applications/vault vault

source /Users/matthewtirrell/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#adding rbenv 
eval "$(rbenv init -)"

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/Users/matthewtirrell/.netlify/helper/path.zsh.inc' ]; then source '/Users/matthewtirrell/.netlify/helper/path.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
source /Users/matthewtirrell/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/user/local/opt/mongodb-community@3.2/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@3.2/bin:$PATH"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
