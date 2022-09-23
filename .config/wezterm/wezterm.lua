local wezterm = require 'wezterm';
local act = wezterm.action

local defaultProgramArgs;
local localLaunchMenu = {};
local localColorSchemeDirs = wezterm.color_scheme_dirs;

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  local wslDistroName = 'Ubuntu-22.04'; 
  defaultProgramArgs = {
    'wsl',
    '-u',
    'tpri',
    '-d',
    wslDistroName,
    '--cd',
    '~',
    '-e',
    '/usr/bin/fish',
    '-c',
    '/usr/libexec/nslogin'
  };
  localColorSchemeDirs = { os.getenv('USERPROFILE') .. '\\.config\\wezterm\\colors' };
  
  table.insert(localLaunchMenu, {
    label = 'Windows PowerShell',
    args = { 'powershell.exe', '-NoLogo' },
  });
  table.insert(localLaunchMenu, {
    label = 'PowerShell',
    args = { 'C:\\Program Files\\WindowsApps\\Microsoft.PowerShell_7.2.6.0_x64__8wekyb3d8bbwe\\' .. 'pwsh.exe', '-NoLogo' },
  });
  table.insert(localLaunchMenu, {
    label = 'fish on WSL',
    args = defaultProgramArgs,
  });
elseif wezterm.target_triple == 'x86_64-apple-darwin' then
  defaultProgramArgs = wezterm.default_prog;
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  defaultProgramArgs = {
    '/usr/bin/fish', '-l'
  };
end

return {
  default_prog = defaultProgramArgs,
  font = wezterm.font("HackGen Console NFJ"),
  font_size = 14.6,
  color_scheme_dirs = localColorSchemeDirs,
  color_scheme = 'Dracula (Official)',
	tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  enable_tab_bar = true,
  window_background_opacity = 1.0,
  text_background_opacity = 1.0,
  launch_menu = localLaunchMenu,
  use_ime = true,
  keys = {
    { key = 'C', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection', },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard', },
    { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection', },
  },
}
