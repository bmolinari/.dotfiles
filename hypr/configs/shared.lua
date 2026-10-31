-- Shared variables, required by the other config modules
local home = os.getenv("HOME")

return {
    home       = home,
    scriptsDir = home .. "/.config/hypr/scripts",

    -- Monitor variables
    primaryMonitor   = "DP-1",
    secondaryMonitor = "HDMI-A-1",

    -- App variables
    terminal    = "kitty",
    browser     = "chromium",
    fileManager = "thunar",
    menu        = "wofi --show drun",
    drawing     = "Gimp-2.10",
    music       = "Spotify",
    steam       = "steam",
}
