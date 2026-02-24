return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    { "<leader>ft", "<cmd>TodoFzfLua<cr>", desc = "Search TODOs" },
  },
  opts = {},
}
