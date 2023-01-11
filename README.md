# dotfiles

Backup of my dot files

Use at your own risk-especially the scripts! Some of them are hacked together or are poorly edited.

There are some personal edits that you may not like. See "Requirements and Aliases" below.
I also unmapped the caps lock key (personal preference.) If you don't want that, comment out the xmodmap command at the end of .zshrc


# Requirements and Aliases
oh-my-zsh is required for the .zshrc unless you just want to copy my aliases or such. Make sure that the oh-my-zsh paths are correct. They should be with a default install.

.zshrc also includes references to the following (none of which are required, but you should be aware of them in order to remove aliases you don't need):
aria2c > A download manager (aliased to dn with 7 threads in my setup)
browsh > A terminal based web browser based on firefox (alias overwrites original command so that searx.be is opened by default)
conda > Python environment thing that I am not very familiar with
rmtrash > rm, but it puts deleted files into the user's trash
ripgrep > a drop-in replacement for grep written in Rust (I prefer it both for its speed and its more informative error messages)

Wayland "hacks" to make vscode and firefox run are included, but commented out

an alias for kitty's icat is included by default. If you don't use the kitty terminal emulator, remove the alias.

There are also some other aliases. Take a look at them and pick the ones you like.

