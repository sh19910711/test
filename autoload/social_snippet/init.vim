function! social_snippet#init#set_default_vars()
  if ! exists("g:social_snippet#complete")
    let g:social_snippet#complete = {}
  endif
  let g:social_snippet#complete#enable = exists("g:social_snippet#complete#enable") ? g:social_snippet#complete#enable : 0
endfunction

