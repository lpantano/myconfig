# custom
setw -g mode-mouse on
# bind -t vi-copy y copy-pipe 'xclip -in -selection clipboard'

set -g @yank_selection 'clipboard'
# set -g @shell_mode 'vi'
# tpm
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugins 'tmux-plugins/tpm'
set -g @plugins 'tmux-plugins/tmux-resurrect'
set -g @plugins 'tmux-plugins/tmux-continuum'
set -g @plugins 'tmux-plugins/tmux-yank'

set -g @continuum-restore 'on'
set -g @continuum-save-interval '30'

# run-shell ~/myconfig/tmux-resurrect/resurrect.tmux
set -g @resurrect-processes 'ssh'
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-save-bash-history 'off'
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-restore 'R'

source $BYOBU_PREFIX/share/byobu/profiles/tmux

run '~/.tmux/plugins/tpm/tpm'
