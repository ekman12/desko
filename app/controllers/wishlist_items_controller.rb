class WishlistItemsController < ApplicationController
  def index
    wishlists = WishlistItem.where(user_id: current_user.id)
    @listing = []
    wishlists.each { |item| @listing << item.listing }
    @listing
    # raise
  end

  def new
    @wishlist = WishlistItem.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @wishlist_check = WishlistItem.where(listing_id: @listing.id, user_id: current_user.id)
    if @wishlist_check.empty?
      @wishlist = WishlistItem.new
      @wishlist.user = current_user
      @wishlist.listing = @listing
      if @wishlist.save
        redirect_to listing_path(@listing)
      else
        render :new
      end
    else
      @wishlist_check.destroy_all
      redirect_to listing_path(@listing)
    end
  end

  def destroy
    raise
    @wishlist = WishlistItem.find(params[:id])
    @wishlist.destroy
  end

end
