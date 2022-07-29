# set path
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

