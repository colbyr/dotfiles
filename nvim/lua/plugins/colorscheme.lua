local function sync_background()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  -- "Dark" means dark mode; command fails (empty result) in light mode
  vim.o.background = result:match("Dark") and "dark" or "light"
end

return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "autumn",
  },
  config = function(_, opts)
    sync_background()
    require("solarized").setup(opts)
    vim.cmd.colorscheme("solarized")

    vim.api.nvim_create_autocmd("FocusGained", {
      callback = sync_background,
    })
  end,
}
