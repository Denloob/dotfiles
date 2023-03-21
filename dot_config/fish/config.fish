if status is-interactive
    # Remove the greeting
    set fish_greeting ""

    # Initialize python environment
    pyenv init - | source

    # If we are in tty1 and dwm not running, startx.
    if test (tty) = "/dev/tty1" && not pgrep -x dwm
        startx
    end

    # Abbreviate `v` to `nvim`
    abbr -a --position command v nvim
end
