-- Specify your combination (your hyperkey)
local hyper = { "cmd", "alt", "ctrl", "shift" }

-- Applications
hs.hotkey.bind(hyper, "V", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind(hyper, "A", function()
  hs.application.launchOrFocus("Arc")
end)

hs.hotkey.bind(hyper, "W", function()
  hs.application.launchOrFocus("WhatsApp")
end)

hs.hotkey.bind(hyper, "M", function()
  hs.application.launchOrFocus("Messages")
end)

-- Window management
hs.window.animationDuration = 0

hs.hotkey.bind(hyper, "1", function()
  local mainScreen = "LG HDR 4K"
  local windowLayout = {
      {"Arc",  nil,          mainScreen, hs.layout.left50,    nil, nil},
      {"Code",    nil,          mainScreen, hs.layout.right50,   nil, nil},
  }
  hs.layout.apply(windowLayout)
end)


 -- Defeating paste blocking
hs.hotkey.bind({ "cmd", "alt" }, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Reload HS config
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", hs.reload):start()

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)

hs.alert.show("Hammerspoon config reloaded...")
