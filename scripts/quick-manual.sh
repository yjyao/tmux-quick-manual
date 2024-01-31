#!/usr/bin/env -S bash -l

list_manpages() {
  whatis -r . |  # List all manpages.
    cat -n |  # Each line looks like "linenumber manpage (section) - manpage description".
    sort -k3.2bn,3 -k1bn,1 |  # Sort by section number; break tie by linenumber.
    sed -E 's/^\s*[0-9]+\s*//'  # Remove linenumber at the begining of the lines.
}

if command -v fzf &>/dev/null; then
  page="$(list_manpages |
            "$HOME/.fzf/bin/fzf" --tiebreak 'begin' |
            sed -E 's/^(\S+)\s+\((\w+)\)\s+.*$/\1.\2/'  # Format description lines into "manpage.section".
                                                        # For example, "grep (1) - print lines ..." becomes "grep.1".
         )"
else
  read -p 'Read manual page: ' page
fi
[[ $page ]] || exit
man "$page" || { sleep 1.5; exit 1; }
