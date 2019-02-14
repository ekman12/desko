class ListingsController < ApplicationController
  def index
    @listing = Listing.all
    # raise
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    # raise
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
    # raise
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :photo, :location, :workhours, :kitchen, :price)
  end

end
