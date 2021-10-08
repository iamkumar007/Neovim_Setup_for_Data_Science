-------------------- HELPERS -------------------------------
local api, cmd, fn, g = vim.api, vim.cmd, vim.fn, vim.g
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-------------------- PLUGINS -------------------------------
cmd 'source ~/AppData/Local/nvim/plugins.vim' 

-------------------- PLUGIN SETUP --------------------------
-- Load part of setups
cmd 'source ~/AppData/Local/nvim/plugins_setup.vim'

-- vimtex
g['vimtex_quickfix_mode'] = 0
g['vimtex_view_method'] = 'skim'

-------------------- OPTIONS -------------------------------
local indent, width = 2, 80
cmd 'colorscheme molokai'
opt('b', 'expandtab', true)               -- Use spaces instead of tabs
opt('b', 'formatoptions', 'crqnj')        -- Automatic formatting options
opt('b', 'shiftwidth', indent)            -- Size of an indent
opt('b', 'smartindent', true)             -- Insert indents automatically
opt('b', 'tabstop', indent)               -- Number of spaces tabs count for
opt('b', 'textwidth', width)              -- Maximum width of text
opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options
opt('o', 'hidden', true)                  -- Enable background buffers
opt('o', 'ignorecase', true)              -- Ignore case
opt('o', 'joinspaces', false)             -- No double spaces with join
opt('o', 'pastetoggle', '<F2>')           -- Paste mode
opt('o', 'scrolloff', 4 )                 -- Lines of context
opt('o', 'shiftround', true)              -- Round indent
opt('o', 'sidescrolloff', 8 )             -- Columns of context
opt('o', 'smartcase', true)               -- Don't ignore case with capitals
opt('o', 'splitbelow', true)              -- Put new windows below current
opt('o', 'splitright', true)              -- Put new windows right of current
opt('o', 'termguicolors', true)           -- True color support
opt('o', 'updatetime', 200)               -- Delay before swap file is saved
opt('o', 'wildmode', 'list:longest')      -- Command-line completion mode
opt('w', 'colorcolumn', tostring(width))  -- Line length marker
opt('w', 'cursorline', true)              -- Highlight cursor line
opt('w', 'list', true)                    -- Show some invisible characters
opt('w', 'number', true)                  -- Show line numbers
opt('w', 'relativenumber', false)          -- Relative line numbers
opt('w', 'signcolumn', 'yes')             -- Show sign column
opt('w', 'wrap', true)                    -- Enable line wrap
cmd 'set backspace=indent,eol,start'      --  let backspace delete over lines
cmd 'set ruler'                           -- Enable ruler
cmd 'set colorcolumn=80'                  -- Color the ruler
cmd 'set mouse=a'                         -- Allow mouse

-------------------- LSP -----------------------------------
local lsp = require('lspconfig')
local lspfuzzy = require('lspfuzzy')
for ls, cfg in pairs({
  bashls = {},
  ccls = {},
  jsonls = {},
  julials = {on_attach=require'completion'.on_attach},
  r_language_server = {on_attach=require'completion'.on_attach},
  pylsp = {root_dir = lsp.util.root_pattern('.git', fn.getcwd()), on_attach=require'completion'.on_attach},
}) do lsp[ls].setup(cfg) end
lspfuzzy.setup {}
map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<space>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

------------------ TELESCOPE -------------------------------
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}


