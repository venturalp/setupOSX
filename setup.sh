#!/usr/bin/env bash

#Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo 'Please install Homebrew by running the following command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    echo 'Installing Brew'
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

#Upgrade installed formulae
brew upgrade

# Save Homebrew’s installed location
BREW_PREFIX=$(brew --prefix)


#Tools
brew install node
brew install nvm
brew install svn
mkdir ~/.nvm
brew install yarn
brew install git

#Taps
brew tap popcorn-official/popcorn-desktop https://github.com/popcorn-official/popcorn-desktop.git

#Apps
brew install --cask firefox
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask docker
brew install --cask dbeaver-community
brew install --cask notion
brew install --cask spotify
brew install --cask vlc
brew install --cask visual-studio-code
brew install --cask zoom
brew install --cask discord
brew install --cask the-unarchiver
brew install --cask slack
brew install --cask sublime-text
brew install --cask microsoft-teams
brew install --cask microsoft-edge
brew install --cask steam
brew install --cask epic-games
brew install --cask spectacle
brew install --cask popcorn-time


# Remove outdated versions from the cellar.
brew cleanup

# Fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font
brew install --cask font-fira-mono-for-powerline
brew install --cask font-fira-mono-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-menlo-for-powerline
brew install --cask font-meslo-for-powerline
brew install --cask font-source-code-pro
# powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# Plugins
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Setup Terminal - Oh My Zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Download and config ZSHRC
curl -o ~/.zshrc $1
sed -i '' 's/%USERNAME%/'$(whoami)'/g' ~/.zshrc
source ~/.zshrc
sudo usermod --shell $(which zsh) $USER