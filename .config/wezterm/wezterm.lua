local wezterm = require("wezterm");

local config = {}

-- Clearer error messages in newer versions
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Disable update check
config.check_for_updates = false

-- Config
config.color_scheme = "One Dark (Gogh)"
config.font = wezterm.font("JetBrains Mono")
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.force_reverse_video_cursor = true

config.colors = {
    foreground = "#abb2bf",
}

local action = wezterm.action

config.mouse_bindings = {
    -- Font Size
    -- Scrolling up while holding CTRL increases the font size
    {
        mods = "CTRL",
        event = { Down = { streak = 1, button = { WheelUp = 1 } } },
        action = action.IncreaseFontSize,
    },

    -- Scrolling down while holding CTRL decreases the font size
    {
        mods = "CTRL",
        event = { Down = { streak = 1, button = { WheelDown = 1 } } },
        action = action.DecreaseFontSize,
    },
}

config.keys = {
    -- ----- Open/Move/Close Tabs -----
    -- Close current tab
    {
        mods = "CTRL|SHIFT",
        key = "w",
        action = action.CloseCurrentTab { confirm = true },
    },
    -- Open new tab
    {
        mods = "CTRL",
        key = "t",
        action = action { SpawnTab = "CurrentPaneDomain" },
    },
    -- Move current tab to the left
    {
        mods = "CTRL|SHIFT",
        key = "h",
        action = action { MoveTabRelative = -1 },
    },
    -- Move current tab to the right
    {
        mods = "CTRL|SHIFT",
        key = "l",
        action = action { MoveTabRelative = 1 },
    },

    -- ----- Changing Tabs -----
    {
        mods = "CTRL",
        key = "1",
        action = action { ActivateTab = 0 },
    },
    {
        mods = "CTRL",
        key = "2",
        action = action { ActivateTab = 1 },
    },
    {
        mods = "CTRL",
        key = "3",
        action = action { ActivateTab = 2 },
    },
    {
        mods = "CTRL",
        key = "4",
        action = action { ActivateTab = 3 },
    },
    {
        mods = "CTRL",
        key = "5",
        action = action { ActivateTab = 4 },
    },
    {
        mods = "CTRL",
        key = "6",
        action = action { ActivateTab = 5 },
    },
    {
        mods = "CTRL",
        key = "7",
        action = action { ActivateTab = 6 },
    },
    {
        mods = "CTRL",
        key = "8",
        action = action { ActivateTab = 7 },
    },
    {
        mods = "CTRL",
        key = "9",
        action = action { ActivateTab = 8 },
    },
    {
        mods = "CTRL",
        key = "0",
        action = action { ActivateTab = 9 },
    },

}

return config
