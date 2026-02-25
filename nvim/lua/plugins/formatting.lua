return {
  -- Prettier formatting on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 3000,
        lsp_format = "never",
      },
      formatters = {
        prettier = {
          -- Use yarn so it resolves via PnP
          command = "yarn",
          args = { "prettier", "--stdin-filepath", "$FILENAME" },
          stdin = true,
          cwd = function(self, ctx)
            return require("conform.util").root_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.js",
              "prettier.config.js",
              "package.json",
            })(self, ctx)
          end,
        },
      },
    },
  },
}
