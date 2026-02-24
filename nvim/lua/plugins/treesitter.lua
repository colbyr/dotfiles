return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = {
      ensure_installed = {
        "typescript",
        "tsx",
        "javascript",
        "go",
        "gomod",
        "lua",
        "json",
        "yaml",
        "html",
        "css",
        "markdown",
        "bash",
        "vim",
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
