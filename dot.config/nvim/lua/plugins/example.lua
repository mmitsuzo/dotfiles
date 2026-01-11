-- vim: set ts=2 sw=2 sts=2 et:
return {
  -- the colorscheme should be available when starting Neovim
--  {
--    "folke/tokyonight.nvim",
--    lazy = false, -- make sure we load this during startup if it is your main colorscheme
--    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()
--      -- load the colorscheme here
--      vim.cmd([[colorscheme tokyonight]])
--    end,
--  },
--  {
--    "rebelot/kanagawa.nvim",
--    lazy = false,
--    config = function()
--      vim.cmd([[colorscheme kanagawa-wave]])
----      vim.api.nvim_set_hl(0, "StatusLine",       { fg = "#16161d", bg = "#c8c093" })
----      vim.api.nvim_set_hl(0, "StatusLineNC",     { fg = "#16161d", bg = "#54546d" })
----      vim.api.nvim_set_hl(0, "StatusLineTerm",   { fg = "#16161d", bg = "#7fb4ca" })
----      vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = "#16161d", bg = "#54546d" })
----      vim.api.nvim_set_hl(0, "Visual",           { fg = "Gray10",  bg = "Gray90"  })
--    end,
--  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true,
        }
      })
      vim.opt.termguicolors = true
--      vim.cmd([[
--        colorscheme carbonfox
--        hi WinSeparator guifg=#535353
--        hi Visual ctermfg=159 ctermbg=23 guifg=#b3c3cc guibg=#384851
--        hi DiffAdd guifg=#25be6a
--        hi DiffDelete guifg=#ee5396
--
--        hi TabLine ctermbg=none guibg=none
--        hi TabLineFill ctermbg=none guibg=none
--        ]])

--        hi StatusLine   guibg=#707880
--        hi StatusLineNC guibg=#873b41
      vim.cmd([[
        colorscheme nightfox
        hi WinSeparator guifg=#707880
        hi StatusLine   guibg=#373b41
        hi StatusLineNC guibg=#373b41
        ]])
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup(
        {
          options = {
            section_separators = { left = '', right = '' },
            theme = 'auto',
            lualine_c = {
              {
                'filename',
                path = 3,
              }
            }
          }
        }
      )
--      vim.cmd([[
--        hi clear StatusLine
--        hi clear StatusLineNC
--      ]])
    end,
  },
--  {
--    "akinsho/bufferline.nvim",
--    dependencies = 'kyazdani42/nvim-web-devicons',
--    config = function()
--      local bufferline = require('bufferline')
--      bufferline.setup({
--        options = {
--          mode = 'tabs',
--          diagnostics = 'nvim_lsp',
--          ---@diagnostic disable-next-line: unused-local
--          diagnostics_indicator = function(count, level, errors, ctx)
--            local icon = level:match("error") and " " or " "
--            return ' ' .. icon .. count
--          end,
--          buffer_close_icon = 'x'
--        }
--      })
--    end
--  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require('nvim-tree').setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
--          icons = {
--            show = false,
--            {
--              file = false,
--              folder = false,
--            },
--          },
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        color_icons = true;
        default = true;
        strict = true;
        variant = "dark|light";
        blend = 0;
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
  }
}
