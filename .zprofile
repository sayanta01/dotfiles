# set path
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"
