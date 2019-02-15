class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listing = Listing.all
    # raise
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
    # raise
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    # raise
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
