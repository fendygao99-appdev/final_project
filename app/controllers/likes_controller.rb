class LikesController < ApplicationController
  def index
    @likes = Like.all.order({ :created_at => :desc })
    @my_likes = @likes.where({ :furniture_watcher_id => @current_user.id})

    render({ :template => "likes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @like = Like.where({:id => the_id }).at(0)

    render({ :template => "likes/show.html.erb" })
  end

  def create
    @like = Like.new
    @like.furniture_id = params.fetch("query_furniture_id")
    @like.furniture_watcher_id = params.fetch("query_furniture_watcher_id")

    if @like.valid?
      @like.save
      redirect_to("/furnitures/#{@like.furniture.id}", { :notice => "Like created successfully." })
    else
      redirect_to("/furnitures/#{@like.furniture.id}", { :notice => "Like failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @like = Like.where({ :id => the_id }).at(0)

    @like.furniture_id = params.fetch("query_furniture_id")
    @like.furniture_watcher_id = params.fetch("query_furniture_watcher_id")

    if @like.valid?
      @like.save
      redirect_to("/likes/#{@like.id}", { :notice => "Like updated successfully."} )
    else
      redirect_to("/likes/#{@like.id}", { :alert => "Like failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @like = Like.where({ :id => the_id }).at(0)

    @like.destroy

    redirect_to("/users/#{ @current_user.username}", { :notice => "Like deleted successfully."} )
  end
end
