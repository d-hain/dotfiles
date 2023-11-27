local wezterm = require("wezterm");

local config = {}

-- Clearer error messages in newer versions
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Config
config.color_scheme = "One Dark (Gogh)"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("Monocraft")
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.force_reverse_video_cursor = true

config.colors = {
    foreground = "#abb2bf",
}

config.keys = {
    {
        mods = "CTRL",
        key = "w",
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
        mods = "CTRL",
        key = "t",
        action = wezterm.action { SpawnTab = "CurrentPaneDomain" },
    },
    {
        mods = "CTRL|SHIFT",
        key = "h",
        action = wezterm.action { MoveTabRelative = -1 },
    },
    {
        mods = "CTRL|SHIFT",
        key = "l",
        action = wezterm.action { MoveTabRelative = 1 },
    },

    -- Tabs
    {
        mods = "CTRL",
        key = "1",
        action = wezterm.action { ActivateTab = 0 },
    },
    {
        mods = "CTRL",
        key = "2",
        action = wezterm.action { ActivateTab = 1 },
    },
    {
        mods = "CTRL",
        key = "3",
        action = wezterm.action { ActivateTab = 2 },
    },
    {
        mods = "CTRL",
        key = "4",
        action = wezterm.action { ActivateTab = 3 },
    },
    {
        mods = "CTRL",
        key = "5",
        action = wezterm.action { ActivateTab = 4 },
    },
    {
        mods = "CTRL",
        key = "6",
        action = wezterm.action { ActivateTab = 5 },
    },
    {
        mods = "CTRL",
        key = "7",
        action = wezterm.action { ActivateTab = 6 },
    },
    {
        mods = "CTRL",
        key = "8",
        action = wezterm.action { ActivateTab = 7 },
    },
    {
        mods = "CTRL",
        key = "9",
        action = wezterm.action { ActivateTab = 8 },
    },
    {
        mods = "CTRL",
        key = "0",
        action = wezterm.action { ActivateTab = 9 },
    },

}

return config
