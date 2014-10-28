function! social_snippet#commands#show_version()
  :echomsg social_snippet#version()
endfunction

function! social_snippet#commands#insert_snippet()
  :let current_pos = getpos(".")
  :let target_text = join(getline(1,'$'), "\n")
  :%d
  :call append(0, split(system("ssnip", target_text), "\n"))
  :call setpos('.', current_pos)
endfunction
