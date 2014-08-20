require_relative "app"

set :cometio, :timeout => 120, :post_interval => 2, :allow_crossdomain => false
set :websocketio, :port => 5000
set :rocketio, :websocket => true, :comet => true # enable WebSocket and Comet
run Application

