vim.g.mapleader = " "

local options = {
  termguicolors = true, -- Enable 24 bits color in terminal
  guicursor = "a:block,i-ci-ve:ver25", -- Set the gui cursor to nothing for each mode
  inccommand = "nosplit", -- Show effect of command incrementally while writing it (substitution)
  showmode = false, -- Don't need to show mode
  mouse = "a", -- Enable mouse in all mode
  tabstop = 2, -- A tab is 2 spaces (display)
  shiftwidth = 2, -- Indent to 2 spaces
  softtabstop = 2, -- A tab is 2 spaces (insert mode)
  expandtab = true, -- Use spaces instead of tab character
  smartindent = true, -- Smart auto indent on new line
  cursorline = true, -- Highlight the current line the cursor is on
  hidden = true, -- Make sure hidden buffer are not unloaded
  backup = false, -- Disable file backups
  writebackup = false, -- Disable file backup on save
  swapfile = false, -- Disable swap files
  laststatus = 3, -- Single status line for the whole frame
  signcolumn = "yes", -- Show the sign colum (for gitsigns)
  number = true, -- Show line numbers
  relativenumber = true, -- Use relative line numbers
  scrolloff = 12, -- Keep at least 12 lines above the cursor.
  wrap = false, -- Disable line wrap
  colorcolumn = "80", -- Color the 120 character as a limit for line length
  completeopt = "menuone,noinsert,noselect",
}

vim.opt.clipboard:append("unnamedplus") -- Copy to system clipboard

for opt, val in pairs(options) do
  vim.o[opt] = val
end
