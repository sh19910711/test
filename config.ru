require_relative "app"
require_relative "middlewares/websocket"

use WebSocket
run Application

