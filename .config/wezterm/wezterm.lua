local wezterm = require 'wezterm';
local act = wezterm.action

local defaultProgramArgs = {};

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  defaultProgramArgs = wezterm.default_prog;
elseif wezterm.target_triple == 'x86_64-apple-darwin' then
  defaultProgramArgs = wezterm.default_prog;
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  defaultProgramArgs[1] = '/usr/bin/fish';
  defaultProgramArgs[2] = '-l';
end

return {
  default_prog = defaultProgramArgs,
  font = wezterm.font("HackGen Console NFJ"),
  font_size = 14.6,
  color_scheme = 'Dracula',
  window_background_opacity = 1.0,
  text_background_opacity = 1.0,
  use_ime = true,
  keys = {
    { key = 'C', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection', },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard', },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection', },
  },
}
