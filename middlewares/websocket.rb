require "sinatra/rocketio"
require "faye/websocket"

module Middlewares
  class WebSocket
    def initialize(app)
      @app = app
      @clients = {}
      @players = {}
    end

    def push(data)
      @clients.each {|d, c| c.send(data.to_json) }
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        io_ws = Faye::WebSocket.new(env, nil, {ping: 15})

        io_ws.on :open do |client|
          @clients[io_ws.object_id] = io_ws.object_id
          @players[io_ws.object_id] = {
            x: 0,
            y: 0,
          }
          push :user_enter, {:s_id => s, :pos_json => @players[s].to_json}
        end

        io_ws.on :close do |client|
          s = io_ws.object_id
          push :user_exit, {:s_id => s}
          @clients.delete s
        end


        io_ws.on :move_up do |data, client|
          s = io_ws.object_id
          players[s][:y] -= 1
          push :update_pos, {:s_id => s, :pos_json => @players[s].to_json}
        end

        io_ws.on :move_left do |data, client|
          s = io_ws.object_id
          players[s][:x] -= 1
          push :update_pos, {:s_id => s, :pos_json => @players[s].to_json}
        end

        io_ws.on :move_down do |data, client|
          s = io_ws.object_id
          players[s][:y] += 1
          push :update_pos, {:s_id => s, :pos_json => @players[s].to_json}
        end

        io_ws.on :move_right do |data, client|
          s = io_ws.object_id
          players[s][:x] += 1
          push :update_pos, {:s_id => s, :pos_json => @players[s].to_json}
        end

        io_ws.rack_response
      
      else

        @app.call(env)

      end
    end
  end
end

