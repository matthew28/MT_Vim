set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
set cursorline                                                " 突出顯示當前行
set number                                                    " 顯示行號
set tags=C:\git_test\akm\akm_0304_1\tags;                      "設定tag 檔的位置
set autochdir                                                  "自動切換當前目錄為當前文件所在的目錄
set mouse=nv                                                   "在 Normal mode 和 Visual mode 中使用滑鼠 
set nobackup                                                   "用git管理備份, 所以 不要備份文件,如~index.php  
set hidden                                                     "允許在有未保存的修改時切換緩衝區，此時的修改由 vim 負責保存
behave mswin
nnoremap <F12> :TlistToggle<CR>
nmap <F8>   :TrinityToggleAll<CR>
nnoremap <silent> <F5> :Grep<CR>
set diffexpr=MyDiff()
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

