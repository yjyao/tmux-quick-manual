#!/usr/bin/env bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

quick_manual_key="$(tmux show-option -gqv @quick-manual-key)"
[[ ${quick_manual_key} ]] || quick_manual_key='M'  # Default.

tmux bind-key "${quick_manual_key}" display-popup -E "$SOURCE_DIR/scripts/quick-manual.sh"
