-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and declare your plugins here
require("lazy").setup({
  -- plugins go here, for example:
  -- { "folke/tokyonight.nvim" },
  --
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
        require('onedark').setup {
          style = 'deep',
          colors = {
            bg0  = "#0e1020",
            bg1  = "#131628",
            bg2  = "#181c30",
            bg3  = "#1d2138",
            bg_d = "#0a0d18",
          },
        }
        require('onedark').load()

        end
    },
    {"sekke276/dark_flat.nvim"},
    {
         "nvim-treesitter/nvim-treesitter",
         lazy = false,
         build = ":TSUpdate",
         opts = {},
         config = function()
             vim.api.nvim_create_autocmd("FileType", {
                 pattern = "odin",
                 callback = function()
                     vim.treesitter.start()
                 end,
             })
         end,
    },
    {
        "cephei8/odin.nvim",
        lazy = false,
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
        servers = {
            ols = {},
        },
        },
        config = function(_, opts)
        for server, config in pairs(opts.servers) do
            config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = {},
        version = "1.*",
        opts = {
            keymap = {
                preset = "default",
                ['<C-j>'] = { 'select_next' },
                ['<C-k>'] = { 'select_prev' },
                ['<C-l>'] = { 'select_and_accept' },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            completion = { documentation = { auto_show = true } },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    {
        "shortcuts/no-neck-pain.nvim",
        version = "*",
        lazy = false,
        opts = {
            width = 120,
            integrations = {
                NvimTree = {
                    position = "left",
                    reopen = true, -- reopen nvim-tree after toggling no-neck-pain
                },
            },
            autocmds = {
                enableOnVimEnter = true,
            },
        },
        enabled = true
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'auto', -- picks up your colorscheme automatically
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        },
    },
    { "farmergreg/vim-lastplace", enabled = true },
})
-- Set the Leader key to comma
vim.g.mapleader = ","

--LSP Keymap
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
vim.keymap.set({ "n", "v" }, "grf", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "LSP format" })
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show error message" })

--NoNeckPain Keymap
vim.keymap.set("n", "<Leader>nnp", ":NoNeckPain<CR>", { desc = "Toggle NoNeckPain Centered Layout" })

--Odin Keymap
vim.keymap.set("n", "<leader>ob", "<cmd>Odin build<cr>", { desc = "Odin build" })
vim.keymap.set("n", "<leader>ot", "<cmd>Odin test<cr>", { desc = "Odin test" })

--Nvim-Tree (File Explorer)
---@type nvim_tree.config
local config = {
sort = {
  sorter = "case_sensitive",
},
view = {
  width = 60,
},
renderer = {
  group_empty = true,
},
filters = {
  dotfiles = true,
},
}
require("nvim-tree").setup(config)
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- Non plugin setup--
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.wo.relativenumber = true
