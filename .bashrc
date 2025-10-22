# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

alias emacsold='emacs'
alias emacs='emacs-30.1-gtk+x11'

unset rc
. "$HOME/.cargo/env"

export PATH="$HOME/.emacs.d/bin/:$PATH"
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"
alias config='/usr/bin/git --git-dir=/home/giovanni/dotfiles --work-tree=/home/giovanni'
