let s:source = {
      \ "name" : "social_snippet",
      \}

function! s:source.gather_candidates(context)
  if a:context.input =~ '@snip\(pet\)\?\s*<'
    return map(["dummy1", "dummy2", "dummy3"], '{ "word" : v:val }')
  endif
  return []
endfunction

function! neocomplete#sources#social_snippet#define()
  return s:source
endfunction

