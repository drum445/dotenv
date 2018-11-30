module Dotenv
  def self.load(path = ".env", set_env = true) : Hash(String, String)
    hash = process_file(path)
    if set_env
      set_env(hash)
    end

    hash
  end

  private def self.process_file(path : String)
    File.read_lines( File.expand_path path )
      .reject { |line| line =~ /^\s*(?:#.*)?$/ }
      .map    { |line|
        if line.match(/^([^#=\s]+)\s*=\s*(?:(?<Q>["'`])((?:(?!\k<Q>|\\).|\\.)*)\k<Q>)(?:\s+(?:#.*)?)?$/)
          {$1, $3}
        elsif line.match(/^([^#=\s]+)\s*=\s*([^#\s"']+)(?:\s+(?:#.*)?)?/)
          {$1, $2}
        else
          raise "this line in the env file #{path} was formatted incorrectly: #{line}"
        end
      }.to_h
  end

  private def self.set_env(hash : Hash(String, String))
    hash.each do |key, value|
      ENV[key] = value
    end
  end
end
