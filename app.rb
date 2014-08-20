require "sinatra"
require "sinatra/rocketio"

if development?
  require "sinatra/reloader"
end

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development do
    register Sinatra::RocketIO
  end

  get "/" do
    haml :main
  end
end

