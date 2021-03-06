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
* nano (newer than MacOS)
* nanorc (syntax coloring)
* asdf

Set iterm2 prefs
----------------

```
$ plutil -convert binary1 com.googlecode.iterm2.plist
$ cp com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist
```

Set VSCode prefs and keybindings
--------------------------------

* Note that the settings might need a tweak after the fact, depending on extensions installed.

```
$ cp vscode-settings.json ~/Library/Application\ Support/Code/User/settings.json
$ cp vscode-keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

Git
---

`$ git config --global -e`

Copy pasta `git-config.ini` into the editor, update name/email, save.

Nano
----

`cp .nanorc ~`

TODO
----

* asdf additions?
