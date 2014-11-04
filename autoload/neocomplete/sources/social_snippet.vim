let s:source = {
      \ "name" : "social_snippet",
      \}

function! s:source.gather_candidates(context)
  return map(["test1", "test2", "test3"], '{ "word" : v:val }')
endfunction

function! neocomplete#sources#social_snippet#define()
  return s:source
endfunction

