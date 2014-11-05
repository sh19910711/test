function! social_snippet#complete#is_repo_name_mode(str)
  return a:str =~ '@snip\(pet\)\?\s*<[^:\#>]*$'
endfunction

function! social_snippet#complete#is_file_name_mode(str)
  return a:str =~ '@snip\(pet\)\?\s*<[^:\#>]*:[^>]*$'
endfunction

function! social_snippet#complete#repo_name(keyword)
  :let ret = split(system("sspm complete " . shellescape(a:keyword)), "\n")
  return ret
endfunction

function! social_snippet#complete#file_name(keyword)
  :let ret = split(system("sspm complete " . shellescape(a:keyword)), "\n")
  return ret
endfunction
