define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class AppView extends Backbone.View
      className: "app-view view text-center"

      render: ->
        @$el
          .empty()
        @
)
