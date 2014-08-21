@requirejs_paths = {

  # lib
  "jquery": "/js/lib/jquery/jquery"
  "backbone": "/js/lib/backbone/backbone"
  "underscore": "/js/lib/underscore/underscore"
  "tmlib": "/js/lib/tmlib.js/tmlib"

  # application
  "app": "/js/app"

}

@requirejs_shim = {
  "tmlib":
    "exports": 'tm'
}

requirejs.config(
  paths: @requirejs_paths
  shim: @requirejs_shim
)
