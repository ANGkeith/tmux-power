#!/usr/bin/env bash
tmux_get() {
	# $1: option
	# $2: default value
	local value="$(tmux show -gqv "$1")"
	[ -n "$value" ] && echo "$value" || echo "$2"
}

tmux_set() {
	# $1: option
	# $2: value
	tmux set-option -gq "$1" "$2"
}

# Options
session_icon=""
user_icon=" "
ram_icon=" "
cpu_icon=" "

# TC=#E4E4E4
TC=#d6d6d6
GR0=#005f86
GR1=#62a5b1
GR2=#3E999F
#4d808a
GR3=colour238
GR6=#D7DDDF
BG="$GR0"
FG="$GR6"

# Status options
tmux_set status-interval 1
tmux_set status on

# Basic status bar colors
tmux_set status-fg "$FG"
tmux_set status-bg "$BG"
tmux_set status-attr none

# Left side of status bar
tmux_set status-left-bg "$GR0"
tmux_set status-left-fg colour243
tmux_set status-left-length 150
user=$(whoami)
LS="#[fg=$GR0,bg=$TC,bold] $user_icon $user #[fg=$TC,bg=$GR2,nobold]#[fg=$TC,bg=$GR2] $session_icon #S "
LS="$LS#[fg=$GR2,bg=$BG]"

tmux_set status-left "$LS"

# Right side of status bar
tmux_set status-right-bg "$GR0"
tmux_set status-right-fg colour243
tmux_set status-right-length 150
RS="#[fg=$TC,bg=$GR2] $cpu_icon #{cpu_percentage} $ram_icon #{ram_percentage} #[fg=$TC,bg=$GR2]"
RS="#[fg=$GR2,bg=$BG]$RS"

tmux_set status-right "$RS"

# Window status
tmux_set window-status-format " #I:#W#F "
tmux_set window-status-current-format "#[fg=$BG,bg=$TC]#[fg=$BG,bold] #I:#W#F #[fg=$TC,bg=$BG,nobold]"
tmux_set window-status-activity-style bg="$GR0"

# Window separator
tmux_set window-status-separator ""

# # Window status alignment
tmux_set status-justify left

# Pane border
tmux_set pane-border-style fg="$GR3" bg=default

# Active pane border
tmux_set pane-active-border-style fg=red bg="$BG"

# Pane number indicator
tmux_set display-panes-colour "$GR3"
tmux_set display-panes-active-colour "$TC"

# Clock mode
tmux_set clock-mode-colour colour002
tmux_set clock-mode-style 24

# Command message
tmux_set message-command-style fg="$TC" bg="$BG"

# Copy mode highlight
tmux_set mode-style bg=#ffd787 fg="$GR1"

tmux_set status-position top
