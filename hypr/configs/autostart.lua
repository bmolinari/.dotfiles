-------------------
---- AUTOSTART ----
-------------------
local S = require("configs.shared")

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd(S.browser)
    hl.exec_cmd(S.terminal)
    hl.exec_cmd(S.music)
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("discord")
    hl.exec_cmd(S.steam)
end)
