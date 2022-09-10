local status_ok, plugin = pcall(require, "nvim-tree")

if status_ok then
  plugin.setup()
end

status_ok, plugin = pcall(require, "lualine")

if status_ok then
  plugin.setup {
    icons_enabled = true,
    colored = true,
    options = { theme = 'dracula-nvim' },
  }
end

vim.cmd[[colorscheme dracula]]

