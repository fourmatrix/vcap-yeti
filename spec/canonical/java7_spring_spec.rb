require "harness"
require "spec_helper"
include BVT::Spec

describe BVT::Spec::Canonical::Java7Spring do
  include BVT::Spec::CanonicalHelper, BVT::Spec

  before(:all) do
    @session = BVT::Harness::CFSession.new
  end

  after(:each) do
    @session.cleanup!
  end

  it "java test deploy app using java 7" , :mysql => true  do
    pending "not running because java7 runtime not installed"
    app = create_push_app("app_spring_service_7")
    contents = app.get_response(:get,'java')
    contents.should_not == nil
    contents.body_str.should_not == nil
    contents.body_str.should =~ /1\.7/
    contents.close

    bind_service_and_verify(@app, MYSQL_MANIFEST)
  end


end

