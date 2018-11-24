module Dotenv
  def self.load(path = ".env", set_env = true) : Hash(String, String)
    hash = process_file(path)
    if set_env
      set_env(hash)
    end

    hash
  end

  private def self.read_file(path : String)
    return File.read_lines(File.expand_path(path))
  end

  private def self.process_file(path : String)
    hash = Hash(String, String).new

    lines = read_file(path)

    lines.each do |line|
      process_line(line, hash)
    end

    hash
  end

  private def self.process_line(line : String, hash : Hash(String, String))
    if line != "" && line[0].to_s != "#"
      name, value = line.split("=", 2)
      hash[name.strip] = value.strip
    end
  end

  private def self.set_env(hash : Hash(String, String))
    hash.each do |key, value|
      ENV[key] = value
    end
  end
end
