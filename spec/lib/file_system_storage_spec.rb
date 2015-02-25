require "spec_helper"

describe ::SocialSnippet::Storage::FileSystemStorage, :current => true do

  let(:storage) { ::SocialSnippet::Storage::FileSystemStorage.new }

  describe "#read" do

    context "read path/to/file" do

      example do
        expect { storage.read "path/to/file" }.to raise_error ::Errno::ENOENT
      end
      context "create path/to/file" do

        before do
          ::FileUtils.mkdir_p "path/to"
          ::FileUtils.touch "path/to/file"
        end

        context "read path/to/file" do
          example do
            expect { storage.read "path/to/file" }.to_not raise_error
          end
        end

      end # create path/to/file

    end # read path/to/file

  end #read

  describe "#write" do

    context "write path/to/file" do
      before do
        ::FileUtils.mkdir_p "path/to"
        storage.write "path/to/file", "data-123"
      end
      context "::File.read path/to/file" do
        subject { ::File.read "path/to/file" }
        it { should eq "data-123" }  
      end
    end

  end

end # ::SocialSnippet::Storage::FileSystemStorage

