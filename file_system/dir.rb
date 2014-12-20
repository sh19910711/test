class FileSystem::Dir

  attr_reader :real_path

  def initialize(new_real_path)
    @real_path = new_real_path
    unless FileTest.directory?(real_path)
      raise Errno::ENOTDIR.new(real_path)
    end
  end

  def elements
    glob_path = File.join(real_path, "*")
    Dir.glob(glob_path).map {|path| Pathname(path).basename.to_s }
  end

  def stat
    RFuse::Stat.directory(0755, {
      :uid => 0,
      :gid => 0,
      :atime => Time.now,
      :mtime => Time.now,
      :size => 0,
    })
  end

end
