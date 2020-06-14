-- Based on: 
-- https://github.com/zzamboni/dot-hammerspoon/blob/master/init.org#general-variables-and-configuration 

-- General configuration 
hyper = { "cmd", "alt", "ctrl" }
shift_hyper = { "cmd", "alt", "ctrl", "shift" }
ctrl_cmd = { "cmd","ctrl" }
cmd_alt = { "cmd", "alt" }

-- Disable animation
hs.window.animationDuration = 0

-- Load SpoonInstall
hs.loadSpoon("SpoonInstall");
spoon.SpoonInstall.repos.official = {
    url ="https://github.com/Hammerspoon/Spoons",
    desc = "Official spoon repository",
}
spoon.SpoonInstall.use_syncinstall = true
-- shortcut to use Install:andUse instead of spoon.SpoonInstall:andUse
Install=spoon.SpoonInstall

-- Setup automatic config reload
hs.hotkey.bind(hyper, "R", function()
    hs.reload()
    hs.notify.new({title="HS config reloaded", informativeText="Config reloaded"}):send()
end)

-- Configure the window manager
-- https://github.com/miromannino/miro-windows-manager
hs.window.animationDuration = 0
Install:andUse("MiroWindowsManager",
               {
                 hotkeys = {
                   up =         { cmd_alt, "up" },
                   right =      { cmd_alt, "right" },
                   down =       { cmd_alt, "down" },
                   left =       { cmd_alt, "left" },
                   fullscreen = { cmd_alt,    "F" }
                 }
               }
)

-- Center focused window
hs.hotkey.bind(cmd_alt, 'c', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local max = win:screen():frame()

	local x = f

	x.x = ((max.w - f.w) / 2) + max.x
	x.y = ((max.h - f.h) / 2) + max.y
	win:setFrame(x)
end)


-- Move the windows across multiple monitors (hyper + left/right)
-- http://www.hammerspoon.org/Spoons/WindowScreenLeftAndRight.html
Install:andUse("WindowScreenLeftAndRight",
               {
                 hotkeys = 'default'
               }
)

-- Better clipboard manager
-- http://www.hammerspoon.org/Spoons/TextClipboardHistory.html
Install:andUse("TextClipboardHistory",
               {
                 config = {
                   show_in_menubar = false,
                 },
                 hotkeys = {
                   toggle_clipboard = { { "cmd", "shift" }, "v" } },
                 start = true,
               }
)