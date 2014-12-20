require_relative "file_system"

RFuse.main(ARGV.clone) do
  fs = FileSystem::Core.new("_template")
end
