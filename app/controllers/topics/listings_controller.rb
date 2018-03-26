class Topics::ListingsController < ApplicationController
  before_action :set_topic, except: [:new, :create]

  def index
    @listings = @topic.listings
  end

  def create
  	listing = Listing.new(listing_params)
  	listing.user_id = current_user.id

  	if listing.save
      redirect_to topic_listing_path(topic_id: listing.topic_id, id: listing), notice: 'Your listing was successfully published.'
    else
      render :new
    end
  end

  def new
  end

   def show
    @listing = Listing.find(params[:id])
   end

  private

    def set_topic
      @topic = Topic.friendly.find(params[:topic_id])
    end
end