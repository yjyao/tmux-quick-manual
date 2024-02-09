#!/usr/bin/env bash

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

get_tmux_option() {
  local option_name="${1?}"  default="$2"
  local ret="$(tmux show-option -gqv "${option_name}")"
  [[ ${ret} ]] || ret="${default}"
  echo "${ret}"
}

quick_manual_key="$(get_tmux_option '@quick-manual-key' 'M')"
popup_min_width="$(get_tmux_option '@quick-manual-popup-min-width' 80)"

tmux bind-key "${quick_manual_key}" run -b \
  "$SOURCE_DIR/scripts/quick-manual-popup.sh -w ${popup_min_width}"
