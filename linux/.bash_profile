# Interactive options
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Human-readable figures
alias df='df -h'
alias du='du -h'

# Show differences in color
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Shortuct for directory listings
alias lx='ls -hFGx --group-directories-first'
alias ll='ls -hFGo --group-directories-first'
alias lR='ls -hFGR --group-directories-first'
alias la='ls -AhFGo --group-directories-first'

# Set directory colors in ls to cyan
export LS_COLORS=$LS_COLORS:'di=1;36'

# Get ANSI colors
source ~/.bash_colors

# Custom prompt
export PS1="$_lyellow\u $_lcyan\W $_lgreen$ $_reset"
export PS2="$_LGreen --> $_Reset"

# Set clear to \033c
alias clear='echo -ne "\033c"'
alias pclear='echo -ne "\033c"; echo -ne "\033[3J"'

# Lock screen
alias lock='gnome-screensaver-command -l'

# Load other scripts
source ~/.bash_scripts

# Directory memory commands
alias setlwd='echo $(pwd) > ~/.lastdir'
alias getlwd='pushd $(cat ~/.lastdir) >> /dev/null'

### Commands to run upon terminal execution
cd ~
echo -ne "$_LCyan@$_LRed$HOSTNAME$_Reset\n"