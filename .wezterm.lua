local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'Solarized Dark (Gogh)'
-- config.color_scheme = 'Gruvbox light, soft (base16)'
-- config.color_scheme = "zenbones_dark"
-- config.color_scheme = 'Tokyo Night Day'
-- config.font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("JetbrainsMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("UbuntuMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("ZedMono Nerd Font Mono", { weight = "Regular", stretch = "Expanded" })
config.font = wezterm.font("Zed Mono", { weight = "Regular" })
config.font_size = 17

config.default_cursor_style = 'SteadyUnderline'
-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 64
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
