--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = {
  timeout = 8000
}
lvim.colorscheme = "onedarker"
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.builtin.which_key.mappings["w"] = {
  name = "+Window",
  o = { "<cmd>only<cr>", "Only" },
  s = { "<cmd>split<cr>", "Split" },
  v = { "<cmd>vsplit<cr>", "VSplit" },
  l = { "<cmd>wincmd l<cr>", "Right" },
  h = { "<cmd>wincmd h<cr>", "Left" },
  j = { "<cmd>wincmd j<cr>", "Below" },
  k = { "<cmd>wincmd k<cr>", "Top" },
  c = { "<cmd>wincmd c", "Close" },
  w = { "<cmd>w!<cr>", "Save" },
}
lvim.builtin.which_key.mappings["<tab>"] = {
  "<cmd>b#<cr>", "Swtich buffer"
}
lvim.keys.normal_mode["<S-h>"] = false
lvim.keys.normal_mode["<S-l>"] = false

-- lvim.keys.normal_mode["<c-l>"] = false
-- lvim.keys.normal_mode["<c-h>"] = false
-- lvim.keys.normal_mode["<c-j>"] = false
-- lvim.keys.normal_mode["<c-k>"] = false

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<esc>"] = actions.close,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble/Term",
  t = { "<cmd>ToggleTerm<cr>", "Term" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- search
lvim.builtin.which_key.mappings["ss"] = {
  "<cmd>lua require('spectre').open()<CR>", "Search&Replace"
}

lvim.builtin.which_key.mappings["P"] = {
  name = "Packer",
  c = { "<cmd>PackerCompile<cr>", "Compile" },
  i = { "<cmd>PackerInstall<cr>", "Install" },
  r = { "<cmd>lua require('lv-utils').reload_lv_config()<cr>", "Reload" },
  s = { "<cmd>PackerSync<cr>", "Sync" },
  u = { "<cmd>PackerUpdate<cr>", "Update" },
}
lvim.builtin.which_key.mappings["p"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["q"] = {
  name = "Session",
  q = { "<cmd>q!<cr>", "Quit" },
}

lvim.builtin.which_key.mappings["c"] = {
  name = "Conflict",
  o = { "<cmd>GitConflictChooseOurs<cr>", "Our changes" },
  t = { "<cmd>GitConflictChooseTheirs<cr>", "Their changes" },
  b = { "<cmd>GitConflictChooseBoth<cr>", "Both changes" },
  n = { "<cmd>GitConflictChooseNone<cr>", "Both none of the changes" },
  j = { "<cmd>GitConflictNextConflict<cr>", "Next conflict" },
  k = { "<cmd>GitConflictPrevConflict<cr>", "Previous conflict" },
  l = { "<cmd>Telescope find_files  find_command=git,diff,--name-only,--diff-filter=U<cr>", "List conflicts" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.manual_mode = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  --   { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "eslint_d",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "typescript", "typescriptreact" } },
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

-- Additional Plugins
-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }
lvim.plugins = {
  {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event = "BufRead"
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 0
    end,
  },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" }
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({

        color_devicons     = true,
        open_cmd           = 'vnew',
        live_update        = false, -- auto excute search again when you write any file in vim
        line_sep_start     = '┌-----------------------------------------',
        result_padding     = '¦  ',
        line_sep           = '└-----------------------------------------',
        highlight          = {
          ui = "String",
          search = "DiffChange",
          replace = "DiffDelete"
        },
        mapping            = {
          ['toggle_line'] = {
            map = "dd",
            cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
            desc = "toggle current item"
          },
          ['enter_file'] = {
            map = "<cr>",
            cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
            desc = "goto current file"
          },
          ['send_to_qf'] = {
            map = "<leader>q",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
          },
          ['replace_cmd'] = {
            map = "<leader>c",
            cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
            desc = "input replace vim command"
          },
          ['show_option_menu'] = {
            map = "<leader>o",
            cmd = "<cmd>lua require('spectre').show_options()<CR>",
            desc = "show option"
          },
          ['run_replace'] = {
            map = "<leader>R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
          },
          ['change_view_mode'] = {
            map = "<leader>v",
            cmd = "<cmd>lua require('spectre').change_view()<CR>",
            desc = "change result view mode"
          },
          ['toggle_live_update'] = {
            map = "tu",
            cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
            desc = "update change when vim write file."
          },
          ['toggle_ignore_case'] = {
            map = "ti",
            cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            desc = "toggle ignore case"
          },
          ['toggle_ignore_hidden'] = {
            map = "th",
            cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
            desc = "toggle search hidden"
          },
          -- you can put your mapping here it only use normal mode
        },
        find_engine        = {
          -- rg is map with finder_cmd
          ['rg'] = {
            cmd = "rg",
            -- default args
            args = {
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
            },
            options = {
              ['ignore-case'] = {
                value = "--ignore-case",
                icon = "[I]",
                desc = "ignore case"
              },
              ['hidden'] = {
                value = "--hidden",
                desc = "hidden file",
                icon = "[H]"
              },
              -- you can put any rg search option you want here it can toggle with
              -- show_option function
            }
          },
          ['ag'] = {
            cmd = "ag",
            args = {
              '--vimgrep',
              '-s'
            },
            options = {
              ['ignore-case'] = {
                value = "-i",
                icon = "[I]",
                desc = "ignore case"
              },
              ['hidden'] = {
                value = "--hidden",
                desc = "hidden file",
                icon = "[H]"
              },
            },
          },
        },
        replace_engine     = {
          ['sed'] = {
            cmd = "sed",
            args = nil
          },
          options = {
            ['ignore-case'] = {
              value = "--ignore-case",
              icon = "[I]",
              desc = "ignore case"
            },
          }
        },
        default            = {
          find = {
            --pick one of item in find_engine
            cmd = "rg",
            options = { "ignore-case" }
          },
          replace = {
            --pick one of item in replace_engine
            cmd = "sed"
          }
        },
        replace_vim_cmd    = "cdo",
        is_open_target_win = true, --open file on opener window
        is_insert_mode     = false -- start open panel on is_insert_mode
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    config = function()
      require('git-conflict').setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    'TimUntersberger/neogit',
    config = function()
      require('neogit').setup({
        integrations = {
          diffview = true
        }
      })
    end
  },
  {
    'nvim-telescope/telescope-live-grep-raw.nvim',
    config = function()
      lvim.builtin.which_key.mappings["st"] = {
        "<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<CR>", "Search Raw"
      }
    end
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

vim.cmd('source' .. ' ~/.config/lvim/config.vim')
