local options = {
  termguicolors = true,
  shell = 'fish',
  showtabline = 2,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = false,
  number = true,
  numberwidth = 4,
  wrap = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

