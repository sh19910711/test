define(
  [
    "backbone"
  ]
  (
    Backbone
  )->
    class LayoutView extends Backbone.View
      className: "layout-view view text-center"

      render: ->
        @$el.empty()
        @
)

