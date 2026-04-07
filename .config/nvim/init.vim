" powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#non_zero_only = 1

" basic settings
syntax enable
filetype on
filetype plugin indent on
set list
set listchars=tab:▸·,trail:~
set scrolloff=7
set foldmethod=indent
set foldnestmax=1
set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set hlsearch
set noshowmode

" tabs angles
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" plugins
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-tree.lua'
"Plug 'shaunsingh/seoul256.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'rrrrrm/seoul256.nvim'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'sainnhe/everforest'
"Plug 'ellisonleao/gruvbox.nvim'
Plug 'EdenEast/nightfox.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'justinmk/vim-sneak'
"Plug 'cohama/lexima.vim'
Plug 'windwp/nvim-autopairs'
Plug 'chrisgrieser/nvim-spider'
Plug 'Mofiqul/vscode.nvim'
Plug 'ibhagwan/smartyank.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'saghen/blink.cmp'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" themes
set termguicolors
set background=dark
"colorscheme nightfox
"colorscheme nordfox
"colorscheme catppuccin-frappe
"colorscheme catppuccin-macchiato
"colorscheme catppuccin-mocha
"let g:airline_theme = 'badwulf'
"let g:airline_theme = 'ayu_dark'
"let g:airline_theme = 'hybridline'
"let g:airline_theme = 'google_dark'
"let g:airline_theme = 'durant'
let g:airline_theme = 'bubblegum'


" better cpp highlighting settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

lua << EOF
    -- c++ indentation
    vim.cmd([[
        autocmd FileType cpp set cinoptions+=l1,N-s,h0
        autocmd FileType cpp set cinoptions+=g0,h4,t0
        autocmd FileType cpp set cinoptions+=+0
        autocmd FileType cpp set cinoptions+=j1,(0,ws,Ws)
        autocmd FileType cpp set cinoptions+=(m1)
    ]])
    -- tabs configuration
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    -- nvim tree settings
    --vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
    require("nvim-tree").setup()
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
    -- telescope settings
    --require('telescope').setup({
    --    defaults = {
    --        file_ignore_patterns = { "node_modules", ".git" },
    --    },
    --})
    -- others
    vim.g.mapleader = ' '
    vim.opt.termguicolors = true
    vim.opt.splitright = true
    vim.opt.splitbelow = true
    local map = vim.keymap.set
    map('n', '<leader>w', ':w<CR>', { silent = true, desc = 'Save file' })
    map('n', '<leader>q', ':bd<CR>', { silent = true, desc = 'Close buffer' })
    map('n', '<leader>Q', ':bd<CR>', { silent = true, desc = 'Force close buffer' })
    map('n', '<leader>n', ':bn<CR>', { silent = true, desc = 'Next buffer' })
    map('n', '<leader>p', ':bp<CR>', { silent = true, desc = 'Previous buffer' })
    map('n', '<leader>s', ':noh<CR>', { silent = true, desc = 'Clear search highlight' })
    -- fzf lua mappings
    vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { silent = true })      -- Files
    vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { silent = true })  -- Grep
    vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { silent = true })    -- Buffers
    vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', { silent = true })   -- Recent
    -- Replace default w, e, b with spider versions
    vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
    vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
    vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
    vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
    vim.opt.shortmess:append("I")
    require("nvim-autopairs").setup {}

    vim.g.airline_mode_map = {
        ['n']  = 'NORMAL ',
        ['i']  = 'INSERT ',
        ['c']  = 'COMMAND ',
        ['v']  = 'VISUAL ',
        ['V']  = 'V·LINE ',
        [''] = 'V·BLOCK ',
        ['s']  = 'SELECT ',
    }
    local c = require('vscode.colors').get_colors()
    require('vscode').setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    --italic_comments = true,

    -- Enable italic inlay type hints
    --italic_inlayhints = true,

    -- Underline `@markup.link.*` variants
    underline_links = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,

    -- Apply theme colors to terminal
    terminal_colors = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        --vscLineNumber = '#FFFFFF',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
    })

    require("catppuccin").setup({
        no_italic = true,
    })
    vim.cmd.colorscheme "catppuccin-mocha"

    local highlights = {
        FzfLuaNormal       = { bg = "NONE" },
        FzfLuaBorder       = { bg = "NONE" },
        FzfLuaPreviewNormal = { bg = "NONE" },
        FzfLuaPreviewBorder = { bg = "NONE" },
        -- Optional: clear the backdrop if you use it
        FzfLuaBackdrop      = { bg = "NONE" },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    require('smartyank').setup {
        highlight = {
            enabled = true,         -- highlight yanked text
            higroup = "IncSearch",  -- highlight group of yanked text
            timeout = 1000,         -- timeout for clearing the highlight
        },
        clipboard = {
            enabled = true
        },
        tmux = {
            enabled = true,
            -- remove `-w` to disable copy to host client's clipboard
            cmd = { 'tmux', 'set-buffer', '-w' }
        },
        osc52 = {
            enabled = true,
            -- escseq = 'tmux',     -- use tmux escape sequence, only enable if
            -- you're using tmux and have issues (see #4)
            ssh_only = true,        -- false to OSC52 yank also in local sessions
            silent = true,         -- true to disable the "n chars copied" echo
            echo_hl = "Directory",  -- highlight group of the OSC52 echo message
        },
        -- By default copy is only triggered by "intentional yanks" where the
        -- user initiated a `y` motion (e.g. `yy`, `yiw`, etc). Set to `false`
        -- if you wish to copy indiscriminately:
        -- validate_yank = false,
        -- 
        -- For advanced customization set to a lua function returning a boolean
        -- for example, the default condition is:
        -- validate_yank = function() return vim.v.operator == "y" end,
    }


    vim.opt.clipboard = "unnamedplus"
    vim.opt.foldlevelstart = 99
    --vim.cmd.colorscheme "vscode"
EOF

autocmd VimLeave * set guicursor=a:hor20
let g:sneak#label = 1
nnoremap <silent><F1> :NvimTreeToggle<CR>
inoremap <silent><F1> <ESC>:NvimTreeToggle<CR>
nnoremap <silent><F2> :set paste!<CR>
inoremap <silent><F2> <ESC>:set paste!<CR>
nmap <silent><F4> :set list!<CR>:set number!<CR>:set relativenumber!<CR>
imap <silent><F4> <Esc>:set list!<CR>:set number!<CR>:set relativenumber!<CR>

" mappings
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>


" transparency
" Set the main editor background to transparent
highlight Normal guibg=NONE ctermbg=NONE
" Set the line number column background to transparent
highlight LineNr guibg=NONE ctermbg=NONE
" Set the background for the column to the right of the line numbers
highlight SignColumn guibg=NONE ctermbg=NONE

" nvim-tree transparency
hi NormalNC guibg=NONE ctermbg=NONE
hi NvimTreeNormal guibg=NONE ctermbg=NONE
hi NvimTreeNormalNC guibg=NONE ctermbg=NONE


" configure blink.cmp
lua << EOF
require('blink.cmp').setup({
  fuzzy = { implementation = "lua" },

  completion = {
    menu = {
      auto_show = false,
    },
    documentation = { auto_show = false },
  },

  keymap = {
    preset = 'default',
    ['<Tab>'] = { 'select_next', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },
    ['<Space>'] = { 'select_and_accept', 'fallback' },
    ['<C-Space>'] = { 'show', 'fallback' },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})
EOF

lua << EOF
-- Minimal clangd setup for type highlighting
vim.lsp.config.clangd = {
  cmd = { "clangd" },
}
vim.lsp.enable('clangd')
EOF

" Configure LSP for C++
lua << EOF
vim.lsp.config.clangd = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "cc", "cxx", "h", "hpp", "hh", "hxx" },
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}

-- Enable LSP for C++ files
vim.lsp.enable('clangd')

-- Show warning under cursor
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Jump between warnings
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)

-- List all warnings
EOF


lua << EOF
-- Add LSP toggle here (inside the same Lua block)
local lsp_enabled = true
vim.keymap.set('n', '<leader>t', function()
  if lsp_enabled then
    for _, client in pairs(vim.lsp.get_clients()) do
      client.stop()
    end
    lsp_enabled = false
    vim.notify("LSP disabled", "info", { title = "LSP Toggle" })
  else
    vim.lsp.enable('clangd')
    lsp_enabled = true
    vim.notify("LSP enabled", "info", { title = "LSP Toggle" })
  end
end, { desc = "Toggle LSP on/off" })
EOF


lua << EOF
vim.opt.signcolumn = "yes:1"
EOF


lua << EOF
-- Track state separately
local warning_list_open = false

vim.keymap.set('n', '<leader>l', function()
  if warning_list_open then
    vim.cmd('lclose')
    warning_list_open = false
  else
    vim.diagnostic.setloclist()
    vim.cmd('lopen')
    warning_list_open = true
  end
end, { desc = "Toggle warning list" })

-- Reset state if user closes manually
vim.api.nvim_create_autocmd("WinClosed", {
  pattern = "*",
  callback = function()
    warning_list_open = false
  end,
})
EOF


lua << EOF
-- Set both icon AND custom colors for better visibility
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",  -- Bold X
      [vim.diagnostic.severity.WARN]  = "",  -- Warning triangle
      [vim.diagnostic.severity.INFO]  = "",  -- Info circle
      [vim.diagnostic.severity.HINT]  = "",  -- Lightbulb
    },
  },
})

-- Optional: Override colors for better contrast
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff5555", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffb86c", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#8be9fd" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#50fa7b" })
require('gitsigns').setup({
  attach_to_untracked = true,  -- This will show signs for new files
  -- ... rest of your config
})
EOF
