require "spec_helper"

describe "social_snippet#complete" do

  describe "#repo_name" do

    context "repo_name(ex)" do

      before { vim.command "call append(0, join(social_snippet#complete#repo_name('@snip <ex'), \"\n\"))" }
      let(:output) { vim_current_buffer }
      it { expect(output).to match /example-repo/ }

    end

  end

end

