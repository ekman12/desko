class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    raise
    if @review.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:booking_id, :content, :rating)
  end
end
