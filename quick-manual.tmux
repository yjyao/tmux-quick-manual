#!/usr/bin/env bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

quick_manual_key="$(tmux show-option -gqv @quick-manual-key)"
[[ ${quick_manual_key} ]] || quick_manual_key='M'  # Default.

popup_min_width="$(tmux show-option -gqv @quick-manual-popup-min-width)"
[[ ${popup_min_width} ]] || popup_min_width='80'  # Default.

tmux bind-key "${quick_manual_key}" run -b \
  "$SOURCE_DIR/scripts/quick-manual-popup.sh -w ${popup_min_width}"
