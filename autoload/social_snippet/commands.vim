function! social_snippet#commands#show_version()
  :echomsg social_snippet#version()
endfunction

function! social_snippet#commands#insert_snippet()
  :let current_pos = getpos(".")
  :let target_text = join(getline(1,'$'), "\n")
  :%d
  :let snipped_text = systemlist("ssnip", target_text)
  :call append(0, snipped_text)
  :call setpos('.', current_pos)
endfunction
