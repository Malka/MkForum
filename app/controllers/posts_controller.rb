class PostsController < ApplicationController
  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    @post.title = "Re: #{@topic.title}"
  end
  
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post successfully created..."
      redirect_to @post.topic
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
end
