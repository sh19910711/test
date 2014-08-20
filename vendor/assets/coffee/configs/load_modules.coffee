requirejs(
  [
    "jquery"
    "app/models/app_model"
    "app/routers/app_router"
  ]
  (
    $
    AppModel
    AppRouter
  )->
    $ ->
      app_model = new AppModel()
      app_router = new AppRouter(
        app_model: app_model
      )
      app_router.start()
      app_model.get_io().on "connect", ->
        app_model.init_ws()
)
