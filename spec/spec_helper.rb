require "bundler/setup"
require_relative "helpers/codeclimate_helper"
require_relative "helpers/webmock_helper"

require "social_snippet"
require "json"
require "cgi"
require "stringio"

require_relative "helpers/fakefs_helper"

module SocialSnippet::SpecHelpers

  class Fake; end

  def fake_storage
    @fake_storage ||= ::SocialSnippet::Storage::FileSystemStorage.new
  end

  def fake_io
    @fake_io ||= StringIO.new
  end

  def fake_logger
    reset_fake_logger unless @logger
    @logger
  end

  def reset_fake_logger
    @logger = ::SocialSnippet::Logger.new(fake_io)
    @logger.level = ::SocialSnippet::Logger::Severity::INFO
  end

  def fake_home
    reset_fake_home unless @tmp_path
    @tmp_path
  end

  def reset_fake_home
    tmp_root = File.join(Dir.tmpdir, "social_snippet")
    FileUtils.mkdir_p tmp_root
    @tmp_path = Dir.mktmpdir(nil, tmp_root)
  end

  def make_fake_home
    fake_config.init_directories
  end

  def global_config
    $social_snippet_config ||= ::SocialSnippet::Config.new(
      fake_core,
      {
        :home => fake_home,
        :sspm_host => "api.server",
      },
    )
  end

  def enable_global_config
    @enable_global_config = true
  end

  def fake_config
    @config ||= ::SocialSnippet::Config.new(
      fake_core,
      {
        :home => fake_home,
        :sspm_host => "api.server",
      },
    )
  end

  def fake_api
    @fake_api ||= ::SocialSnippet::Api.new(fake_core)
  end

  def fake_core
    reset_fake_core unless @fake_core
    @fake_core
  end

  def fake_repo_manager
    @fake_repo_manager ||= ::SocialSnippet::Repository::RepositoryManager.new(fake_core)
  end

  def fake_repo_factory
    @fake_repo_factory ||= ::SocialSnippet::Repository::RepositoryFactory.new(fake_core)
  end

  def fake_registry_client
    @fake_registry_client ||= ::SocialSnippet::Registry::RegistryClient.new(fake_core)
  end

  def reset_fake_core
    @fake_core = Fake.new
    allow(fake_core).to receive(:storage).and_return fake_storage
    allow(fake_core).to receive(:logger).and_return fake_logger
    allow(fake_core).to receive(:config).and_return fake_config
    allow(fake_core).to receive(:api).and_return fake_api
    allow(fake_core).to receive(:repo_manager).and_return fake_repo_manager
    allow(fake_core).to receive(:repo_factory).and_return fake_repo_factory
    allow(fake_core).to receive(:registry_client).and_return fake_registry_client
    allow_any_instance_of(::SocialSnippet::CommandLine::Command).to receive(:core).and_return fake_core
  end

end

module SocialSnippet
  ::RSpec.configure do |config|
    config.include FakeFSHelpers
    config.before { enable_fakefs }
    config.after { disable_fakefs }

    config.include SpecHelpers
    config.before { reset_fake_core }

    config.before(:example, :without_fakefs => true) do
      disable_fakefs
      make_fake_home
    end
  end
end

$WITHOUT_FAKEFS = (ENV["RSPEC_WITHOUT_FAKEFS"] === "true")
