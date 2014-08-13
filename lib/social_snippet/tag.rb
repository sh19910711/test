module SocialSnippet
  class Tag
    # Create instance
    #
    # @param s [String] tag line text
    def initialize(s)
      if is_tag_line(s)
        @path   = get_path(s)
        @repo   = get_repo(s)
        @prefix = get_prefix(s)
        @suffix = get_suffix(s)
        @spaces = get_spaces(s)
      end
    end

    class << self

      # Check line text contains tag
      def is_tag_line(s)
        /(@snippet|@snip)\s*<.*?>/.match s
      end

    end
  end
end
