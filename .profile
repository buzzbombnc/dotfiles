# brew version of updated Ruby
[[ -d /usr/local/opt/ruby/bin ]] && PATH=/usr/local/opt/ruby/bin:$PATH

# brew version of updated nano
if [[ -x /usr/local/bin/nano ]]; then
    EDITOR=/usr/local/bin/nano
    export EDITOR

    alias nano=/usr/local/bin/nano
fi

# If VSCode is installed, provide a nice alias.
[[ -d "/Applications/Visual Studio Code.app" ]] && alias Code="open -a 'Visual Studio Code' ."

# If the git completion code exists, load it.
[[ -f ~/.git-completion.bash ]] && source ~/.git-completion.bash

# If the git prompt code exists, load it.
if [[ -f ~/.bash-git-prompt/gitprompt.sh ]]; then
    # Configuration before load.
    GIT_PROMPT_ONLY_IN_REPO=1
    # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
    # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
    # GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files
    # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files
    source ~/.bash-git-prompt/gitprompt.sh
fi

# Put in some reasonable less defaults.
export LESS="-FRX"
