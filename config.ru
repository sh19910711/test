require_relative "app"
require_relative "middlewares/websocket"

use Middlewares::WebSocket
run Application

