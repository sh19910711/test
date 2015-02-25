module SocialSnippet

  class Storage::StorageEntity

    attr_reader :path

    def read
      raise "not implemented"
    end

    def write(data)
      raise "not implemented"
    end

  end

end
