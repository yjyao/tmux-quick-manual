#!/usr/bin/env bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

min_width=0

params="$(getopt -o w: -- "$@")" || usage 1
eval set -- "$params"
while [[ $# > 0 ]]; do
  case $1 in
    -w )
      min_width="$2"; shift
      ;;
    -- )
      shift
      break
      ;;
  esac
  shift
done

window_width="$(tmux display -p '#{window_width}')"
popup_width="$(( window_width / 2 ))"
if (( popup_width < min_width )); then
  (( min_width < window_width )) &&
    popup_width="${min_width}" ||
    popup_width="${window_width}"
fi

tmux display-popup -w "${popup_width}" -E "$SOURCE_DIR/quick-manual.sh" &
