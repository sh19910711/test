require "spec_helper"

describe SocialSnippet::TagParser do

  let(:instance) { SocialSnippet::TagParser.new() }

  describe "#find_snip_tags()" do

    context "there are two @snip" do

      let(:input) do
        [
          "// @snip <path/to/file1.c>",
          "// @snip <path/to/file2.c>",
          "// @snippet <path/to/file3.c>",
        ].join("\n")
      end

      context "result" do
        let(:result) { instance.find_snip_tags(input) }
        it { expect(result.length).to eq 2 }
      end

    end

  end # find_snip_tags

  describe "#find_snippet_tags()" do

    context "there is a @snippet" do

      let(:input) do
        [
          "// @snip <path/to/file1.c>",
          "// @snip <path/to/file2.c>",
          "// @snippet <path/to/file3.c>",
        ].join("\n")
      end

      context "result" do
        let(:result) { instance.find_snippet_tags(input) }
        it { expect(result.length).to eq 1 }
      end

    end

  end # find_snippet_tags

end # SocialSnippet::TagParser
