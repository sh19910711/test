function! social_snippet#complete#is_repo_name_mode(str)
  return a:str =~ '@snip\(pet\)\?\s*<[^:\#>]*$'
endfunction

function! social_snippet#complete#is_file_name_mode(str)
  return a:str =~ '@snip\(pet\)\?\s*<[^:\#>]*:[^>]*$'
endfunction

function! social_snippet#complete#call(keyword)
  if ! g:social_snippet#complete#enable
    return []
  endif

  if social_snippet#complete#is_repo_name_mode(a:keyword)
    return social_snippet#complete#repo_name(a:keyword)
  elseif social_snippet#complete#is_file_name_mode(a:keyword)
    return social_snippet#complete#file_name(a:keyword)
  endif
endfunction

function! social_snippet#complete#repo_name(keyword)
  if has("ruby")
    call social_snippet#init#ruby()
    ruby << END_OF_SCRIPT
key = VIM.evaluate('a:keyword')
ret = @social_snippet.complete_snippet_path(key).map {|cand| "\"#{cand}\"" }
VIM.command "let s:ret = [#{ret.join(",")}]"
END_OF_SCRIPT
  else
    :let s:ret = split(system("sspm complete " . shellescape(a:keyword)), "\n")
  endif
  return s:ret
endfunction

function! social_snippet#complete#file_name(keyword)
  :let ret = split(system("sspm complete " . shellescape(a:keyword)), "\n")
  return ret
endfunction
