define(
  [
    "backbone"
    "app/views/layout_view"
    "app/views/app_view"
    "app/views/game_view"
  ]
  (
    Backbone
    LayoutView
    AppView
    GameView
  )->
    class AppRouter extends Backbone.Router
      initialize: (opts)=>
        @app_model = opts.app_model

      routes:
        "": "show_index"

      show_index: ->
        @app_model.set "title", "hello"

        layout_view = new LayoutView()
        app_view = new AppView(
          model: @app_model
        )
        game_view = new GameView(
          model: @app_model
        )

        layout_view.render()
        app_view.render()
        game_view.render()

        app_view.$el.append game_view.el
        layout_view.$el.append app_view.el
        $("body").empty().append layout_view.el
)
