Install with [tpm](https://github.com/tmux-plugins/tpm).

## Options

### `@quick-manual-key`

Default: `M`

The key to trigger this plugin.
The default trigger key is `M` for "manual".
So you can pull up the plugin popup window
by pressing the tmux prefix key and then the `M` key.

To pick a different key,
for example, `Tab`,
add the following line to your `~/.tmux.conf`:

```tmux
set-option -g @quick-manual-key 'tab'  # Use tab to check manpages.
```

### `@quick-manual-popup-min-width`

Default: `80`

The minimum width of the popup window.
If the lines are too narrow,
it can be hard to read the manual pages.
By default,
the popup window will be half as wide as the tmux window,
unless that's narrower than the defined minimum width.

## Future ideas

-   Check `--help` of a command if it doesn't have a manpage.
-   Check `help` for shell builtins.
