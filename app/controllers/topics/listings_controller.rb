class Topics::ListingsController < ApplicationController
  before_action :set_topic, except: [:new, :create]
  before_action :set_listing, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]


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

  def edit
    if @listing.user_id != current_user.id
      redirect_to topic_listing_path(topic_id: @listing.topic_id, id: @listing), notice: 'Your are not authorized to edit this listing.'
  	end
  end

  def update
    @listing = @topic.listings.find(params[:id])

    if @listing.update(listing_params)
      redirect_to topic_listing_path(topic_id: @listing.topic_id, id: @listing), notice: 'Your listing was successfully updated.'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end

   def show
    @listing = Listing.find(params[:id])
   end

  private

    def set_topic
      @topic = Topic.friendly.find(params[:topic_id])
    end

    def set_listing
      @listing = @topic.listings.find(params[:id])
    end

    def listing_params
        params.require(:listing).permit(:title, :price, :decription, :author, :topic_id)
    end
end