class ForumsController < ApplicationController
    
    before_filter :admin?, :only => [:new, :edit, :update, :create]
    def index
      @forums = Forum.without_parent
    end
    
    def show
      @forum = Forum.find(params[:id])
    end

    def new
      @forum = Forum.new
      @submit = "Create"
    end
    
    def edit
      @submit = "Update"
      @forum = Forum.find(params[:id])
    end
    
    def update
      @forum = Forum.find(params[:id])
      if(@forum.update_attributes(params[:forum]))
        flash[:success] = "Forum Successfully updated.."
        redirect_to forums_path
      else
        render 'edit'
      end
    end

    def create
      if ( params[:forum][:parent_id] && !params[:forum][:parent_id].empty? )
        @forum = Forum.find(params[:forum][:parent_id]).forums.build(params[:forum])
      else
        @forum = Forum.new(params[:forum])  
      end
      if @forum.save
        flash[:success] = "Successfully created forum !"
        redirect_to forums_path
      else
        render 'new'
      end
    end
  end
  
