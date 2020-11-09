require "./spec_helper"

describe Dotenv do
  # TODO: Write tests
  it "correctly parses values containing nested quotes and leading/trailing spaces" do
    conf = Dotenv.load("spec/data/connect.env")
    conf["ON_CONN"].should eq %( UPDATE status SET value="connected" WHERE user="Daedalus" )
  end

  describe "#load" do
    it "overrides existing environment variables by default" do
      ENV["DB_HOST"] = "example.com"
      Dotenv.load("spec/data/connect.env")
      ENV["DB_HOST"].should eq "mus-db.example.com"
    end

    it "skips existing environment variables when requested" do
      ENV["DB_HOST"] = "example.com"
      Dotenv.load("spec/data/connect.env", override_env: false)
      ENV["DB_HOST"].should eq "example.com"
    end
  end
end
