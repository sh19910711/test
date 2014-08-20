define(
  [
    "jquery"
    "underscore"
    "backbone"
    "app/views/app_view"
  ]
  (
    $
    _
    Backbone
    AppView
  )->
    class AppRouter extends Backbone.Router
      initialize: (o)->
        console.log "@app_router"
        @app_view = new AppView(
          model: o.app_model
        )
        $("#app").append @app_view.el

      routes: ->
        "": "start"

      start: ->
        console.log "@start"
        @app_view.render()
      
)
