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
        @ws = new WebSocket("ws://#{document.location.host}")
        @players = {}

      send: (t, data)->
        @send {
          type: t
          data: data
        }

      get_io: ->
        @ws

      move_up: ->
        console.log "@MainModel#move_up"
        @send "move_up"
        @

      move_down: ->
        console.log "@MainModel#move_down"
        @send "move_down"
        @

      move_left: ->
        console.log "@MainModel#move_left"
        @send "move_left"
        @

      move_right: ->
        console.log "@MainModel#move_right"
        @send "move_right"
        @

      init_ws: ->
        # WS events
        @ws.on "user_enter", (d)=>
          pos = JSON.parse d.pos_json
          console.log "@enter: #{arguments}"
          @players[d.s_id] = new PlayerModel(pos)

        @ws.on "user_exit", (d)=>
          console.log "@exit: #{arguments}"

        @ws.on "update_pos", (d)=>
          console.log "@update_pos ev: #{arguments}"
)
