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
        console.log "@AppModel#initialize()"
        @ws = new WebSocket("ws://#{location.host}/")
        @init_ws()
        @players = {}

      send: (t, data)->
        @ws.send {
          type: t
          data: data
        }

      get_ws: ->
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
        @ws.onmessage = (o)=>
          console.log "onmessage", arguments
          switch o.type
            when "user_enter"
              pos = JSON.parse d.pos_json
              console.log "@enter: #{arguments}"
              @players[d.s_id] = new PlayerModel(pos)

            when "user_exit"
              console.log "@exit: #{arguments}"

            when "update_pos"
              console.log "@update_pos ev: #{arguments}"
)
