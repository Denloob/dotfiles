if status is-interactive
    # Remove the greeting
    set fish_greeting ""

    # Initialize python environment
    pyenv init - | source

    # If we are in tty1 and dwm not running, startx.
    if test (tty) = "/dev/tty1" && not pgrep -x dwm
        startx
    end

    # Abbreviations
    abbr -a --position command v nvim
    abbr -a --position command py python3
    abbr -a --position command pip python3 -m pip
    abbr -a --position command chez chezmoi cd
    abbr -a --position command fs tempfish
    abbr -a --position command sp nvim_scratchpad
    abbr -a --position command sm tmux-sessionizer
end
