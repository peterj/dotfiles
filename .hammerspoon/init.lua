-- Based on: 
-- https://github.com/zzamboni/dot-hammerspoon/blob/master/init.org#general-variables-and-configuration 

-- local emoji = require("emoji")
--   Pomo = require('pomodoro')

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
hs.hotkey.bind(hyper, "r", function()
  hs.reload()
  hs.alert.show("Config reloaded")
end)

-- Setup emoji keyboard
hs.hotkey.bind(hyper, "e", function()
    emoji.enterEmojiMode()
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
                 },
              }
)

Install:andUse("EjectMenu", {
  config = {
    eject_on_lid_close = true,
    show_in_menubar = true,
    notify = true,
  },
  hotkeys = { ejectAll = { hyper, "=" } },
  start = true,
})
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


-- Setup window sizes
AllWindowSizes = {}
AllWindowSizes[0] = { w = 1280, h = 720 }
AllWindowSizes[1] = { w = 1920, h = 1080 }
AllWindowSizes[2] = { w = 2560, h = 1440 }
AllWindowSizes[3] = { w = 3840, h = 2160 }

local CurrentWindowSize = 0

hs.hotkey.bind(cmd_alt, 's', function()
	local win = hs.window.focusedWindow()
  
  if CurrentWindowSize < #AllWindowSizes then
    CurrentWindowSize = CurrentWindowSize + 1
  else
    CurrentWindowSize = 0
  end

  local newSize = AllWindowSizes[CurrentWindowSize]

  hs.alert.show(newSize.w .. "x" .. newSize.h)
  win:setSize(newSize)

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