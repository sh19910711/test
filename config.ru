require_relative "app"
require_relative "middlewares/websocket"

set :websocketio, :port => 5000
set :rocketio, :websocket => true, :comet => false
use WebSocket
run Application

