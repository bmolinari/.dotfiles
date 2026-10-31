---------------------
---- KEYBINDINGS ----
---------------------
local S = require("configs.shared")

local mainMod   = "ALT"
local secondMod = "SUPER"

local screenshot = 'grim -g "$(slurp)" $HOME/Pictures/Screenshots/$(date +\'%s_grim.png\')'

hl.bind(mainMod .. " + RETURN",    hl.dsp.exec_cmd(S.scriptsDir .. "/Terminal.sh"))
hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(S.fileManager))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(S.menu))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + Print",     hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + T",         hl.dsp.exec_cmd(screenshot))
hl.bind(mainMod .. " + Y",         hl.dsp.exec_cmd(S.scriptsDir .. "/WallpaperSelect.sh"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Workspaces 1-10 live on the primary monitor (mainMod), 11-20 on the secondary (secondMod)
-- Switch with mod + [0-9], move active window with mod + SHIFT + [0-9]
local function workspaceBinds(mod, offset, monitor)
    for i = 1, 10 do
        local key = i % 10 -- 10 maps to key 0
        local ws  = i + offset
        hl.workspace_rule({ workspace = tostring(ws), monitor = monitor })
        hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = ws }))
        hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
    end
end

workspaceBinds(mainMod,   0,  S.primaryMonitor)
workspaceBinds(secondMod, 10, S.secondaryMonitor)

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
