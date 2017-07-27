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

# If the git prompt code exists, load it and configure.
if [[ -f ~/.git-prompt.sh ]]; then
    source ~/.git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=yes
    export GIT_PS1_SHOWSTASHSTATE=yes
    export GIT_PS1_SHOWUNTRACKEDFILES=yes
    export GIT_PS1_SHOWCOLORHINTS=yes
    export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
fi
