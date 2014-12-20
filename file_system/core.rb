require_relative "file"
require_relative "dir"

class FileSystem::Core

  attr_reader :logger
  attr_reader :files
  attr_reader :root

  def initialize(src_path = "./")
    @logger = Logger.new(STDOUT)
    logger.level = Logger::Severity::DEBUG
    @root = FileSystem::Dir.new(src_path)
  end

  def init(ctx, rfuse_info)
    logger.info "RFuse started"
  end

  def dir_stat
    RFuse::Stat.directory(0755, {
      :uid => 0,
      :gid => 0,
      :atime => Time.now,
      :mtime => Time.now,
      :size => 0,
    })
  end

  def file_stat
    RFuse::Stat.file(0744, {
      :uid => 0,
      :gid => 0,
      :atime => Time.now,
      :mtime => Time.now,
      :size => 0,
    })
  end

  def readdir(ctx, path, filter, offset, ffi)
    logger.debug "readdir: #{path}"
    root.elements.each do |name|
      logger.debug "readdir: element: #{name}"
      path = File.join(root.real_path, name)
      if FileTest.file?(path)
        filter.push name, file_stat, 0
      else
        filter.push name, dir_stat, 0
      end
    end
  end

  def open(ctx, path, ffi)
    logger.debug "open: #{path}"
  end

  def read(ctx, path, size, offset, ffi)
    logger.debug "read: path = #{path}, size = #{size}, offset = #{offset}"
    if /^\/hello$/ === path
      return "hello"
    else
      raise Errno::EISDIR.new(path)
      return nil
    end
  end

  def getattr(ctx, path)
    logger.debug "getattr: #{path}"
    dir_stat
  end

  def ioctl(ctx, path, cmd, arg, ffi, flags, data)
    logger.debug "ioctl: path = #{path}, cmd = #{cmd}"
  end

end
