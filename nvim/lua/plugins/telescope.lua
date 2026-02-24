return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", function() require("fzf-lua").git_files() end, desc = "Find files" },
    { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
    { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
    { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "Buffers" },
    { "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Help tags" },
    { "<leader>fs", function() require("fzf-lua").lsp_document_symbols() end, desc = "Document symbols" },
    { "<leader>fw", function() require("fzf-lua").lsp_workspace_symbols() end, desc = "Workspace symbols" },
    { "<leader>fd", function() require("fzf-lua").diagnostics_document() end, desc = "Document diagnostics" },
  },
  opts = {
    fzf_opts = {
      ["--scheme"] = "path",
      ["--tiebreak"] = "index",
    },
    defaults = {
      file_icons = "mini",
    },
    grep = {
      rg_glob = true,
      glob_flag = "--iglob",
      glob_separator = "%s%-%-",
    },
  },
}
