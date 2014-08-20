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
        @io = new RocketIO().connect()
        @players = []

      get_io: ->
        @io

      move_up: ->
        console.log "up"
        @io.push "move_up"
        @

      move_down: ->
        console.log "down"
        @io.push "move_down"
        @

      move_left: ->
        console.log "left"
        @io.push "move_left"
        @

      move_right: ->
        console.log "right"
        @io.push "move_right"
        @

      init: ->
        # DOM events
        $(document).on "click", "button.up", =>
          @move_up()
        $(document).on "click", "button.down", =>
          @move_down()
        $(document).on "click", "button.left", =>
          @move_left()
        $(document).on "click", "button.right", =>
          @move_right()

        # WS events
        @io.on "user_enter", (s_id)=>
          console.log "@enter: #{s_id}"
        @io.on "user_exit", (s_id)=>
          console.log "@enter: #{s_id}"
        @io.on "update_pos", (s_id)=>
          console.log "@update_pos ev: #{s_id}"

        @
)
