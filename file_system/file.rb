class FileSystem::File
 
  attr_reader :name
  attr_reader :content

  def initialize(new_name, new_content)
    @name = new_name
    @content = new_content
  end

  def stat
    RFuse::Stat.file(0744, {
      :uid => 0,
      :gid => 0,
      :atime => Time.now,
      :mtime => Time.now,
      :size => content.length,
    })
  end

end
