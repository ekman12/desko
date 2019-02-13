class ListingsController < ApplicationController
  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
  end

  def create
  end
end
