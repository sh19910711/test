require "faye/websocket"
Faye::WebSocket.load_adapter('thin')

require_relative "lib/app"
require_relative "lib/rack/middleware/websocket"

use Rack::Middleware::WebSocket
run Application

