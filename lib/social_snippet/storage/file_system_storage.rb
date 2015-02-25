module SocialSnippet::Storage

  class FileSystemStorage < StorageBase

    def read(path)
      ::File.read path
    end

    def write(path, data)
      ::File.write path, data
    end

  end

end

