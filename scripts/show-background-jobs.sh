#!/usr/bin/env bash

set -eou pipefail

current_pane_pid=$(tmux display-message -p '#{pane_pid}')
background_jobs_count=$(pgrep -P "$current_pane_pid")
background_jobs_count=$(echo "$background_jobs_count" | wc -l | xargs)

echo " [$background_jobs_count]"
