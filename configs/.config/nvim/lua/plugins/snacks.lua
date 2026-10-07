local header = [[
     __                _
  /\ \ \___  _____   _(_)_ __ ___
 /  \/ / _ \/ _ \ \ / / | '_ ` _ \
/ /\  /  __/ (_) \ V /| | | | | | |
\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]]

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        preset = {
          header = header,
          keys = {
            { icon = "\u{f002} ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "\u{f1da} ", key = "r", desc = "Recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = "\u{f0b0} ", key = "g", desc = "Grep", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "\u{f489} ", key = "z", desc = "~/.zshrc", action = ":e ~/.zshrc" },
            { icon = "\u{f013} ", key = "v", desc = "Neovim config", action = ":e $MYVIMRC" },
            { icon = "\u{f04b2} ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = "\u{f426} ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "recent_files", title = "Recent files in " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~"), cwd = true, limit = 8, padding = 1 },
          { section = "startup" },
        },
      },
      explorer = { enabled = true },
      picker = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
    },
    keys = {
      { "<leader>nf", function() Snacks.explorer() end, desc = "File explorer" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
    },
  },
}
