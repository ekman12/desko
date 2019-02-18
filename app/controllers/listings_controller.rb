class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listing = Listing.all
    # raise
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @user = current_user
    @wishlist_item = WishlistItem.new
    @wishlist_check = WishlistItem.where(listing_id: @listing.id, user_id: current_user.id)
    # raise
  end

  def new
    @listing = Listing.new
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
