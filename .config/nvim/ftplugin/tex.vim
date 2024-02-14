setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab

set conceallevel=2
let g:tex_conceal='abdmg'
let g:tex_flavor='latex'
"let g:vimtex_view_method = 'skim'
let g:vimtex_view_general_viewer = '/Applications/sioyek.app/Contents/MacOS//sioyek'
"let g:vimtex_view_automatic = 0
"
"

" leader ll to call VimtexCompile
nnoremap <leader>ll :VimtexCompile<CR>
nnoremap <leader>lv :VimtexView<CR>
nnoremap <leader>lt :VimtexTocToggle<CR>

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-enable-write18',
    \ ],
    \}

" necessary settings for externalizing tikz: 
"
" \usepackage{luatex85,shellesc}
" \usepackage{pgfplots}
" \usepgfplotslibrary{external}
" \tikzset{
"     external/system call={pdflatex \tikzexternalcheckshellescape -halt-on-error -interaction=batchmode -jobname "\image" "\texsource"}}
" \tikzexternalize[prefix=figures/]



let g:vimtex_quickfix_open_on_warning = 0

let g:vimtex_quickfix_ignore_filters = [
            \ 'Token not allowed in a PDF string',
            \ 'inputenc package ignored with utf8 based engines',
            \ 'Empty bibliography',
            \]

nnoremap <C-p> :call MarkdownClipboardImage()<CR>

function! MarkdownClipboardImage() abort
  " Create `img` directory if it doesn't exist
  let img_dir = getcwd() . '/imgs'
  if !isdirectory(img_dir)
    silent call mkdir(img_dir)
  endif

  " First find out what filename to use
  let index = 1
  let file_path = img_dir . "/image" . index . ".png"
  while filereadable(file_path)
    let index = index + 1
    let file_path = img_dir . "/image" . index . ".png"
  endwhile

  let clip_command = 'osascript'
  let clip_command .= ' -e "set png_data to the clipboard as «class PNGf»"'
  let clip_command .= ' -e "set referenceNumber to open for access POSIX path of'
  let clip_command .= ' (POSIX file \"' . file_path . '\") with write permission"'
  let clip_command .= ' -e "write png_data to referenceNumber"'

  silent call system(clip_command)
  if v:shell_error == 1
    normal! p
    echoerr "Error: Missing Image in Clipboard"
  else
    let caption = getline('.')
    execute "normal! ddi\\begin{figure}[ht]\r" . 
    \"\\centering\r" . 
    \"\\includegraphics[width=200px]{./imgs/image" . index . ".png}\r" . 
    \"\\caption{" . caption . "}\r" . 
    \"\\label{fig:LABEL}\r" .
    \"\\end{figure}"
    execute "normal! 3k4w:w"
  endif
endfunction

au BufRead,BufNewFile *.tex setlocal spell spelllang=en
set spell spelllang=en
