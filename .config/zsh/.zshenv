if [ -f "$HOME/.local/share/cargo/env" ]; then
	source "$HOME/.local/share/cargo/env"
else
	source "$HOME/.cargo/env"
fi
