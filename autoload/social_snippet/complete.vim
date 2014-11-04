function! social_snippet#complete#call(keyword)
  :let ret = split(system("sspm complete " . shellescape(a:keyword)), "\n")
  return ret
endfunction
