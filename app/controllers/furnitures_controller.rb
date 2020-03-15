class FurnituresController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index] })
  
  def index
    @furnitures = Furniture.all.order({ :created_at => :desc })
    @my_furnitures = @furnitures.where({ :owner_id => @current_user.id})
    render({ :template => "furnitures/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @furniture = Furniture.where({:id => the_id }).at(0)

    render({ :template => "furnitures/show.html.erb" })
  end

  def create
    @furniture = Furniture.new
    @furniture.item = params.fetch("query_item")
    @furniture.original_brand = params.fetch("query_original_brand")
    @furniture.category = params.fetch("query_category")
    @furniture.condition = params.fetch("query_condition")
    @furniture.owner_id = params.fetch("query_owner_id")
    @furniture.price = params.fetch("query_price")
    @furniture.is_available = params.fetch("query_is_available", false)
    @furniture.image = params.fetch("query_image")

    if @furniture.valid?
      @furniture.save
      redirect_to("/furnitures", { :notice => "Furniture created successfully." })
    else
      redirect_to("/furnitures", { :notice => "Furniture failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @furniture = Furniture.where({ :id => the_id }).at(0)

    @furniture.item = params.fetch("query_item")
    @furniture.original_brand = params.fetch("query_original_brand")
    @furniture.category = params.fetch("query_category")
    @furniture.condition = params.fetch("query_condition")
    @furniture.owner_id = params.fetch("query_owner_id")
    @furniture.price = params.fetch("query_price")
    @furniture.is_available = params.fetch("query_is_available", false)
    @furniture.image = params.fetch("query_image")

    if @furniture.valid?
      @furniture.save
      redirect_to("/furnitures/#{@furniture.id}", { :notice => "Furniture updated successfully."} )
    else
      redirect_to("/furnitures/#{@furniture.id}", { :alert => "Furniture failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @furniture = Furniture.where({ :id => the_id }).at(0)

    @furniture.destroy

    redirect_to("/furnitures", { :notice => "Furniture deleted successfully."} )
  end
end
