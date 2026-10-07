return {
  {
    -- the newer `main` branch requires Neovim 0.12+
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash", "css", "html", "javascript", "json", "lua", "markdown", "markdown_inline",
        "nix", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
