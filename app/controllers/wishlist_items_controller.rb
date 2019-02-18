class WishlistItemsController < ApplicationController
  def index
    @wishlists = WishlistItem.all
  end

  def new
    @wishlist = WishlistItem.new
    raise
  end


  def create
    @wishlist = WishlistItem.new
    @wishlist.user = current_user
    @listing = Listing.find(params[:listing_id])
    @wishlist.listing = @listing
    if @wishlist.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
  end


end
