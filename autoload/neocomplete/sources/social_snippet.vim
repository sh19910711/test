let s:source = {
      \ "name" : "social_snippet",
      \}

function! s:source.gather_candidates(context)
  if social_snippet#complete#is_repo_name_mode(a:context.input)
    return map(social_snippet#complete#repo_name(a:context.input), '{ "word" : v:val }')
  elseif social_snippet#complete#is_file_name_mode(a:context.input)
    return map(social_snippet#complete#file_name(a:context.input), '{ "word" : v:val }')
  endif
  return []
endfunction

function! neocomplete#sources#social_snippet#define()
  return s:source
endfunction

