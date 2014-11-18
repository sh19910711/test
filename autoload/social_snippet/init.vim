function! social_snippet#init#set_default_vars()
  if ! exists("g:social_snippet")
    let g:social_snippet = {}
  endif
  let g:social_snippet#enable_ruby = exists("g:social_snippet#enable_ruby") ? g:social_snippet#enable_ruby : 1

  if ! exists("g:social_snippet#complete")
    let g:social_snippet#complete = {}
  endif
  let g:social_snippet#complete#enable = exists("g:social_snippet#complete#enable") ? g:social_snippet#complete#enable : 0
endfunction

let s:ruby_running = 0
function! social_snippet#init#ruby()
  if s:ruby_running
    return
  endif
  let s:ruby_running = 1

  if has("ruby") && g:social_snippet#enable_ruby
    ruby << END_OF_SCRIPT
require "rubygems"
require "social_snippet"
@social_snippet = ::SocialSnippet::SocialSnippet.new
END_OF_SCRIPT
  endif
endfunction

