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
    class MapView extends Backbone.View
      initialize: ->
        console.log "@MapView#initialize"
)
