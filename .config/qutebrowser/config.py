config.load_autoconfig(False)
config.set("colors.webpage.darkmode.enabled", True)

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('Z', 'hint links spawn st -e yt-dlp {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('xb', 'config-cycle statusbar.show always never')
