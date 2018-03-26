class TopicsController < ApplicationController
	before_action :set_topic, only: [:show]


  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
  end

  def set_topic
    @topic = Topic.friendly.find(params[:id])
  end
end