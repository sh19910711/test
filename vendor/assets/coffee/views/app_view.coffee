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
          .append '<span class="title"></span>'
        @$el.find(".title").first().text @model.get("title")
        @
)
