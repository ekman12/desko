class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listing = Listing.all
    @listing_for_marker = Listing.where.not(latitude: nil, longitude: nil)

    @markers = @listing_for_marker.map do |listing|
      {
        lng: listing.longitude,
        lat: listing.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { listing: listing })
      }
    end
  end

  def show
    @listing = Listing.find(params[:id])
    @booking = Booking.new
    @user = current_user
    @wishlist_item = WishlistItem.new
    @wishlist_check = WishlistItem.where(listing_id: @listing.id, user_id: current_user.id) unless current_user.nil?
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
    params.require(:listing).permit(:title, :description, :photo, :location, :workhours, :kitchen, :price, :latitude, :longitude)
  end

end
