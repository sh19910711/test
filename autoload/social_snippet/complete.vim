function! social_snippet#complete#repo_name(keyword)
  :let ret = split(system("sspm complete " . shellescape(a:keyword)), "\n")
  return ret
endfunction
