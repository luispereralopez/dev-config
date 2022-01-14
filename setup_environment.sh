#!/bin/bash

############################### FUNCTIONS ###############################

# prompts a yes/no question to install software
# $1 -> name of the software to install
# $2 -> command to execute to install the software
yes_no_question() {
    while true; do
        read -p "Do you want to install $1? (y/n) " yn
        case $yn in
            [Yy]* ) echo "Installing $1..."
                    $2
                    break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# check https://docs.ulti.io/systems/quark/getting-started/install-cli/ for installation instructions
install_quark_cli () {
    curl -L -o /tmp/qrk-v3.0.20.pkg https://artifactory.mia.ulti.io/artifactory/gt-generic-prod/quark-cli/installers/macos/qrk-v3.0.20.pkg
    echo "Termial needs permission to install package 'qrk-v3.0.20.pkg', please enter user password:"
    sudo installer -pkg /tmp/qrk-v3.0.20.pkg -tgt /
    qrk update
    qrk setup
    rm -rf /tmp/qrk-v3.0.20.pkg
}

install_required() {
    #####
    # Required Installations
    #####
    
    # install Command Line Tools (CLT) for Xcode
    xcode-select --install

    # install Homebrew
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # install Cask
    brew tap caskroom/cask

    # install Git
    brew install git

    # install Ruby
    brew install ruby

    # install Maven
    brew install maven

    # install Node
    brew install node

    # install Java Azul Zulu JDK 11
    brew install --cask zulu11

    # install Java Adopt Open JDK 8
    brew install --cask adoptopenjdk/openjdk/adoptopenjdk8

    # install ItelliJ IDEA (note: need to request software license)
    brew install --cask intellij-idea

    # install Slack
    brew install --cask slack

    # install Docker
    brew install --cask docker

    # install Kubectl
    brew install kubectl 

    # install Quark CLI
    install_quark_cli

    # install Strat CLI (https://docs.ulti.io/systems/cloud-engine/kubernetes/stratcli)
    sh -c "$(https://ultigit.ultimatesoftware.com/projects/STRAT/repos/stratcli/raw/hack/install.sh?at=refs%2Fheads%2Fmaster)"
}

install_optional() {
    #####
    # Optional Installations
    #####

    # install iTerm2
    yes_no_question "iTerm2" "brew install --cask iterm2"

    # install Robo 3T
    yes_no_question "Robo 3T" "brew install --cask robo-3t"

    #install Postman
    yes_no_question "Postman" "brew install --cask postman"

    #install VSCode
    yes_no_question "Visual Studio Code" "brew install --cask visual-studio-code"

    # install Node Version Manager
    yes_no_question "Node Version Manager (nvm)" "brew install nvm"

    # install Google Chrome
    yes_no_question "Google Chrome" "brew install --cask google-chrome"
    
    # install Mozilla Firefox
    yes_no_question "Mozilla Firefox" "brew install --cask firefox"

    # install Keeper Password Manager
    yes_no_question "Keeper Password Manager" "brew install --cask keeper-password-manager"

    # install Oh My Zsh
    yes_no_question "Oh My Zsh (shell)" "sh -c '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"
}

print_required_software() {
    echo "* Command Line Tools (CLT) for Xcode"
    echo "* Homebrew"
    echo "* Cask"
    echo "* Git"
    echo "* Ruby"
    echo "* Maven"
    echo "* Node"
    echo "* Java Azul Zulu JDK 11"
    echo "* Java Adopt Open JDK 8"
    echo "* IntelliJ IDEA (note: need to request software license)"
    echo "* Slack"
    echo "* Docker"
    echo "* Kubectl"
    echo "* Quark CLI"
    echo "* Strat CLI"
}

############################### MAIN ###############################

# print_required_software
# yes_no_question "the above metioned software" "install_required"
# install_optional