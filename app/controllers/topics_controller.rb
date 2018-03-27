class TopicsController < ApplicationController
	before_action :set_topic, only: [:show, :edit, :update]


  def index
    @topics = Topic.page(params[:page]).per(15)
  end

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end

  def new
  	@topic = Topic.new
  end

   def show
    redirect_to topic_listings_path(topic_id: @topic)
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to topic_path(topic_id: @topic), notice: 'Topic was successfully created.'
    else
      render :new
   end
  end

   def edit
   end

    def update
    if @topic = Topic.new(topic_params)
      redirect_to topic_path(topic_id: @topic), notice: 'Your topic was successfully updated.'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end

    private

    def topic_params
      params.require(:topic).permit(:title)
    end
end