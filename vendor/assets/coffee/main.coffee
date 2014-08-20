define(
  [
    "./player"
  ]
  (
    Player
  )->
    class Main
      constructor: ->
        console.log "@Main#constructor"
        @players = []

      move_up: ->
        console.log "up"

      move_down: ->
        console.log "down"

      move_left: ->
        console.log "left"

      move_right: ->
        console.log "right"

      init: (callback)->
        @io = new RocketIO()

        # DOM events
        $(document).on "click", "button.up", =>
          @move_up()
        # DOM events
        $(document).on "click", "button.down", =>
          @move_down()
        # DOM events
        $(document).on "click", "button.left", =>
          @move_left()
        # DOM events
        $(document).on "click", "button.right", =>
          @move_right()
)
