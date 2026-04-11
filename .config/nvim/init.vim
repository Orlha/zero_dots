let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#non_zero_only = 1

syntax enable
filetype plugin indent on
set list
set listchars=tab:▸·,trail:~
set scrolloff=7
set foldmethod=indent
set foldnestmax=1
set number
set nocindent
set nosmartindent
set relativenumber
set incsearch
set ignorecase
set smartcase
set hlsearch
set noshowmode
set ttimeout
set ttimeoutlen=20
set timeoutlen=3000

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'EdenEast/nightfox.nvim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'justinmk/vim-sneak'
Plug 'windwp/nvim-autopairs'
Plug 'chrisgrieser/nvim-spider'
Plug 'Mofiqul/vscode.nvim'
Plug 'ibhagwan/smartyank.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'saghen/blink.cmp'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'
"Plug 'rachartier/tiny-cmdline.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
call plug#end()

set termguicolors
set background=dark
let g:airline_theme = 'bubblegum'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

lua << EOF
    vim.cmd([[
        autocmd FileType cpp set cinoptions+=l1,N-s,g0,h4,t0,+0,j1,(0,ws,Ws,)0,(m1)
    ]])
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true
    require("nvim-tree").setup()
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
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
    -- fzf lua
    vim.keymap.set('n', '<leader>fd', ':FzfLua lsp_live_workspace_symbols<CR>', { silent = true }) -- Symbols (workspace)
    vim.keymap.set('n', '<leader>fs', ':FzfLua lsp_document_symbols<CR>', { silent = true }) -- Symbols (current buffer)
    vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>', { silent = true })      -- Files
    vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>', { silent = true })  -- Grep
    vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>', { silent = true })    -- Buffers
    vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>', { silent = true })   -- Recent
    -- spider word motion
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
    --vim.cmd.colorscheme "vscode"

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
            enabled = true,
            higroup = "IncSearch",
            timeout = 1000,
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
            ssh_only = true,
            silent = true,
            echo_hl = "Directory",
        },
    }

    --vim.opt.clipboard = "unnamedplus"
    vim.opt.foldlevelstart = 99
EOF

let g:sneak#label = 1
autocmd VimLeave * set guicursor=a:hor20

nnoremap <silent><F1>      :NvimTreeToggle<CR>
inoremap <silent><F1> <ESC>:NvimTreeToggle<CR>
nnoremap <silent><F2>      :set paste!<CR>
inoremap <silent><F2> <ESC>:set paste!<CR>
nnoremap <silent><F4>      :set list!<CR>:set number!<CR>:set relativenumber!<CR>
inoremap <silent><F4> <Esc>:set list!<CR>:set number!<CR>:set relativenumber!<CR>

hi Normal           guibg=NONE ctermbg=NONE
hi LineNr           guibg=NONE ctermbg=NONE
hi SignColumn       guibg=NONE ctermbg=NONE
hi NormalNC         guibg=NONE ctermbg=NONE
hi NvimTreeNormal   guibg=NONE ctermbg=NONE
hi NvimTreeNormalNC guibg=NONE ctermbg=NONE

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
vim.lsp.config.clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp" },
    capabilities = require('blink.cmp').get_lsp_capabilities(),
}

vim.lsp.enable('clangd')
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
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
        vim.notify("> Disabled", "info", { title = "LSP Toggle" })
    else
        vim.lsp.enable('clangd')
        lsp_enabled = true
        vim.notify("> Enabled", "info", { title = "LSP Toggle" })
    end
end, { desc = "Toggle LSP on/off" })
EOF


lua << EOF
vim.opt.signcolumn = "yes:1"
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
EOF

lua << EOF
local virtual_text_config = {
    format = function(diagnostic)
        return diagnostic.message:gsub("%(fix available%)", "")
    end,
    prefix = "●",
}
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
    },
    underline = false,
    update_in_insert = false,
})

local vtext_enabled = false
vim.keymap.set('n', '<leader>v', function()
    vtext_enabled = not vtext_enabled
    if vtext_enabled then
        vim.diagnostic.config({ virtual_text = virtual_text_config })
        vim.notify("> Enabled", "info", { title = "Virtual Text Toggle" })
    else
        vim.diagnostic.config({ virtual_text = false })
        vim.notify("> Disabled", "info", { title = "Virtual Text Toggle" })
    end
end, { desc = "Toggle virtual text" })
EOF

lua << EOF
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff5555", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffb86c", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#8be9fd" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#50fa7b" })
require('gitsigns').setup({
    attach_to_untracked = true,
})
EOF

lua << EOF
require("trouble").setup({
    modes = {
        diagnostics_flat = {
            mode = "diagnostics",
            filter = { buf = 0 },
            groups = {},
            auto_close = true,
            sort = { "severity", "pos" },
        },
    },
    warn_no_results = false,
})

vim.keymap.set("n", "<leader>l", "<cmd>Trouble diagnostics_flat toggle<cr>", { desc = "Flat Buffer Diagnostics", })

vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TroubleNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TroubleBorder", { bg = "NONE" })
EOF

lua << EOF
-- Suppress deprecation warnings for diagnostic.goto_prev/goto_next
vim.deprecate = function() end
EOF

lua require("noice").setup()
