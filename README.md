Basic dotfiles for use with Mac Terminal, but maybe more eventually.

Other requirements
------------------

* WSL2 SSH connection utility: https://github.com/BlackReloaded/wsl2-ssh-pageant.  Download release into ~/.ssh.
* Better git prompt script: `git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1`
* If needed: [Git completion script](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash) stored in either `~/.git-completion.bash` or in the global/user completion directory.

Other useful utilities
---------------------
* Homebrew
* iterm2
* wget
* coreutils
* visual-studio-code
* docker (formulae + cask)
* asdf?

Set iterm2 prefs
----------------

```
$ plutil -convert binary1 com.googlecode.iterm2.plist
$ cp com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
```

TODO
----

* Git configuration, less user/email?
* nano configuration
