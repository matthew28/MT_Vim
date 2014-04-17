set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
set cursorline                                                " ��X��ܷ�e��
set number                                                    " ��ܦ渹
set tags=C:\git_test\akm\akm_0304_1\tags;                      "�]�wtag �ɪ���m
set autochdir                                                  "�۰ʤ�����e�ؿ�����e���Ҧb���ؿ�
set mouse=nv                                                   "�b Normal mode �M Visual mode ���ϥηƹ� 
set nobackup                                                   "��git�޲z�ƥ�, �ҥH ���n�ƥ����,�p~index.php  
set hidden                                                     "���\�b�����O�s���ק�ɤ����w�İϡA���ɪ��ק�� vim �t�d�O�s
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

