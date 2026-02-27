local opt = vim.opt

-- Line numbers
opt.number = true
opt.cursorline = true
opt.ruler = true
opt.startofline = false

-- Indentation (2-space tabs)
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Display
opt.termguicolors = true
opt.laststatus = 2
opt.showmode = false -- lualine handles this
opt.title = true
opt.showcmd = true
opt.errorbells = false
opt.shortmess:append("atI")
opt.scrolloff = 3
opt.signcolumn = "yes"

-- Invisible characters
opt.list = true
opt.listchars = { tab = "▸ ", trail = "·", eol = "¬", nbsp = "_" }

-- In Go files, hide tab rendering but keep other listchars (trailing spaces, etc.)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.listchars = { tab = "  ", trail = "·", eol = "¬", nbsp = "_" }
  end,
})

-- Mouse
opt.mouse = "a"

-- Encoding
opt.encoding = "utf-8"

-- Backspace
opt.backspace = { "indent", "eol", "start" }

-- Misc
opt.swapfile = false
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 250
opt.exrc = true

-- Auto-reload files changed outside of Neovim (e.g. by Claude Code)
opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})
