define(
  [
    "jquery"
    "underscore"
    "backbone"
    "./player_model"
  ]
  (
    $
    _
    Backbone
    PlayerModel
  )->
    class AppModel extends Backbone.Model
      initialize: ->
        console.log "@MainModel#initialize()"
        @io = new RocketIO().connect()
        @players = {}

      get_io: ->
        @io

      move_up: ->
        console.log "@MainModel#move_up"
        @io.push "move_up"
        @

      move_down: ->
        console.log "@MainModel#move_down"
        @io.push "move_down"
        @

      move_left: ->
        console.log "@MainModel#move_left"
        @io.push "move_left"
        @

      move_right: ->
        console.log "@MainModel#move_right"
        @io.push "move_right"
        @

      init_ws: ->
        # WS events
        @io.on "user_enter", (d)=>
          pos = JSON.parse d.pos_json
          console.log "@enter: #{arguments}"
          @players[d.s_id] = new PlayerModel(pos)

        @io.on "user_exit", (d)=>
          console.log "@exit: #{arguments}"

        @io.on "update_pos", (d)=>
          console.log "@update_pos ev: #{arguments}"
)
