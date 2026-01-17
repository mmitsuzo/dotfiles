-- vim: set ts=2 sw=2 sts=2 et:
require("config.lazy")
require("config.lsp")

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.modeline = true
--vim.opt.shell = 'bash'
--vim.opt.shell = vim.fn.exepath('bash')
vim.opt.laststatus = 2

--vim.opt.number = true
--vim.opt.relativenumber = true

--vim.opt.ignorecase = true
--vim.opt.smartcase = true
--vim.opt.splitbelow = true
--vim.opt.splitright = true
--vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.undofile = true
--vim.opt.clipboard = "unnamedplus"

--vim.opt.tabstop = 4
--vim.opt.shiftwidth = 4
--vim.opt.expandtab = true

vim.opt.winborder = "rounded"

vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<cr>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- generate indent setting command
local function simple_mode_command(width, is_expand)
  local indent_width = (width ~= 0) and width or 8
  local expand_str = is_expand and "et" or "noet"
  return string.format("ts=%d sw=%d sts=%d %s", indent_width, indent_width, indent_width, expand_str)
end

-- generate modeline string
local function simple_modeline_string(width, is_expand)
  local mode_cmd = simple_mode_command(width, is_expand)
  local modeline = "vim: set " .. mode_cmd .. ":"
  local comment_fmt = vim.bo.commentstring
  if comment_fmt == "" or not string.find(comment_fmt, "%%s") then
    return modeline
  end
  return string.format(comment_fmt, modeline)
end

-- insert modeline
local function insert_modeline(width, is_expand)
  local modeline = simple_modeline_string(width, is_expand)
  vim.fn.append(vim.fn.line('.') - 1, modeline)
end

-- apply indent setting to current buffer
local function apply_indent_settings(width, is_expand)
  local cmd = simple_mode_command(width, is_expand)
  vim.cmd.set(cmd)
end

-- define indent user command
vim.api.nvim_create_user_command('T0', function() apply_indent_settings(8, false) end, {})
vim.api.nvim_create_user_command('T2', function() apply_indent_settings(2, true) end, {})
vim.api.nvim_create_user_command('T4', function() apply_indent_settings(4, true) end, {})
vim.api.nvim_create_user_command('T8', function() apply_indent_settings(8, true) end, {})
vim.api.nvim_create_user_command('TT2', function() apply_indent_settings(2, false) end, {})
vim.api.nvim_create_user_command('TT4', function() apply_indent_settings(4, false) end, {})
vim.api.nvim_create_user_command('TT8', function() apply_indent_settings(8, false) end, {})
vim.api.nvim_create_user_command('T0i', function() insert_modeline(8, false) end, {})
vim.api.nvim_create_user_command('T2i', function() insert_modeline(2, true) end, {})
vim.api.nvim_create_user_command('T4i', function() insert_modeline(4, true) end, {})
vim.api.nvim_create_user_command('T8i', function() insert_modeline(8, true) end, {})
vim.api.nvim_create_user_command('TT2i', function() insert_modeline(2, false) end, {})
vim.api.nvim_create_user_command('TT4i', function() insert_modeline(4, false) end, {})
vim.api.nvim_create_user_command('TT8i', function() insert_modeline(8, false) end, {})


