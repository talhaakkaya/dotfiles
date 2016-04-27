set nocompatible              						"We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set laststatus=2


"-------------Visuals--------------"
colorscheme atom-dark-256
set t_Co=256								"Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira\ Code:h17						"Set the default font family and size.
"set macligatures							"We want pretty symbols, when available.
set guioptions-=e							"We don't want Gui tabs.
"set linespace=16   						        "Macvim-specific line-height.
set lines=999

set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R

"We'll fake a custom left padding for each window.
hi LineNr ctermbg=bg ctermfg=236 guibg=bg
"set foldcolumn=2
"hi foldcolumn guibg=bg

"Get rid of ugly split borders.
hi vertsplit ctermbg=bg ctermfg=bg guifg=bg guibg=bg

" Active cursorline.
set cursorline

" Set color for current line.
hi CursorLine ctermbg=236 ctermfg=NONE guibg=236 guifg=NONE         



"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.




"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>


" Set limit <PageDown> and <PageUp>
map <PageDown> 5j
map <PageUp> 5k






"-------------Plugins--------------"

"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <C-p> :CtrlP<cr>
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

nmap <Leader><Tab> :NERDTreeToggle<cr>

"/
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  
let g:php_cs_fixer_path = "~/.php-cs-fixer.phar"			" Set php-cs-fixer.phar path for psr2 formatting.
let g:php_cs_fixer_php_path = "/usr/bin/php"				" Set php path.

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"/
"/ vim-airline/vim-airline
"/
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"/
"/ vim-emmet
"/
let g:user_emmet_install_global = 0
autocmd FileType html,css,twig EmmetInstall
autocmd BufNewFile,BufRead *.html.twig   set syntax=html


"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>




"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END




"-------------Functions--------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>




"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
" 
" CTRL + W + _          # => yatay düzlemde sayfayı büyütür
" CTRL + W + =          # => bütün sayfaları eşitler
" CTRL + W + |          # => dikeyde sayfayı tam ekran yapar
" 
" <class>,n             # => PHP sınıfını use ile ekler
" <class>,nf            # => PHP sınfını genişleterek ekler
"
" cs <old> <new>        # => eski yeni yeni karakterleri değiştirir
" cst <old> <new>       # => html tagleri ile değişimi yapar
" dst                   # => içiçnde bulunduğunun taglerini siler
" ds <current>          # => içinde bulunduğu işaretçileri siler
"
" ,pf			# => İçinde bulunduğun php dosyanı psr2 standartlarına yükseltir.
"
" m<a,b,c>		# => Bulunduğuu yeri işaretler
" d'm			# => işaretleridiği yerden siler
" v'm			# => işaretleriği yerden seçer
