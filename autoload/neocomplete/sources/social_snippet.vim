let s:source = {
      \ "name" : "social_snippet",
      \}

function! s:source.gather_candidates(context)
  return map(social_snippet#complete#call(a:context.input), '{ "word" : v:val }')
endfunction

function! neocomplete#sources#social_snippet#define()
  return s:source
endfunction

