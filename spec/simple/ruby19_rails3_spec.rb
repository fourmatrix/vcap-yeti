require "harness"
require "spec_helper"
include BVT::Spec

describe BVT::Spec::Simple::Ruby19Rails3 do

  before(:all) do
    @session = BVT::Harness::CFSession.new
  end

  after(:each) do
    @session.cleanup!
  end

  it "access my application root and see it's running version 1.9.2" do
    @app = create_push_app("app_rails_version19")
    @app.stats.should_not == nil
    @app.get_response(:get).should_not == nil
    @app.get_response(:get).body_str.should_not == nil
    @app.get_response(:get).body_str.should == "running version 1.9.2"
  end
end
