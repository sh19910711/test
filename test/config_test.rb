require "spec_helper"

describe SocialSnippet::Config, :without_fakefs => $WITHOUT_FAKEFS, :current => true do
  
  let(:logger) do
    logger = ::SocialSnippet::Logger.new(STDOUT)
    logger.level = ::SocialSnippet::Logger::Severity::UNKNOWN
    logger
  end

  let(:social_snippet) do
    class Fake; end
    Fake.new
  end

  let(:config) do
    ::SocialSnippet::Config.new(social_snippet)
  end

  before { stub_const "ENV", "HOME" => Dir.mktmpdir }

  describe "case insensitivility" do

    context "set key" do
      before { config.set "key", "value" }
      it { expect(config.get "key").to eq "value" }
      it { expect(config.get "Key").to eq "value" }
      it { expect(config.get "KEY").to eq "value" }
    end

    context "set Key" do
      before { config.set "Key", "value" }
      it { expect(config.get "key").to eq "value" }
      it { expect(config.get "Key").to eq "value" }
      it { expect(config.get "KEY").to eq "value" }
    end

    context "set KEY" do
      before { config.set "KEY", "value" }
      it { expect(config.get "key").to eq "value" }
      it { expect(config.get "Key").to eq "value" }
      it { expect(config.get "KEY").to eq "value" }
    end

    context "set! key" do
      before { config.set! "key", "value" }
      it { expect(config.get "key").to eq "value" }
      it { expect(config.get "Key").to eq "value" }
      it { expect(config.get "KEY").to eq "value" }
    end

    context "set! Key" do
      before { config.set! "Key", "value" }
      it { expect(config.get "key").to eq "value" }
      it { expect(config.get "Key").to eq "value" }
      it { expect(config.get "KEY").to eq "value" }
    end

    context "set! KEY" do
      before { config.set! "KEY", "value" }
      it { expect(config.get "key").to eq "value" }
      it { expect(config.get "Key").to eq "value" }
      it { expect(config.get "KEY").to eq "value" }
    end

  end # case insensitivility

end
