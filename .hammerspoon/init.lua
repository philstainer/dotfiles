-- hs.messages.iMessage("+447915824131", "Hey! I'm at Baristartisan's, come join me!")
-- hs.messages.SMS("+447915824131", "Hey, you don't have an iPhone, but you should still come for a coffee")

-- Applications
hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "1", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "2", function()
  hs.application.launchOrFocus("Arc")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "3", function()
  hs.application.launchOrFocus("OBS")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "4", function()
  hs.application.launchOrFocus("WhatsApp")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "5", function()
  hs.application.launchOrFocus("Messages")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "6", function()
  hs.application.launchOrFocus("Microsoft Outlook")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "7", function()
  hs.application.launchOrFocus("Notion")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "8", function()
  hs.application.launchOrFocus("Finder")
end)

-- Click menu item
-- hs.hotkey.bind({ "cmd", "alt", "ctrl", 'shift' }, "E", function()
--   hs.application.get("Hammerspoon"):selectMenuItem("Console...")
--   hs.application.launchOrFocus("Hammerspoon")
-- end)

-- Defeating paste blocking
hs.hotkey.bind({ "cmd", "alt" }, "V", function()
  hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Reload HS config
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/init.lua", hs.reload):start()

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

hs.alert.show("Hammerspoon config reloaded...")
