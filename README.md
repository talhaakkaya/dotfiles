# How to install?

```bash
mkdir ~/.fonts

ln -s ~/.mta-dotfiles/droid_sans_mono_for_powerline.otf ~/.fonts/Droid\ Sans\ Mono\ for\ Powerline.otf

# Append .bashrc file

#...
source ~/.mta-dotfiles/bashrc
#...

ln -s ~/.mta-dotfiles/vim ~/.vim

ln -s ~/.mta-dotfiles/vimrc ~/.vimrc

ln -s ~/.mta-dotfiles/i3/i3status.conf ~/.i3/i3status.conf

# Install vundle (vim package manager)
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

# Install dependencies
sudo apt-get install ctags silversearcher-ag

# install plugins (in vim)
:PluginInstall

```
