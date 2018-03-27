class StaticController < ApplicationController
  def home
    @listings = Listing.all
    @topics = Topic.all
  end


end