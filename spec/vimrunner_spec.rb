require "spec_helper"

describe "vimrunner" do

  context ":echomsg 'hello'" do

    subject { vim.command "echomsg 'hello'" }
    it { should eq "hello" }

  end # :echomsg 'hello'

  context ":echmsg 1+1" do

    subject { vim.command "echomsg 1+1" }
    it { should eq "2" }

  end

end # vimrunner
