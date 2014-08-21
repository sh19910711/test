define(
  [
    "backbone"
    "tmlib"
  ]
  (
    Backbone
    tmlib
  )->
    class GameView extends Backbone.View
      className: "game-view view"

      render: ->
        # create canvas
        c = tmlib.graphics.Canvas()
        c.width = 320
        c.height = 320
        c.clearColor "black"

        @$el
          .empty()
          .append c.element
        @
)
