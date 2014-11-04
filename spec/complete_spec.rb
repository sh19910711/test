require "spec_helper"

describe "social_snippet#complete" do

  describe "#call" do

    context "call(ex)" do

      before { vim.command "call append(0, join(social_snippet#complete#call('@snip <ex'), \"\n\"))" }
      let(:output) { vim_current_buffer }
      it { expect(output).to match /example-repo/ }

    end

  end

end

