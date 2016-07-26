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
