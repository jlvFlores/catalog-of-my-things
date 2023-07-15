require 'fileutils'

class SetFiles
  def initialize()
    @directory_path = File.join(Dir.pwd, 'JSON_files')
    @file_names = ['books.json', 'labels.json', 'albums.json', 'genres.json', 'games.json', 'authors.json']
    set_dir
  end

  private

  def set_dir
    create_directory unless Dir.exist?(@directory_path)
    create_files
  end

  def create_directory
    Dir.mkdir(@directory_path)
  end

  def create_files
    @file_names.each do |file_name|
      file_path = "#{@directory_path}/#{file_name}"
      FileUtils.touch(file_path) unless File.exist?(file_path)
    end
  end
end
