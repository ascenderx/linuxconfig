#!/bin/bash

##########
# This file is meant for non-login Bash shells (most terminal windows on the
# desktop).
##########

# Import POSIX-shell (sh) configurations, including any $PATH additions.
source .profile

# If we're not in an interactive shell, then quit here.
case $- in
  *i*) ;;
  *) return ;;
esac

##########
# ALIASES FOR BUILT-IN PROGRAMS
##########

# Import variables ANSI TTY formatting colors and codes.
source .bashfmt

# Query the user for all multiple-file operations.
# This should help prevent accidental deletions (rm).
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Use human-readable file sizes when checking free space, disk lists, etc.
alias df="df -h"
alias du="du -h"

# Display regex searches in color.
alias grep="grep --color"
alias egrep="egrep --color"
alias fgrep="fgrep --color"

##########
# ALIASES FOR LISTING DIRECTORIES
# See `ls --help` or `man ls` for more details.
##########

COLOR_OPT="--color=auto"
GROUP_OPT="--group-directories-first"

# Import file and folder colors.
source .lscolors

# MULTI-COLUMN MODE

# Display only visible files and folders by default.
alias ls="ls -Fx $COLOR_OPT $GROUP_OPT"

# Display all files and folders (including hidden ones).
alias lsa="ls -AFx $COLOR_OPT $GROUP_OPT"

# Display only hidden files and folders.
alias lsh="ls -dFx $COLOR_OPT $GROUP_OPT .*"

# ATTRIBUTE-LIST MODE

# Display only visible files and folders.
alias lsl="ls -Fho $COLOR_OPT $GROUP_OPT"

# Display all files and folders.
alias lsla="ls -AFho $COLOR_OPT $GROUP_OPT"

# Display only hidden files and folders.
alias lslh="ls -dFho $COLOR_OPT $GROUP_OPT .*"

# SINGLE-COLUMN MODE

# Display only visible files and folders.
alias lss="ls -F1 $COLOR_OPT $GROUP_OPT"

# Display all files and folders.
alias lssa="ls -AF1 $COLOR_OPT $GROUP_OPT"

# Display only hidden files and folders.
alias lssh="ls -dF1 $COLOR_OPT $GROUP_OPT .*"

##########
# TERMINAL SETTINGS
##########
PS1="$PS1_BY\u $PS1_BC\W $PS1_BG\$ $PS1_X"

