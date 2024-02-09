#!/usr/bin/env -S bash -l

list_manpages() {
  whatis -r . | # List all manpages.
    cat -n |  # Each line looks like "linenumber manpage (section) - manpage description".
    sort -k3.2bn,3 -k1bn,1 |  # Sort by section number; break tie by linenumber.
    sed -E 's/^\s*[0-9]+\s*//'  # Remove linenumber at the begining of the lines.
}

list_commands() {
  # List binaries only.
  # They are all runnable commands except for
  # "a"liases, "b"uilt-ins, "k"eywords, and "function"s.
  comm -23 <(compgen -c | sort -u) <(compgen -abkA function | sort -u) |
    sed 's/.*/& (--help)  - Help output for command &/'
}

if command -v fzf &>/dev/null; then
  page="$(cat <(list_manpages) <(list_commands) |
            "$HOME/.fzf/bin/fzf" --tiebreak 'begin' |
            sed -E 's/^(\S+)\s+\((\S+)\)\s+.*$/\1.\2/'  # Format description lines into "manpage.section".
                                                        # For example, "grep (1) - print lines ..." becomes "grep.1".
         )"
else
  read -p 'Read manual page: ' page
fi
[[ $page ]] || exit

# Extract the command name for the special "--help" sections.
# There is no "--help" section for manpages,
# we are going to run the command to retrieve the help output.
# This variable is ignored and unused
# if the manpage section is not "--help".
cmd="${page%%.--help}"

man "$page" || "${cmd}" --help |& pager
