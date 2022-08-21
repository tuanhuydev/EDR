"================PLUGIN SETUP=========================="
call plug#begin()
 " File explorer
 Plug 'preservim/nerdtree'
 " Icons
 Plug 'ryanoasis/vim-devicons'
 " Status bar
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " Display git on status bar	
 Plug 'tpope/vim-fugitive'
 " Auto complete
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"================SETUP NEOVIM=========================="
syntax on
set encoding=UTF-8
set shiftwidth=2
set autoindent
set smartindent
set expandtab
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline_solarized_bg='light'
let g:coc_global_extensions = ['coc-json', 'coc-git']
"================MAP KEYS=============================="
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle ~/Desktop/WS/ <CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Set default directory on startup nerdtree
autocmd VimEnter * NERDTree ~/Desktop/WS/

" term open at nerdtree position
autocmd BufEnter * lcd %:p:h

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
