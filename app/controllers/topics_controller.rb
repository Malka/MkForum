class TopicsController < ApplicationController
  before_filter :get_forum
  uses_tiny_mce :options => {
    :plugins => %w{bbcode table}
  }
  def new  
    @submit = "Create"
    @topic = @forum.topics.build
  end
  
  def create
    @topic = @forum.topics.build(params[:topic])
    if @topic.save
      flash[:success] = "Topic Successfully created..."
      redirect_to [@forum,@topic]
      create_first_post
    else
      render 'new'
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @forum ||= @topic.forum
    @title = "#{@forum.name} > #{@topic.title}"
  end
  
  private
  def get_forum
      @forum = Forum.find(params[:forum_id]) if params[:forum_id]
  end
  
  def create_first_post
    @post = @topic.posts.build(:title => @topic.title, :content => params[:topic][:content])
    @post.save
  end
end
