-- " vim: set fdm=marker fenc=utf-8 sw=2 ts=2:


local which_key_map = {}
local after_load = {}
local map = vim.api.nvim_set_keymap

vim.cmd [[
exe 'source' expand('~/.config/nvim/basics.vim')
exe 'source' expand('~/.config/nvim/google.vim')
]]

map('n', 'Y', 'y$', {noremap = true})

--  yank in visual mode doesn't not jump the cursor.
map('v', 'Y', 'ygv<Esc>', {noremap = true})

vim.o.background = "dark"
vim.cmd[[ colorscheme gruvbox-material ]]

-- Placeholder to be customised by local configs.
function _G.local_plugins(use) end
-- vim.s.local_init=expand("~/.config/nvim/") . join(split(hostname(), '\.')[0:1],".") . ".vim"

vim.o.mouse = "a"

require('plugins')

local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/nvim/after/plugin/?.lua;" .. package.path

-- for key in keys(g:after_load)
-- call vim.g:after_load[key]()
-- endfor

vim.cmd [[
	augroup highlight_yank
			autocmd!
			au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
	augroup END
]]
