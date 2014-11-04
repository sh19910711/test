require "spec_helper"

describe "social_snippet#complete" do

  describe "#is_repo_name_mode" do

    context "str = // @snip" do
      subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip")' }
      it { should eq "0" }
    end

    context "str = // @snip <" do
      subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <")' }
      it { should eq "1" }
    end

    context "str = // @snip <repo" do
      subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo")' }
      it { should eq "1" }
    end

    context "str = // @snip <repo#1.2.3" do
      subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo#1.2.3")' }
      it { should eq "0" }
    end

    context "str = // @snip <repo:path/to/file" do
      subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo:path/to/file")' }
      it { should eq "0" }
    end

    context "str = // @snip <repo#1.2.3:path/to/file" do
      subject { vim.command 'echomsg social_snippet#complete#is_repo_name_mode("// @snip <repo#1.2.3:path/to/file")' }
      it { should eq "0" }
    end

  end

  describe "#repo_name" do

    context "keyword = ex" do

      before { vim.command "call append(0, join(social_snippet#complete#repo_name('@snip <ex'), \"\n\"))" }
      let(:output) { vim_current_buffer }
      it { expect(output).to match /example-repo/ }

    end

  end

end

