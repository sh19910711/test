define(
  [
    "jquery"
    "underscore"
    "backbone"
  ]
  (
    $
    _
    Backbone
  )->
    class Player extends Backbone.Model
      initialize: ->
        @x = 0
        @y = 0
)
