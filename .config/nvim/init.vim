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
set ttimeoutlen=10
set timeoutlen=3000

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'EdenEast/nightfox.nvim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'chrisgrieser/nvim-spider'
"Plug 'Mofiqul/vscode.nvim'
Plug 'ibhagwan/smartyank.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'saghen/blink.cmp'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/trouble.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/flash.nvim'
Plug 'itchyny/vim-gitbranch'
"Plug 'stevearc/dressing.nvim'
"Plug 'junegunn/seoul256.vim'
call plug#end()

set termguicolors
set background=dark

if 0
lua << EOF
vim.cmd.colorscheme('seoul256')
vim.cmd('highlight clear StatusLine')
EOF
endif


if 0
lua << EOF
vim.cmd([[
" Sign column icons
highlight GitSignsAdd guifg=#99c794 guibg=NONE
highlight GitSignsChange guifg=#fac863 guibg=NONE
highlight GitSignsDelete guifg=#ec5f67 guibg=NONE
highlight GitSignsChangedelete guifg=#fac863 guibg=NONE
highlight GitSignsTopdelete guifg=#ec5f67 guibg=NONE
highlight GitSignsUntracked guifg=#5fafd7 guibg=NONE

" Line number column (when `numhl` is enabled)
highlight GitSignsAddNr guifg=#99c794 guibg=NONE
highlight GitSignsChangeNr guifg=#fac863 guibg=NONE
highlight GitSignsDeleteNr guifg=#ec5f67 guibg=NONE
highlight GitSignsChangedeleteNr guifg=#fac863 guibg=NONE
highlight GitSignsTopdeleteNr guifg=#ec5f67 guibg=NONE
highlight GitSignsUntrackedNr guifg=#5fafd7 guibg=NONE

" Line highlights (the code lines themselves)
highlight GitSignsAddLn guibg=NONE
highlight GitSignsChangeLn guibg=NONE
highlight GitSignsDeleteLn guibg=NONE
highlight GitSignsChangedeleteLn guibg=NONE
highlight GitSignsTopdeleteLn guibg=NONE
highlight GitSignsUntrackedLn guibg=NONE

" Preview window (when using `:Gitsigns preview_hunk`)
highlight GitSignsAddPreview guibg=NONE
highlight GitSignsDeletePreview guibg=NONE
highlight GitSignsCurrentLineBlame guifg=#6c6c6c guibg=NONE

" Staged hunks (when `staged` highlight is enabled)
highlight GitSignsStagedAdd guifg=#99c794 guibg=NONE
highlight GitSignsStagedChange guifg=#5fafd7 guibg=NONE
highlight GitSignsStagedDelete guifg=#ec5f67 guibg=NONE
highlight GitSignsStagedChangedelete guifg=#5fafd7 guibg=NONE
highlight GitSignsStagedTopdelete guifg=#ec5f67 guibg=NONE

" Virtual text (for inline blame)
highlight GitSignsVirtualText guifg=#6c6c6c guibg=NONE
]])
EOF
endif


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
    -- buffers
    vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true, desc = 'save' })
    vim.keymap.set('n', '<leader>q', ':bd<CR>', { silent = true, desc = 'close buffer' })
    vim.keymap.set('n', '<leader>Q', ':bd!<CR>', { silent = true, desc = 'force close buffer' })
    vim.keymap.set('n', '<leader>n', ':bn<CR>', { silent = true, desc = 'next buffer' })
    vim.keymap.set('n', '<leader>p', ':bp<CR>', { silent = true, desc = 'previous buffer' })
    vim.keymap.set('n', '<leader>s', ':noh<CR>', { silent = true, desc = 'clear search highlight' })
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
        ['R']  = 'REPLACE ',
        ['c']  = 'COMMAND ',
        ['v']  = 'VISUAL ',
        ['V']  = 'V·LINE ',
        [''] = 'V·BLOCK ',
        ['s']  = 'SELECT ',
        ['t']  = 'TERMINAL ',
    }

    require("catppuccin").setup({
        no_italic = true,
    })
    vim.cmd.colorscheme "catppuccin-mocha"

    local highlights = {
        FzfLuaNormal       = { bg = "NONE" },
        FzfLuaBorder       = { bg = "NONE" },
        FzfLuaPreviewNormal = { bg = "NONE" },
        FzfLuaPreviewBorder = { bg = "NONE" },
        FzfLuaBackdrop      = { bg = "NONE" },
    }

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    vim.api.nvim_set_hl(0, 'SmartYank', { bg = '#ff7f00', fg = '#000000', bold = false })
    vim.api.nvim_set_hl(0, 'Search', { bg = '#606060', fg = '#000000' })
    vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#D0D0D0', fg = '#000000' })
    vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#D0D0D0', fg = '#000000' })

    require('smartyank').setup {
        highlight = {
            enabled = true,
            higroup = "SmartYank",
            timeout = 500,
        },
        clipboard = {
            enabled = true
        },
        tmux = {
            enabled = true,
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
        list = { selection = { preselect = false } },
        documentation = { auto_show = false },
    },
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Space>'] = { 'accept', 'fallback' },
        --['<Space>'] = { 'select_and_accept', 'fallback' },
        ['<C-Space>'] = { 'show', 'fallback' },
    },
    cmdline = {
        keymap = {
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Space>'] = { 'accept', 'fallback' },
            --['<Space>'] = { 'select_and_accept', 'fallback' },
        },
        completion = {
            list = { selection = { preselect = false } },
            menu = { auto_show = false },
            ghost_text = { enabled = false },
        }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
EOF

lua << EOF
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--limit-results=50",
        "--completion-style=bundled",
        "--header-insertion=never",
        --"--malloc-trim",
        "--pch-storage=memory",
        "-j=1",
    },
    filetypes = { "c", "cpp" },
    flags = {
        debounce_text_changes = 5000,
    },
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})
vim.lsp.enable('clangd')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
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

"lua require("noice").setup()
lua << EOF
require("noice").setup({
    messages = {
        view_search = false,
    },
    lsp = {
        signature = {
            enabled = false,
        },
        hover = {
            enabled = false,
        }
    },
})
EOF


if 1
lua << EOF
require("flash").setup({
    modes = {
        char = { enabled = false },
        search = { enabled = false },
    },
})

--vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end)
--vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").jump({ search = { forward = false } }) end)

-- s: Search forward only, current window
vim.keymap.set({ "n", "x", "o" }, "s", function()
    require("flash").jump({
        search = { forward = true, wrap = false, multi_window = false }
    })
end)

-- S: Search backward only, current window
vim.keymap.set({ "n", "x", "o" }, "S", function()
    require("flash").jump({
        search = { forward = false, wrap = false, multi_window = false }
    })
end)
EOF
endif


" magic flickering fix for incsearch with noice from eyalz800
" https://github.com/folke/noice.nvim/issues/679
lua << EOF
local customize_incsearch_for_noice = function()
    local ns = vim.api.nvim_create_namespace('noice-incsearch-ns')
    local group = vim.api.nvim_create_augroup('noice-incsearch-group', {})
    local start_pos = nil
    local top_line = nil
    local matches = {}
    local cur_idx = 1
    local pat = ''
    local search_cmds = { ['/'] = true, ['?'] = true }
    local search_cmd = nil
    local accept = false
    local is_noice_running = require 'noice.config'.is_running

    vim.keymap.set('c', '<cr>', function()
        if search_cmd then
            accept = true
        end
        return '<cr>'
    end, { noremap = false, expr = true })

    local function get_matches(pattern)
        if pattern == '' then return {} end
        local result = {}
        local save_pos = vim.api.nvim_win_get_cursor(0)
        vim.api.nvim_win_set_cursor(0, { 1, 0 })

        while true do
            local pos = vim.fn.searchpos(pattern, 'W')
            local row, col = pos[1], pos[2]
            if row == 0 then break end
            table.insert(result, { row, col - 1 })
            if not pcall(vim.api.nvim_win_set_cursor, 0, { row, col }) then break end
            vim.api.nvim_win_set_cursor(0, { row, col })
        end

        vim.api.nvim_win_set_cursor(0, save_pos)
        return result
    end

    local function match_index()
        local best_match_idx = nil

        if search_cmd == '/' then
            for i, match in ipairs(matches) do
                local m_row, m_col = match[1], match[2]
                if m_row > start_pos[1] or (m_row == start_pos[1] and m_col >= start_pos[2]) then
                    best_match_idx = i
                    break
                end
            end
            if best_match_idx == nil then
                best_match_idx = 1
            end
        elseif search_cmd == '?' then
            for i = #matches, 1, -1 do
                local match = matches[i]
                local m_row, m_col = match[1], match[2]
                if m_row < start_pos[1] or (m_row == start_pos[1] and m_col < start_pos[2]) then
                    best_match_idx = i
                    break
                end
            end
            if best_match_idx == nil then
                best_match_idx = #matches
            end
        end

        return best_match_idx
    end

    local function highlight()
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
        for i, match in ipairs(matches) do
            local hl = (i == cur_idx) and 'IncSearch' or 'Search'
            vim.api.nvim_buf_set_extmark(0, ns, match[1] - 1, match[2], { hl_group = hl, end_col = match[2] + #pat })
        end
    end

    local function jump()
        local match = matches[cur_idx]
        if match then
            vim.api.nvim_win_set_cursor(0, { top_line, 0 })
            vim.cmd('normal! zt')
            vim.api.nvim_win_set_cursor(0, { match[1], match[2] })
        end
    end

    local function jump_final()
        if not accept then
            vim.api.nvim_win_set_cursor(0, start_pos)
            return
        end
        local match = matches[cur_idx]
        if match then
            local line = match[1]
            local col = match[2]
            if #matches > 1 then
                if search_cmd == '/' then
                    if col == 0 and line ~= 0 then
                        line = line - 1
                    else
                        col = col - 1
                    end
                elseif search_cmd == '?' then
                    if col ~= #(vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]) then
                        col = col + 1
                    else
                        if line + 1 <= vim.api.nvim_buf_line_count(0) then
                            line = line + 1
                        else
                            line = 1
                        end
                        col = 0
                    end
                end
            end
            vim.api.nvim_win_set_cursor(0, { top_line, 0 })
            vim.cmd('normal! zt')
            vim.api.nvim_win_set_cursor(0, { line, col })
        end
    end

    vim.api.nvim_create_autocmd('CmdlineEnter', {
        group = group,
        pattern = '/,?',
        callback = function()
            local cmd_type = vim.fn.getcmdtype()
            if search_cmds[cmd_type] == nil or not is_noice_running() then return end
            if vim.o.incsearch == false then
                return
            end
            vim.o.incsearch = false
            start_pos = vim.api.nvim_win_get_cursor(0)
            top_line = vim.fn.line('w0')
            accept = false
            matches = {}
            cur_idx = 1
            pat = ''
            search_cmd = cmd_type
        end,
    })

    vim.api.nvim_create_autocmd('CmdlineChanged', {
        group = group,
        pattern = '/,?',
        callback = function()
            if not search_cmd then return end
            pat = vim.fn.getcmdline()
            vim.fn.setreg('/', pat)

            matches = get_matches(pat)
            if #matches == 0 then
                vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
                return
            end

            cur_idx = match_index()
            jump()

            highlight()
        end,
    })

    vim.api.nvim_create_autocmd('CmdlineLeave', {
        group = group,
        pattern = '/,?',
        callback = function()
            if not search_cmd then return end
            vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
            jump_final()
            start_pos = nil
            top_line = nil
            accept = false
            matches = {}
            vim.o.incsearch = true
            search_cmd = nil
        end,
    })
end
customize_incsearch_for_noice()
--vim.keymap.set('i', '<Esc>', '<cmd>stopinsert<CR>')
--vim.opt.lazyredraw = true
--vim.keymap.set('n', '<leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
vim.opt.guicursor:remove { 't:block-blinkon500-blinkoff500-TermCursor' }
--vim.opt.guicursor = "a:hor20"
vim.g['airline_powerline_fonts'] = 1
vim.g['airline_skip_empty_sections'] = 1
vim.g['airline#extensions#hunks#non_zero_only'] = 1
vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#show_buffers'] = 1
vim.g['airline#extensions#tabline#left_sep'] = ''
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
vim.g['airline#extensions#branch#custom_head'] = 'gitbranch#name'
vim.g['airline#extensions#hunks#hunk_source'] = 'gitsigns'
vim.api.nvim_create_autocmd("User", {
    pattern = "GitSignsUpdate", -- Note: Case sensitive
    callback = function()
        vim.cmd("redrawstatus")
    end,
})
vim.g['airline_theme'] = 'danetta_theme'

--[[
require('dressing').setup({
select = {
    enabled = true,
    backend = { "fzf_lua" },
    fzf_lua = {
        winopts = {
            height = 0.5,
            width = 0.4,
            row = 0.5,
            col = 0.5,
            preview = {
                layout = "vertical",
                vertical = "down:50%",
                hidden = false,
            },
        },
    },
}
})
]]
EOF

lua << EOF
require('fzf-lua').setup({
    winopts = {
        height     = 0.65,
        width      = 0.65,
        row        = 0.5,
        col        = 0.5,
    },
    file_ignore_patterns = { "build/", },
})
require('fzf-lua').register_ui_select({
    winopts = {
        height = 0.5,
        width = 0.4,
        row = 0.5,
        col = 0.5,
        preview = {
            layout = "vertical",
            vertical = "down:50%",
            hidden = false,
        },
    },
})
EOF


lua << EOF
vim.api.nvim_set_hl(0, 'TroublePreview', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TroubleNormal', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TroubleLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TroublePreview', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TroubleLocation', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TroublePreview', { 
  bg = 'NONE',
  fg = '#d7af5f',      -- Gold/orange foreground
  underline = true,     -- Underline instead of background
})
EOF
