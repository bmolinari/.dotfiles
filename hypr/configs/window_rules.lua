----------------------
---- WINDOW RULES ----
----------------------
local S = require("configs.shared")

-- See https://wiki.hypr.land/configuring/core/rules/

-- General rule for all windows
hl.window_rule({ name = "suppress-maximize", match = { class = ".*" }, suppress_event = "maximize" })

-- BROWSER
-- hl.window_rule({ name = "browser-opacity", match = { class = "^(" .. S.browser .. ")$" }, opacity = "0.90 0.90" })
hl.window_rule({ name = "browser",  match = { class = "^(" .. S.browser .. ")$" },  workspace = "1" })

-- TERMINAL
hl.window_rule({ name = "terminal", match = { class = "^(" .. S.terminal .. ")$" }, workspace = "2" })

-- MENU
hl.window_rule({ name = "menu",     match = { class = "^(wofi)$" },                 opacity = "0.10 0.10" })

-- DRAWING
hl.window_rule({ name = "drawing",  match = { class = "^(" .. S.drawing .. ")$" },  workspace = "4" })

-- MUSIC
hl.window_rule({ name = "music",    match = { class = "^(" .. S.music .. ")$" },    workspace = "11" })

-- DISCORD
hl.window_rule({ name = "discord",  match = { class = "^(discord)$" },              workspace = "12" })

-- STEAM
hl.window_rule({ name = "steam",    match = { class = "^steam$" },                  workspace = "13 silent" })
