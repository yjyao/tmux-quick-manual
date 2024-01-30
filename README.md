Install with [tpm](https://github.com/tmux-plugins/tpm).

The default trigger key is `M` for "manual".
To pick a different key,
add the following line to your `~/.tmux.conf`:

```tmux
set-option -g @quick-manual-key 'tab'  # Use tab to check manpages.
```

## Future ideas

-   Check `--help` of a command if it doesn't have a manpage.
-   Check `help` for shell builtins.
