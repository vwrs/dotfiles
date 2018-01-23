" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" vim-easymotion
" map <Leader> <Plug>(easymotion-prefix) " default: <Leader><Leader>
map  <Leader><Leader>F <Plug>(easymotion-bd-f)
nmap <Leader><Leader>F <Plug>(easymotion-overwin-f)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map  <Leader><Leader>W <Plug>(easymotion-bd-w)
nmap <Leader><Leader>W <Plug>(easymotion-overwin-w)
" map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

