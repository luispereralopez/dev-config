# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# NVM configuration. You can set $NVM_DIR to any location, but leaving it unchanged from
# /usr/local/opt/nvm will destroy any nvm-installed Node installations
# upon upgrade/reinstall
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# zplug configuration 
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# enhancd configuration
# ENHANCD_FILTER=fzy
# export ENHANCD_FILTER

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GENERAL CONFIG
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/svc-gke-ist-dev.json

# GENERAL ALIAS
alias projects="cd ~/ist/projects"

# GIT ALIAS
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m "
alias gca="git commit --amend"
alias branch="git checkout -b "
alias master="git checkout master"
alias log="git log --oneline --decorate --graph"
alias glog="git log"
alias gpush='git push -u origin $(git_current_branch)'
alias fpush="git push -f"
alias diff="git diff master"

# KUBECTL ALIAS
alias k="kubectl"
alias kgp="kubectl get pods"
alias kgpg="kubectl get pods | grep "
alias kgs="kubectl get secret"

# DOCKER ALIAS
alias dps="docker ps"
alias dc_up="docker-compose up -d"
alias dc_dpwn="docker-compose down"

# GENERAL FUNCTIONS

# get terminal colors
print-colors() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# mongodb://VD60Pcr4UpXj8cLC:K3l42xIMuQFmmUcc@replicaset-bdes-0.dlas1.ulti.io:27017,replicaset-bdes-1.dlas1.ulti.io:27017,replicaset-bdes-2.dlas1.ulti.io:27017/integration-run-status-cmd?authSource=integration-run-status-cmd&ssl=true&replicaSet=resp1
# MONGO_URI="mongodb://ad5f6786-53f4-4623-b86f-e3c406241130:6fdf26f5-b77e-40f2-8d41-1ae02ebd05d2@replicaset-bdes-0.mia.ulti.io:27017,replicaset-bdes-1.mia.ulti.io:27017,replicaset-bdes-2.mia.ulti.io:27017/df75adb0-d885-4e61-b023-400f007ee400?ssl=true"
# CMD_SERVICE_NAME="integrations-vendor-cmd"
# mongoexport --uri=$MONGO_URI --collection="domainevents" --out="$CMD_SERVICE_NAME.domainevents.json"

# get domainevents from DEV env
get-domainevents() {
  [ -z "$1" ] && echo "Missing mongo uri parameter" && echo "Usage: get-domainevents <mongo_uri> <service_name>" && return -1
  [ -z "$2" ] && echo "Missing servvice name parameter" && echo "Usage: get-domainevents <mongo_uri> <service_name>" && return -1
  FILENAME="~/ist/mongo-exports/$2.domainevents.json"
  mongoexport --uri="$1" --collection="domainevents" --out=$FILENAME
  echo "Successfully exported domainevents collection from dev to file: $FILENAME"
  mongoimport --db="$2" --collection="domainevents" $FILENAME
  echo "Successfully imported $FILENAME to local collection '$2'"
}

# KUBECTL FUNCTIONS

# sh into a pod
kexec() {
  [ -z "$1" ] && echo "Missing service name parameter" && echo "Usage: kexec <service_name>" && return -1
  pod_name=$(kgp | grep "$1" | head -n1 | awk '{print $1}')
  echo "pod in use: $pod_name"
  kubectl exec -it "$pod_name" -- /bin/sh
}

# check replay status
krepstatus() {
  [ -z "$1" ] && echo "Missing service name parameter" && echo "Usage: krepstatus <service_name>" && return -1
  pod_name=$(kgp | grep "$1" | head -n1 | awk '{print $1}')
  echo "pod in use: $pod_name"
  kubectl exec "$pod_name" -- wget -q -O - --no-check-certificate --method GET  --timeout=0 'http://localhost:8080/replay/status' | jq
}

# trigger replay
kreplay() {
  [ -z "$1" ] && echo "Missing service name parameter" && echo "Usage: kreplay <service_name>" && return -1
  pod_name=$(kgp | grep "$1" | head -n1 | awk '{print $1}')
  echo "pod in use: $pod_name"
  if read -q "choice?Are you sure you want to trigger a replay in pod '$pod_name' (y/n): "; then
    echo
    kubectl exec "$pod_name" -- wget -q -O - --no-check-certificate --method POST  --timeout=0 'http://localhost:8080/replay' | jq
  else
    echo
    echo "Replay cancelled on pod '$pod_name', exiting..."
  fi
}

# get mongo secret
kmongosecret() {
  [ -z "$1" ] && echo "Missing service name parameter" && echo "Usage: kmongosecret <service_name>" && return -1
  if read -q "choice?Is this a GCP secret (y/n): "; then
    echo
    kgs "$1"-ist-mongodb  -o yaml | grep uri | awk '{print $2}' | base64 --decode | sed 's/-pri//g'
  else
    echo
    kubectl get secret "$1"-ist-mongodb  -o yaml | grep uri | awk '{print $2}' | base64 --decode
  fi
}

# get rabbit secret
krabbitsecret() {
  [ -z "$1" ] && echo "Missing service name parameter" && echo "Usage: krabbitsecret <service_name> <property>" && return -1
  [ -z "$2" ] && echo "Missing property parameter" && echo "Usage: krabbitsecret <service_name> <property>" && return -1
  kubectl get secret "$1"-ist-rabbitmq  -o yaml | grep "$2" | awk '{print $2}' | base64 --decode
}

#######

# commented because it was running slow
# source ~/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.rvm/scripts/rvm
export PATH="/usr/local/sbin:$PATH"
