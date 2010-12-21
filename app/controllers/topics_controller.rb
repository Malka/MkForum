class TopicsController < ApplicationController
  before_filter :get_forum
  def new  
    @submit = "Create"
    @topic = @forum.topics.build
  end
  
  def create
    @topic = @forum.topics.build(params[:topic])
    if @topic.save
      flash[:success] = "Topic Successfully created..."
      redirect_to [@forum,@topic]
    else
      render 'new'
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
    @forum ||= @topic.forum
  end
  
  private
  def get_forum
      @forum = Forum.find(params[:forum_id]) if params[:forum_id]
  end
end
