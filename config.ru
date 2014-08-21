require "faye/websocket"
Faye::WebSocket.load_adapter('thin')

require_relative "app"
require_relative "middlewares/websocket"

use Middlewares::WebSocket
run Application

