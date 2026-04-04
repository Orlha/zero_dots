" powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

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
"Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
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
Plug 'cohama/lexima.vim'
Plug 'chrisgrieser/nvim-spider'

call plug#end()

" themes
set termguicolors
set background=dark
colorscheme nightfox
let g:airline_theme = 'badwolf'

" transparency
" Set the main editor background to transparent
highlight Normal guibg=NONE ctermbg=NONE
" Set the line number column background to transparent
highlight LineNr guibg=NONE ctermbg=NONE
" Set the background for the column to the right of the line numbers
highlight SignColumn guibg=NONE ctermbg=NONE

" nvim-tree transparency for inactive tab
hi NormalNC guibg=NONE ctermbg=NONE
hi NvimTreeNormalNC guibg=NONE ctermbg=NONE

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
    vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
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
    map('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
    map('n', '<leader>q', ':bd<CR>', { desc = 'Close buffer' })
    map('n', '<leader>Q', ':bd<CR>', { desc = 'Force close buffer' })
    map('n', '<leader>n', ':bn<CR>', { desc = 'Next buffer' })
    map('n', '<leader>p', ':bp<CR>', { desc = 'Previous buffer' })
    map('n', '<leader>s', ':noh<CR>', { desc = 'Clear search highlight' })
    -- fzf lua mappings
    vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>')      -- Files
    vim.keymap.set('n', '<leader>fg', ':FzfLua live_grep<CR>')  -- Grep
    vim.keymap.set('n', '<leader>fb', ':FzfLua buffers<CR>')    -- Buffers
    vim.keymap.set('n', '<leader>fr', ':FzfLua oldfiles<CR>')   -- Recent
    -- Replace default w, e, b with spider versions
    vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>")
    vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>")
    vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>")
    vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>")
EOF

autocmd VimLeave * set guicursor=a:hor20
let g:sneak#label = 1

" mappings
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
