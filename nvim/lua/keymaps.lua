local map = vim.keymap.set

-- Disable arrow keys
map({ "n", "v" }, "<Up>", "<Nop>")
map({ "n", "v" }, "<Down>", "<Nop>")
map({ "n", "v" }, "<Left>", "<Nop>")
map({ "n", "v" }, "<Right>", "<Nop>")
map("i", "<Up>", "<Nop>")
map("i", "<Down>", "<Nop>")
map("i", "<Left>", "<Nop>")
map("i", "<Right>", "<Nop>")

-- Yank entire line with Y
map("n", "Y", "yy")

-- Clear search highlight
map("n", "<leader>h", ":nohlsearch<CR>", { silent = true })

-- Copy file path to clipboard (relative to git root)
map("n", "<leader>cd", function()
  local abs = vim.fn.expand("%:p")
  local root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(vim.fn.expand("%:p:h")) .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 and root then
    local rel = abs:sub(#root + 2) -- strip root + trailing slash
    vim.fn.setreg("+", rel)
    vim.notify(rel, vim.log.levels.INFO)
  else
    vim.fn.setreg("+", abs)
    vim.notify(abs, vim.log.levels.INFO)
  end
end, { silent = true, desc = "Copy file path (relative to git root)" })

-- Copy full absolute path to clipboard
map("n", "<leader>cf", function()
  local abs = vim.fn.expand("%:p")
  vim.fn.setreg("+", abs)
  vim.notify(abs, vim.log.levels.INFO)
end, { silent = true, desc = "Copy full absolute file path" })

-- Copy GitHub URL to clipboard
map("n", "<leader>cg", function()
  local abs = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")
  local root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    vim.notify("Not in a git repo", vim.log.levels.ERROR)
    return
  end
  local remote = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " remote get-url origin")[1]
  if vim.v.shell_error ~= 0 then
    vim.notify("No remote origin found", vim.log.levels.ERROR)
    return
  end
  local branch = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --abbrev-ref HEAD")[1]
  local rel = abs:sub(#root + 2)
  -- normalize remote to https github url
  local url = remote
    :gsub("git@github%.com:", "https://github.com/")
    :gsub("%.git$", "")
  local line = vim.fn.line(".")
  local github_url = url .. "/blob/" .. branch .. "/" .. rel .. "#L" .. line
  vim.fn.setreg("+", github_url)
  vim.notify(github_url, vim.log.levels.INFO)
end, { silent = true, desc = "Copy GitHub URL" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
