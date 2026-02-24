return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "autumn",
  },
  config = function(_, opts)
    vim.o.background = "light"
    require("solarized").setup(opts)
    vim.cmd.colorscheme("solarized")
  end,
}
