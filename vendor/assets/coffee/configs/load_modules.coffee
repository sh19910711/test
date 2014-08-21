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
      app_model = new AppModel
      app_router = new AppRouter(
        app_model: app_model
      )
      Backbone.history.start()
)
