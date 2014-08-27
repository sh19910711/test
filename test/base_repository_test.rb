require "spec_helper"

module SocialSnippet::Repository

  describe SocialSnippet::Repository::BaseRepository do

    describe ".is_version()" do

      context "valid cases" do
        it { expect(BaseRepository.is_version("0.0.1")).to be_truthy }
        it { expect(BaseRepository.is_version("1.2.3")).to be_truthy }
        it { expect(BaseRepository.is_version("1.2.345")).to be_truthy }
        it { expect(BaseRepository.is_version("123.4.5")).to be_truthy }
        it { expect(BaseRepository.is_version("9.9.9")).to be_truthy }
        it { expect(BaseRepository.is_version("1.234.5")).to be_truthy }
        it { expect(BaseRepository.is_version("123.456.7")).to be_truthy }
        it { expect(BaseRepository.is_version("1.234.567")).to be_truthy }
        it { expect(BaseRepository.is_version("123.4.567")).to be_truthy }
        it { expect(BaseRepository.is_version("123.456.789")).to be_truthy }
        it { expect(BaseRepository.is_version("12.34.56")).to be_truthy }
      end # valid cases

      context "invalid cases" do
        it { expect(BaseRepository.is_version("001.1")).to be_falsey }
        it { expect(BaseRepository.is_version("1.2.")).to be_falsey }
        it { expect(BaseRepository.is_version(".2.345")).to be_falsey }
        it { expect(BaseRepository.is_version("12345")).to be_falsey }
        it { expect(BaseRepository.is_version("9..9")).to be_falsey }
        it { expect(BaseRepository.is_version("..")).to be_falsey }
        it { expect(BaseRepository.is_version(".")).to be_falsey }
        it { expect(BaseRepository.is_version("1234567")).to be_falsey }
        it { expect(BaseRepository.is_version(".4.")).to be_falsey }
        it { expect(BaseRepository.is_version("01.2.3")).to be_falsey }
        it { expect(BaseRepository.is_version("1.2.03")).to be_falsey }
        it { expect(BaseRepository.is_version("1.02.3")).to be_falsey }
        it { expect(BaseRepository.is_version("1")).to be_falsey }
      end # invalid cases

    end # is_version()

  end # SocialSnippet::Repository::BaseRepository

end # SocialSnippet::Repository

