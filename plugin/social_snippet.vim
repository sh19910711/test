command! -nargs=0 -bar SSVersion
      \ call social_snippet#commands#show_version()

command! -nargs=0 -bar SSInsertSnippet
      \ call social_snippet#commands#insert_snippet()

call social_snippet#init#set_default_vars()
call social_snippet#init#ruby()
