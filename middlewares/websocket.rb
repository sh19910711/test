require "faye/websocket"
require "json"

module Middlewares
  class WebSocket
    def initialize(app)
      @app = app
      @clients = {}
      @players = {}
      @queue = Queue.new()
      Thread.new do
        loop do
          @sleep
        end
      end
    end

    def push(type, data)
      @clients.each {|d, c| c.send({:type => type, :data => data.to_json}) }
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        io_ws = Faye::WebSocket.new(env)

        io_ws.on :open do |client|
          s = io_ws.object_id
          @clients[io_ws.object_id] = io_ws
          @players[io_ws.object_id] = {
            :x => 0,
            :y => 0,
          }
          push :user_enter, {:s_id => s, :pos_json => @players[s].to_json}
        end

        io_ws.on :close do |client|
          s = io_ws.object_id
          push :user_exit, {:s_id => s}
          @clients.delete s
        end

        io_ws.on :message do |event|
          io_ws.send event.data
        end

        io_ws.rack_response
      
      else

        @app.call(env)

      end
    end
  end
end

