require "spec_helper"

describe :SocialSnippetInsertSnippet do

  context "without snip tags" do

    before do
      vim.insert [
        "hello",
      ].join("\n")
    end

    context "call :SocialSnippetInsertSnippet" do

      before do
        vim.command "SocialSnippetInsertSnippet"
      end

      let(:output) { vim_current_buffer }
      it { expect(output).to match /hello/ }

    end # call :SocialSnippetInsertSnippet

  end # without snip tags

  context "with a snip tags" do

    before do
      vim.insert [
        "#include <iostream>",
        "",
        "// @snip <example-repo:func.cpp>",
        "",
        "int main() {",
        '  std::cout << "func() => " << func() << std::endl;',
        "  return 0;",
        "}",
      ].join("\n")
    end

    context "call :SocialSnippetInsertSnippet" do

      before do
        vim.command :SocialSnippetInsertSnippet
      end

      let(:output) { vim_current_buffer }
      it { expect(output).to match /include <iostream>/ }
      it { expect(output).to_not match /\/\/ @snip / }
      it { expect(output).to match /\/\/ @snippet / }
      it { expect(output).to match /<example-repo#\d+\.\d+\.\d+:func.cpp>/ }
      it { expect(output).to match /<example-repo#\d+\.\d+\.\d+:func\/sub_func_1.cpp>/ }
      it { expect(output).to match /<example-repo#\d+\.\d+\.\d+:func\/sub_func_2.cpp>/ }
      it { expect(output).to match /<example-repo#\d+\.\d+\.\d+:func\/sub_func_3.cpp>/ }

    end # call :SocialSnippetInsertSnippet

  end # with a snip tag

end # vimrunner
