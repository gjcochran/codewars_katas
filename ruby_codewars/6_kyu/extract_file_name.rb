class FileNameExtractor
  def self.extract_file_name(file)
    /_(?<name>.+\..+)\./.match(file)[:name]
  end
end

p FileNameExtractor.extract_file_name("1231231223123131_FILE_NAME.EXTENSION.OTHEREXTENSIO")
