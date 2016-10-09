#!/usr/bin/zsh

# Copyright (c) 2016, Zsolt Lengyel

# you can put this line to your ~/.tmux.conf and call the script with ctrl+b h
# bind h run-shell -b '~/znt-tmux.zsh'


# get and save the current active tmux pane id
active_pane=$(tmux display -p -F :#{session_id}:#I:#P:#{pane_active}:#{window_active}:#{session_attached} )
a_active_pane=("${(@s/:/)active_pane}")

active_session=${a_active_pane[2]//$}
active_window=$a_active_pane[3]
active_pane=$a_active_pane[4]

# create a new window in the active session and call it znt-hist
tmux new-window -t $active_session: -n znt-hist

# save znt's session id
znt_active_pane=$(tmux display -p -F :#{session_id}:#I:#P:#{pane_active}:#{window_active}:#{session_attached} )
znt_a_active_pane=("${(@s/:/)znt_active_pane}")

export znt_active_session=${znt_a_active_pane[2]//$}
export znt_active_window=$znt_a_active_pane[3]
export znt_active_pane=$znt_a_active_pane[4]

# call znt
# TODO znt-history-widget should know that it was called from this script
tmux send -t $znt_active_session:$znt_active_window.$znt_active_pane znt-history-widget ENTER

# after znt finished the result should be pasted into the last pane with this command:
# znt-history-widget should send the $selected_command to the active session with this line:
# tmux send -t $active_session:$active_window.$active_pane $selected_command

# after the tmux-send, the znt-hist pane can be killed with:
# tmux kill-window -t $znt_active_session:$znt_active_window.$znt_active_pane
