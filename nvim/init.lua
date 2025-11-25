vim.opt.mouse = 'a'
vim.opt.keymodel = 'startsel,stopsel'
vim.opt.selectmode = 'mouse,key'
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.whichwrap:append("<,>,[,]")
vim.keymap.set('v', '<C-c>', '"+y<Esc>', { desc = 'Copy' })
vim.keymap.set('n', '<C-x>', '"+dd', { desc = 'Cut line' })
vim.keymap.set('i', '<C-x>', '<Esc>"+ddi', { desc = 'Cut line' })
vim.keymap.set('v', '<C-x>', '"+d', { desc = 'Cut selection' })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste from clipboard' })
vim.keymap.set('c', '<C-v>', '<C-r>+', { desc = 'Paste in command mode' })
vim.keymap.set('n', '<C-a>', 'gggH<C-o>G', { desc = 'Select all' })
vim.keymap.set('i', '<C-a>', '<Esc>gggH<C-o>G', { desc = 'Select all' })
vim.keymap.set('n', '<C-z>', 'u', { desc = 'Undo' })
vim.keymap.set('n', '<C-y>', '<C-r>', { desc = 'Redo' })
vim.keymap.set('i', '<C-z>', '<C-o>u', { desc = 'Undo' })
vim.keymap.set('i', '<C-y>', '<C-o><C-r>', { desc = 'Redo' })
vim.opt.background = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = nil })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })

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

-- Setup Supermaven
require("lazy").setup({
  -- Color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- Options: "storm", "moon", "night", "day"
        transparent = true, -- Keep your transparent background
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      -- Find files
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      -- Search in files (grep)
      vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Search in files" })
      -- Recent files
      vim.keymap.set("n", "<C-r>", builtin.oldfiles, { desc = "Recent files" })
      -- Search current buffer
      vim.keymap.set("n", "<C-/>", builtin.current_buffer_fuzzy_find, { desc = "Search in current file" })
    end,
  },

  -- Supermaven AI completion
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        color = {
          suggestion_color = "#808080",
          cterm = 244,
        },
      })
    end,
    init = function()
      vim.g.supermaven_disable_activation_messages = true
    end,
  },

  -- LuaSnip for snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      -- Load VSCode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Tab to jump forward, Shift-Tab to jump backward in snippets
      vim.keymap.set({"i", "s"}, "<C-k>", function()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { silent = true })
      
      vim.keymap.set({"i", "s"}, "<C-j>", function()
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { silent = true })
    end,
  },

  -- nvim-cmp for completion menu with snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'supermaven' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  },
})
