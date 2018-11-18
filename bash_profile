#!/bin/bash

# Source the files in the bash folder
source ~/.bash/shell
source ~/.bash/commands
source ~/.bash/prompt
source ~/.bash/aliases
source ~/.bash/completion/git-completion.bash

# Ruby RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Connect your local Docker shell to the machine. This will allow you to run docker-related commands
changeDockerEnvironment() {
    docker-machine start $1
    eval "$(docker-machine env $1)"
}
# use as `docker-env [machine-name]`
alias docker-env=changeDockerEnvironment
alias go="sh /usr/local/bin/go"

export PATH="$PATH:/usr/local/bin"
export PATH="$HOME/.yarn/bin:$PATH"
export NPM_TOKEN=deploy_9a8ada6c-166b-4529-ad59-e4f792838b68

# The fuck
eval $(thefuck --alias)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stephaneshowpad/Documents/google-cloud-sdk/path.bash.inc' ]; then source '/Users/stephaneshowpad/Documents/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stephaneshowpad/Documents/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/stephaneshowpad/Documents/google-cloud-sdk/completion.bash.inc'; fi

# Docker Aliases and Functions
alias dk=docker
alias dc=docker-compose
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcl="docker-compose logs"
alias dip="docker inspect --format {{ .NetworkSettings.IPAddress }}"
alias dkd="docker run -d -P"
alias dki="docker run -it -P"
function drm() { docker rm $* $(docker ps -q -a); }
function dri() { docker rmi $* $(docker images -q); }
function db() { docker build -t="$1" .; }
function dent() { docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it $1 /bin/bash; }
function dbash() { docker run --rm -i -t -e TERM=xterm --entrypoint /bin/bash $1; }
