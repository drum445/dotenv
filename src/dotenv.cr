module Dotenv
  def self.load(path = ".env", set_env = true, override_env = true) : Hash(String, String)
    hash = process_file(path)
    set_env(hash, override_env) if set_env

    hash
  rescue exc : File::NotFoundError
    Hash(String, String).new
  end

  private def self.process_file(path : String)
    File.read_lines( File.expand_path path )
      .reject { |line| line =~ /^\s*(?:#.*)?$/ }
      .map    { |line|
        if line.match(/^([^#=\s]+)=(?:(?<Q>["`])((?:(?!\k<Q>|\\).|\\.)*)\k<Q>)(?:\s+(?:#.*)?)?$/)
          { $1, $3.gsub(Regex.new(%q<\\.>)) {|s| s[-1]} }
        elsif line.match(/^([^#=\s]+)='([^']+)'(?:\s+(?:#.*)?)?$/)
          { $1, $2 }
        elsif line.match(/^([^#=\s]+)=([^#\s"'](?:[^\s"']|\\.)*)(?:\s+(?:#.*)?)?$/)
          { $1, $2.gsub(Regex.new(%q<\\.>)) {|s| s[-1]} }
        else
          raise "this line in the env file #{path} was formatted incorrectly: #{line}"
        end
      }.to_h
  end

  private def self.set_env(hash : Hash(String, String), override_env : Bool)
    hash.each do |key, value|
      if !ENV.has_key?(key) || override_env
        ENV[key] = value
      end
    end
  end
end
