" powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#hunks#non_zero_only = 1

" basic settings
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


" tabs angles
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" plugins
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
Plug 'rachartier/tiny-cmdline.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
        autocmd FileType cpp set cinoptions+=l1,N-s,g0,h4,t0,+0,j1,(0,ws,Ws,)0,(m1)
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
    vim.keymap.set('n', '<leader>fd', ':FzfLua lsp_workspace_symbols<CR>', { silent = true }) -- Symbols (workspace)
    vim.keymap.set('n', '<leader>fs', ':FzfLua lsp_document_symbols<CR>', { silent = true }) -- Symbols (current buffer)
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
--[[
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
]]

vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
EOF

lua << EOF
--[[
require('lualine').setup({
  options = {
    --theme = 'catppuccin-mocha',
    theme = 'onedark',
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:upper() .. ' '
        end
      }
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  extensions = { 'quickfix' },
})
]]
EOF

lua << EOF
local virtual_text_config = {
    format = function(diagnostic)
      return diagnostic.message:gsub("%(fix available%)", "")
      -- Or try other icons: " 󰛩", " 󰃣", " 󰐃", " "
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
  --virtual_text = virtual_text_config,
  underline = false,
  update_in_insert = false,
})

-- Toggle virtual text on/off while preserving config
local vtext_enabled = false
vim.keymap.set('n', '<leader>v', function()
  vtext_enabled = not vtext_enabled
  if vtext_enabled then
    vim.diagnostic.config({ virtual_text = virtual_text_config })
    vim.notify("Virtual text enabled", "info", { title = "Diagnostics" })
  else
    vim.diagnostic.config({ virtual_text = false })
    vim.notify("Virtual text disabled", "info", { title = "Diagnostics" })
  end
end, { desc = "Toggle virtual text" })
EOF

lua << EOF
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff5555", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#ffb86c", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#8be9fd" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#50fa7b" })
require('gitsigns').setup({
  attach_to_untracked = true,  -- This will show signs for new files
  -- ... rest of your config
})
EOF


lua << EOF
--[[
-- Store original handler
local original_handler = vim.lsp.handlers['textDocument/publishDiagnostics']

-- Override handler to replace "(fix available)" with an icon
vim.lsp.handlers['textDocument/publishDiagnostics'] = function(err, result, ctx, config)
  if result and result.diagnostics then
    for _, diagnostic in ipairs(result.diagnostics) do
      -- Replace "(fix available)" with a small icon
      --diagnostic.message = diagnostic.message:gsub("%(fix available%)", "󰛩")
      --diagnostic.message = diagnostic.message:gsub("%(fix available%)", "💡")
      diagnostic.message = diagnostic.message:gsub("%(fix available%)", "")
      -- Or try other icons: " 󰛩", " 󰃣", " 󰐃", " "
    end
  end
  original_handler(err, result, ctx, config)
end
]]
EOF

lua << EOF
require("trouble").setup({
  modes = {
    diagnostics_flat = {
      mode = "diagnostics", -- inherit from the base diagnostics mode
      filter = { buf = 0 }, -- only show current buffer
      groups = {},          -- empty groups list = flat view (no tree)
      -- Optional: behavior settings
      auto_close = true,    -- auto-close when no diagnostics are left
      sort = { "severity", "pos" }, -- sort by error level then position
    },
  },
  warn_no_results = false,
})

vim.keymap.set("n", "<leader>l", "<cmd>Trouble diagnostics_flat toggle<cr>", {
  desc = "Flat Buffer Diagnostics",
})

--vim.opt.winblend = 10
-- Force transparency on the main Trouble window and its border
vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TroubleNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TroubleBorder", { bg = "NONE" })
EOF

lua << EOF
EOF


lua << EOF
-- Suppress deprecation warnings for diagnostic.goto_prev/goto_next
vim.deprecate = function() end
EOF


lua << EOF
--require('nvim-treesitter').install { 'cpp', 'c' }
--vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.o.cmdheight = 0
require("vim._core.ui2").enable({})
require('tiny-cmdline').setup({
  -- Your configuration options here
})
EOF
