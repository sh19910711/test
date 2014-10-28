require "vimrunner"
require "vimrunner/rspec"

Vimrunner::RSpec.configure do |config|
  config.reuse_server = false

  config.start_vim do
    vim = Vimrunner.start

    # load social_snippet.vim
    plugin_path = File.expand_path('../..', __FILE__)
    vim.add_plugin(plugin_path, 'plugin/social_snippet.vim')

    vim
  end
end

