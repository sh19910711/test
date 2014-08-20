define(
  [
    "jquery"
    "underscore"
    "backbone"
    "./player_view"
    "./map_view"
  ]
  (
    $
    _
    Backbone
    PlayerView
    MapView
  )->
    class MiscView extends Backbone.View
      className: "view"
      render: ->
        @$el
          .empty()
          .append '<button class="up">UP</button>'
          .append '<button class="down">DOWN</button>'
          .append '<button class="left">LEFT</button>'
          .append '<button class="right">RIGHT</button>'
        @

    class AppView extends Backbone.View
      className: "view"

      initialize: ->
        console.log "@Main#constructor"

      render: ->
        misc = new MiscView()
        @$el
          .empty()
          .append misc.render().el
        @

      events:
        "click .up": ->
          @model.move_up()
        "click .down": ->
          @model.move_down()
        "click .right": ->
          @model.move_right()
        "click .left": ->
          @model.move_left()

)
