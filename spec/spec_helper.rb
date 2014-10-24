require "vimrunner"
require "vimrunner/rspec"

Vimrunner::RSpec.configure do |config|
  config.reuse_server = true
  config.start_vim do
    vim = Vimrunner.start
    vim
  end
end

