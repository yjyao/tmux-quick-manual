#!/usr/bin/env -S bash -l

if command -v fzf 2>/dev/null; then
  page="$(whatis -r . | "$HOME/.fzf/bin/fzf" --tiebreak 'begin' | sed -E 's/^([a-zA-Z0-9@:._\[+-]+)\s+\((\w+)\)\s+-.*$/\1.\2/')"
else
  read -p 'Read manual page: ' page
fi
[[ $page ]] || exit
man "$page" || { sleep 1.5; exit 1; }
