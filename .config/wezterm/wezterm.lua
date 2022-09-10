local wezterm = require 'wezterm';
local act = wezterm.action

return {
  font = wezterm.font("HackGen Console NFJ"),
  font_size = 14.6,
  use_ime = true,
  keys = {
    { key = 'C', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection', },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard', },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection', },
  },
}
