################################## ME HEP dotfiles ##################################

# Change directories and view the contents at the same time
function cl() {
    DIR="$*";
    # if no DIR given, go home
    if [ $# -lt 1 ]; then
        DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    ls -F --color=auto
}				

# Common tmux usage function
tx() {
    case $1 in
        -n)
            tmux new-session -d -s "$2" && tmux attach-session -t "$2"
            ;;
        -t)
            tmux attach-session -t "$2"
            ;;
        -d)
            tmux kill-session -t "$2"
            ;;
        -h)
            echo "Usage: tx -n [session_name] | -t [session_name] | -d [session_name]"
            echo "Options:"
            echo "-n [session_name] : Create a new session with the given name and attach to it"
            echo "-t [session_name] : Attach to an existing session with the given name"
            echo "-d [session_name] : Delete a session with the given name"
            echo "-h                : Display this help message"
            ;;
        *)
            echo "Invalid option: $1. Use -h for help" 1>&2
            ;;
    esac
}

# Extract most known archives with one command
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)           echo "'$1' cannot be extracted via extract()" ;;
      esac
    else
      echo "'$1' is not a valid file"
    fi
}

# Cheatsheets https://github.com/chubin/cheat.sh
function cht() {
  curl https://cheat.sh/$1
}

# Show frequently used commands
function freq_cmd() {
  if [[ -n "$1" ]]; then
    history | awk '{print $4}' | sort | uniq -c | sort -nr | head -n $1
  else
    history | awk '{print $4}' | sort | uniq -c | sort -nr | head
  fi
}

# Function to get the size of a file or folder in MB or GB
get_size() {
  local path="$1"
  
  # Check if the path exists
  if [[ ! -e "$path" ]]; then
    echo "Error: File or folder not found!"
    return 1
  fi
  
  # Get the size in bytes
  local size=$(du -sb "$path" | awk '{print $1}')
  
  # Check if the size is greater than or equal to 1 GB
  if [[ $size -ge 1073741824 ]]; then
    local size_gb=$(bc <<< "scale=2; $size / 1073741824")
    echo "Size of '$path': $size_gb GB"
  else
    local size_mb=$(bc <<< "scale=2; $size / 1048576")
    echo "Size of '$path': $size_mb MB"
  fi
}

# Show all aliases, functions, and scripts in user PATH
list_commands() {
  echo "User-defined Aliases:"
  alias

  echo
  echo "User-defined Functions:"
  typeset -f | awk '/^[a-zA-Z0-9]/ {print $1}' | while read -r function_name; do
    echo $function_name
  done
}

################################## ME HEP dotfiles ##################################
