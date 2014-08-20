requirejs(
  [
    "/js/main"
  ]
  (
    Main
  )->
    $ ->
      app = new Main()
      app.init()
)
