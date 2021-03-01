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

# Bash completion.
if [[ -f /usr/local/etc/bash_completion ]]; then
    . /usr/local/etc/bash_completion
elif [[ -f ~/.git-completion.bash ]]; then
    source ~/.git-completion.bash
fi

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

# WSL helpers
if [[ $(uname -r) =~ 'WSL2' ]]; then
  # Where to find the wsl2-ssh-pageant.exe file (https://github.com/BlackReloaded/wsl2-ssh-pageant)
  WSLAGENT=~/.ssh/wsl2-ssh-pageant.exe
  # Requires both ss and socat and the WSLAGENT be executable.
  if ! which ss &>/dev/null || ! which socat &>/dev/null || [[ ! -x "$WSLAGENT" ]]; then
    echo "WARNING: ss, socat, and wsl2-ssh-pageant.exe utilities must be installed and executable for SSH agent connection."
  else
    export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
    ss -a | grep -q $SSH_AUTH_SOCK
    if [ $? -ne 0 ]; then
      rm -f $SSH_AUTH_SOCK
      (setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:$WSLAGENT &>/dev/null &)
    fi
  fi
elif [[ $(uname -r) =~ 'Microsoft' ]]; then
  # Depends on external SSH agent socket to pageant like https://gist.github.com/buzzbombnc/efc1d4b532db8e181bf335b172e3c590.
  SSH_AUTH_SOCK=/mnt/c/Users/$USER/.ssh/ssh-agent.sock
fi

# Symlink and re-use SSH auth sockets to enable easier use of screen.
if [[ -S "$SSH_AUTH_SOCK" && ! -h "$SSH_AUTH_SOCK" ]]; then
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock;
fi
export SSH_AUTH_SOCK

# Speaking of screen, fix for WSL2 screen issue (https://github.com/microsoft/WSL/issues/1245).
if [[ $(uname -r) =~ 'WSL2' ]]; then
  export SCREENDIR=$HOME/.screen
  [[ -d $SCREENDIR ]] || mkdir -p -m 700 $SCREENDIR
fi

# Bring in .bashrc, if it exists.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH
