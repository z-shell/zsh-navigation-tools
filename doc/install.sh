#!/bin/sh

if ! type git 2>/dev/null 1>&2; then
  echo "Please install GIT first"
  echo "Exiting"
  exit 1
fi

#
# Clone or pull
#

if ! test -d "$HOME/.config"; then
  mkdir "$HOME/.config"
fi

if ! test -d "$HOME/.config/znt"; then
  mkdir "$HOME/.config/znt"
fi

echo ">>> Downloading zsh-navigation-tools to ~/.config/znt"
if test -d ~/.config/znt/zsh-navigation-tools; then
  cd ~/.config/znt/zsh-navigation-tools || exit
  git pull origin main
else
  cd ~/.config/znt || exit
  git clone https://github.com/z-shell/zsh-navigation-tools.git zsh-navigation-tools
fi
echo ">>> Done"

#
# Copy configs
#

echo ">>> Copying config files"

cd ~/.config/znt || exit

set n-aliases.conf n-env.conf n-history.conf n-list.conf n-panelize.conf n-cd.conf n-functions.conf n-kill.conf n-options.conf

for i; do
  if ! test -f "$i"; then
    cp -v zsh-navigation-tools/.config/znt/"$i" .
  fi
done

echo ">>> Done"

#
# Modify .zshrc
#

echo ">>> Updating .zshrc"
if ! grep zsh-navigation-tools ~/.zshrc >/dev/null 2>&1; then
  cat <<'EOF' >>~/.zshrc

  ### ZNT's installer added snippet ###
  fpath=( "$fpath[@]" "$HOME/.config/znt/zsh-navigation-tools" )
  autoload n-aliases n-cd n-env n-functions n-history n-kill n-list n-list-draw n-list-input n-options n-panelize n-help
  autoload znt-usetty-wrapper znt-history-widget znt-cd-widget znt-kill-widget
  alias naliases=n-aliases ncd=n-cd nenv=n-env nfunctions=n-functions nhistory=n-history
  alias nkill=n-kill noptions=n-options npanelize=n-panelize nhelp=n-help
  zle -N znt-history-widget
  bindkey '^R' znt-history-widget
  setopt AUTO_PUSHD HIST_IGNORE_DUPS PUSHD_IGNORE_DUPS
  zstyle ':completion::complete:n-kill::bits' matcher 'r:|=** l:|=*'
  ### END ###

EOF

else
  echo ">>> .zshrc already updated, not making changes"
fi
