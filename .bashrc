################################## ME HEP dotfiles ##################################



# Source additional files

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
        fi

# Add bash functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
    fi

# Add bash aliases
if [ -e $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
    fi

# Add bash config
if [ -e $HOME/.bash_config ]; then
    source $HOME/.bash_config
    fi

if [ -e $HOME/.machine_aliases ]; then
    source $HOME/.machine_aliases
    fi



################################## ME HEP dotfiles ##################################



