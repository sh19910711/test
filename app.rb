require "sinatra"
require "sinatra/rocketio"

if development?
  require "sinatra/reloader"
end

class Application < Sinatra::Base
  register Sinatra::RocketIO

  configure :development do
    register Sinatra::Reloader
  end

  configure do
    players = {}
    io = Sinatra::RocketIO

    io.on :connect do |client|
      s = client.session
      players[s] = {
        x: 0,
        y: 0,
      }
      io.push :user_enter, {:s_id => s, :pos => players[s].to_json}
    end

    io.on :disconnect do |client|
      s = client.session
      io.push :user_exit, {:s_id => s}
    end

    io.on :move_up do |data, client|
      s = client.session
      players[s][:y] -= 1
      io.push :update_pos, {:s_id => s, :pos => players[s].to_json}
    end

    io.on :move_left do |data, client|
      s = client.session
      players[s][:x] -= 1
      io.push :update_pos, {:s_id => s, :pos => players[s].to_json}
    end

    io.on :move_down do |data, client|
      s = client.session
      players[s][:y] += 1
      io.push :update_pos, {:s_id => s, :pos => players[s].to_json}
    end

    io.on :move_right do |data, client|
      s = client.session
      players[s][:x] += 1
      io.push :update_pos, {:s_id => s, :pos => players[s].to_json}
    end
  end

  get "/" do
    haml :main
  end

end

