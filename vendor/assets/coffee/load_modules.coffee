requirejs(
  [
    "/js/main"
  ]
  (
    Main
  )->
    $ ->
      app = new Main()
      app.get_io().on "connect", ->
        app.init()
)
