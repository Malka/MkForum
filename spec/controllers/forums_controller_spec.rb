require 'spec_helper'

describe ForumsController do
  render_views
  
  before(:each) do
    @forum = Factory(:forum)
    second = Factory(:forum, :name => '2', :description => '2')
    third = Factory(:forum, :name => '3', :description => '3')
    @forums = [@forum, second, third]
  end
  
  describe "index" do
    it "should be OK" do
      get :index
      response.should be_success
    end
    it "should list all forums" do
      get :index
      @forums.each do |forum|
        response.should have_selector("th", :content => forum.name)
      end
    end
    it "should list subforums" do
        son = Factory(:forum, :name => 'son', :description => 'son', :parent_id => @forum.id)
        get :index
        response.should have_selector('a', :content => son.name)
      end
    
  end
  describe "create" do
    before(:each) do
      @forum = {:name => "testCreate",:description => 'bla'}
      @father = Factory(:forum, :name => Factory.next(:forum_name))
    end
    it "should create a new forum" do
      lambda  do
        post :create, :forum => @forum
      end.should change(Forum, :count).by(1)
    end
    it "should have a flash message" do
      post :create, :forum => @forum
      flash[:success] =~ /success/i
    end
  end
  describe "show" do
    before(:each) do
      @thread = Factory(:thread, :forum_id => @forum)
    end
    it "should show all threads" do
      get :show, :id => @forum
      response.should have_selector('td', :content => @thread.name)
    end
  end
end
