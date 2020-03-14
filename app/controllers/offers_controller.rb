class OffersController < ApplicationController
  def index
    @offers = Offer.all.order({ :created_at => :desc })

    render({ :template => "offers/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @offer = Offer.where({:id => the_id }).at(0)

    render({ :template => "offers/show.html.erb" })
  end

  def create
    @offer = Offer.new
    @offer.furniture_id = params.fetch("query_furniture_id")
    @offer.furniture_buyer_id = params.fetch("query_furniture_buyer_id")
    @offer.offer_amount = params.fetch("query_offer_amount")
    @offer.offer_accepted = params.fetch("query_offer_accepted", false)

    if @offer.valid?
      @offer.save
      redirect_to("/offers", { :notice => "Offer created successfully." })
    else
      redirect_to("/offers", { :notice => "Offer failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @offer = Offer.where({ :id => the_id }).at(0)

    @offer.furniture_id = params.fetch("query_furniture_id")
    @offer.furniture_buyer_id = params.fetch("query_furniture_buyer_id")
    @offer.offer_amount = params.fetch("query_offer_amount")
    @offer.offer_accepted = params.fetch("query_offer_accepted", false)

    if @offer.valid?
      @offer.save
      redirect_to("/offers/#{@offer.id}", { :notice => "Offer updated successfully."} )
    else
      redirect_to("/offers/#{@offer.id}", { :alert => "Offer failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @offer = Offer.where({ :id => the_id }).at(0)

    @offer.destroy

    redirect_to("/offers", { :notice => "Offer deleted successfully."} )
  end
end
