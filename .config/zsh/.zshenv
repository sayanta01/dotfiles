if [ -f "$HOME/.local/share/cargo/env" ]; then
    source "$HOME/.local/share/cargo/env"
elif [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi
