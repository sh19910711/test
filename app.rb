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

  get "/" do
    haml :main
  end
end

