class PostsController < ApplicationController
  uses_tiny_mce  :options => {
    :theme => 'advanced',
    :plugins => %w{bbcode table},
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "left",
    :theme_advanced_statusbar_location => "bottom",
    :entity_encoding => "raw",
    :theme_advanced_buttons1 => "bold,italic,underline,undo,redo,link,unlink,image,forecolor"
  }
  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    @post.title = "Re: #{@topic.title}"
  end
  
  def create
    params[:post][:content] = CGI::escapeHTML(params[:post][:content])
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
