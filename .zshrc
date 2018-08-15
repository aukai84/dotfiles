# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

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
plugins=(git postgresql npm github node zsh-syntax-highlighting zsh-autosuggestions)

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
alias tmuxconfig="nvim ~/.tmux.conf"
alias vimconfig="nvim ~/.vimrc"
alias zshconfig="nvim ~/.zshrc"
alias nr=newGithubRepo
alias ohmyzsh="nvim ~/.oh-my-zsh"

#shell scripts alias
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias my-start="sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"
alias my-stop="sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"
alias jenkins-start="sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist"
alias jenkins-stop="sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist"
alias jenkins-docker="~/scripts/jenkins-docker.sh"
alias rmt-connect="ssh -i ~/.pem/056-RMT.pem ec2-user@rmthost"
alias vim="nvim"
alias docker-restart="docker-compose down && docker-compose up --build"

#set gitlab vpn hosts
alias use-vpn="~/scripts/use-vpn.sh"
alias close-vpn="~/scripts/close-vpn.sh"

# Frequent directories
alias v='cd ~/Projects/visionair;ls'
alias h='cd ~;ls'
alias dl='cd ~/DevLeague;ls'

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Set zsh auto suggest and syntax highlighting
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
