require "./spec_helper"

describe Dotenv do
  # TODO: Write tests
  it "correctly parses values containing nested quotes and leading/trailing spaces" do
    conf = Dotenv.load("spec/data/connect.env")
    conf["ON_CONN"].should eq %( UPDATE status SET value="connected" WHERE user="Daedalus" )
  end
end
