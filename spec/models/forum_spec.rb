require 'spec_helper'

describe Forum do
  before(:each) do
    @attr = {:name => 'test forum', :description => "Description"}
  end
  
  it "should create a forum with the right attributes" do
    Forum.create!(@attr)
  end
  it "should not create a forum without a name" do
    no_name_forum = Forum.new(@attr.merge(:name => ""))
    no_name_forum.should_not be_valid
  end
  it "should have a unique name" do
    Forum.create(@attr)
    same_name_forum = Forum.new(@attr)
    same_name_forum.should_not be_valid
  end
  it "should have threads" do
    forum = Forum.new(@attr)
    forum.should respond_to(:topics)
  end
end
