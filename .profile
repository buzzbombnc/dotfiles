# rbenv setup
which rbenv &>/dev/null && eval "$(rbenv init -)"

# brew version of updated nano for Mac.
if [[ -x /usr/local/bin/nano ]]; then
    NANO=/usr/local/bin/nano
    alias nano=/usr/local/bin/nano
else
    which nano >/dev/null 2>&1 && NANO=$(which nano)
fi

if [[ -n "$NANO" ]]; then
    EDITOR=$NANO
    export EDITOR
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
    GIT_PROMPT_THEME=Single_line
    source ~/.bash-git-prompt/gitprompt.sh
fi

# Put in some reasonable less defaults.
export LESS="-FRXi"

# Vagrant helper aliases.
which vagrant &>/dev/null && [[ -f ~/.vagrant-helpers.sh ]] && source ~/.vagrant-helpers.sh

# New tab function for Terminal on Mac.
if [[ $(uname) == "Darwin" ]]; then
    new_tab() {
        COMMAND=$*
        osascript \
        -e "tell application \"Terminal\"" \
        -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
        -e "do script \"$COMMAND\" in front window" \
        -e "end tell" > /dev/null
    }
fi

# Bash completion.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# WSL helpers
if [[ $(uname -r) =~ 'Microsoft' ]]; then
  # Depends on external SSH agent socket to pageant like https://gist.github.com/buzzbombnc/efc1d4b532db8e181bf335b172e3c590.
  SSH_AUTH_SOCK=/mnt/c/Users/$USER/.ssh/ssh-agent.sock
fi

# Symlink and re-use SSH auth sockets to enable easier use of screen.
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;
