@requirejs_paths = {

  # lib
  "jquery": "/js/lib/jquery/jquery"
  "backbone": "/js/lib/backbone/backbone"
  "underscore": "/js/lib/underscore/underscore"

  # application
  "app": "/js/app"

}

requirejs.config(
  paths: @requirejs_paths
)

