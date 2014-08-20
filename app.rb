require "sinatra"
require "sinatra/rocketio"

if development?
  require "sinatra/reloader"
end

class Application < Sinatra::Base
  configure do
    @sessions = []
    @players = {}
  end

  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development do
    register Sinatra::RocketIO
    io = Sinatra::RocketIO

    io.on :enter do |data, client|
      s = client.session
      @sessions.push s
    end
    
    io.on :move_up do |data, client|
      s = client.session
      @players[s][:y] -= 1
    end

    io.on :move_left do |data, client|
      s = client.session
      @players[s][:x] -= 1
    end

    io.on :move_down do |data, client|
      s = client.session
      @players[s][:y] += 1
    end

    io.on :move_right do |data, client|
      s = client.session
      @players[s][:x] += 1
    end

  end

  get "/" do
    haml :main
  end

end

