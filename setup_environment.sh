#!/bin/zsh

############################### VARIABLES ###############################

OH_MY_ZSH_INSTALLED=
ITERM2_INSTALLED=

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
                    return_value="y"
                    break;;
            [Nn]* ) return_value=""; break;;
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

# install zsh plugin
# $1 -> git repo url of the plugin to install
# $2 -> plugin name
install_zsh_plugin() {
    git clone $1 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$2
    echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$2/$2.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
    source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$2/$2.zsh
}

install_fzf_tab_completion() {
    echo "Installing fzf dependecy for fzf-tab-completion..."
    brew install fzf
    $(brew --prefix)/opt/fzf/install

    echo "Installing gawk dependecy for fzf-tab-completion..."
    brew install gawk

    echo "Installing fzf-tab-completion..."
    git clone https://github.com/lincheney/fzf-tab-completion ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab-completion
    echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh" >> ${ZDOTDIR:-$HOME}/.zshrc
    source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
}

install_optional_zsh_plugins() {
    if [ -z "${OH_MY_ZSH_INSTALLED}" ]; then
        echo "Oh My Zsh was not installed, skipping plugin installation"
    else
        echo "Oh My Zsh was installed"

        # install plugin zsh-syntax-highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
        yes_no_question "zsh-syntax-highlighting plugin" "install_zsh_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting"

        # install plugin zsh-syntax-highlighting (https://github.com/zsh-users/zsh-autosuggestions)
        yes_no_question "zsh-autosuggestions plugin" "install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions"

        # install https://github.com/lincheney/fzf-tab-completion (https://github.com/lincheney/fzf-tab-completion)
        yes_no_question "fzf-tab-completion plugin" "install_fzf_tab_completion"

        if [ -z "${ITERM2_INSTALLED}" ]; then
            echo "iTerm2 was not installed, skipping powerlevel10k plugin"
        else
            echo "iTerm2 was installed"
            yes_no_question "powerlevel10k theme" "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
            echo $fg_bold[yellow] "##### <<< WARNING, PLEASE READ BELOW! >>> #####"
            echo "To enable powerlevel10k theme, please set ZSH_THEME=\"powerlevel10k/powerlevel10k\" in ~/.zshrc and open a new terminal window"
        fi
    fi
}
install_optional() {
    #####
    # Optional Installations
    #####

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

    # install Jabba (https://github.com/shyiko/jabba)   
    yes_no_question "Jabba" "brew install jabba"

    # install iTerm2
    yes_no_question "iTerm2" "brew install --cask iterm2"
    ITERM2_INSTALLED=$return_value

    # install Oh My Zsh (https://ohmyz.sh)
    yes_no_question "Oh My Zsh (shell)" "sh -c '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"
    OH_MY_ZSH_INSTALLED=$return_value

    # install terminal plugins
    install_optional_zsh_plugins
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

print_required_software
yes_no_question "the above metioned software" "install_required"
install_optional
install_optional_zsh_plugins

# test() {
#     return_value="Test1"
#     echo $return_value
#     yes_no_question "Testing return value" "git status"
#     OH_MY_ZSH_INSTALLED=$return_value
#     echo "Printing return value"
#     echo $return_value
# }

# yes_no_question "zsh-autosuggestions" "install_zsh_plugin https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions"

# test
# echo "Printing INSTALLED"
# echo $OH_MY_ZSH_INSTALLED
# install_zsh_plugins
# install_fzf_tab_completion