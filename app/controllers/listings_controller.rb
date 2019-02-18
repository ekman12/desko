class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @listing = Listing.all
    @listing_for_marker = Listing.where.not(latitude: nil, longitude: nil)

    @markers = @listing_for_marker.map do |listing|
      {
        lng: listing.longitude,
        lat: listing.latitude,
        # infoWindow: render_to_string(partial: "infowindow", locals: { listing: listing })
      }
    end
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
    params.require(:listing).permit(:title, :description, :photo, :location, :workhours, :kitchen, :price, :latitude, :longitude)
  end

end
