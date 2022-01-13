#!/bin/bash
while true; do
    read -p "Do you want to install required software (y/n) " yn
    case $yn in
        [Yy]* ) echo "Installing required software..." 
                echo "Installing optional software..." 
                break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done



install_required() {
    #####
    # Required Installations
    #####

    # install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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

    # install Azul Zule JDK 11
    brew tap AdoptOpenJDK/openjdk

    brew install --cask adoptopenjdk/openjdk/adoptopenjdk8

    # install ItelliJ IDEA (note: need to request software license)
    brew install --cask intellij-idea

    # install Slack
    brew install --cask slack

    # install Docker
    brew install --cask docker

    # install Yeoman for code generation
    npm install -g yo
}

install_optional() {
    #####
    # Optional Installations
    #####

    # install iTerm2
    brew install --cask iterm2

    # install Robo 3T
    brew install --cask robo-3t

    #install Postman
    brew install --cask postman

    #install VSCode
    brew install --cask visual-studio-code
}